puts "ruby.#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"

# Usage: source_for(Person.new, :update)
#
def source_for(object, method)
  location = object.method(method).source_location
  `subl #{location[0]}:#{location[1]}` if location
  location
end

# ruby 1.8.7 compatible
require 'rubygems'
require 'irb/completion'
require 'pp'

# # interactive editor: use vim from within irb
# begin
#   require 'interactive_editor'
# rescue LoadError => err
#   warn "Couldn't load interactive_editor: #{err}"
# end

# # awesome print
# begin
#   require 'awesome_print'
#   AwesomePrint.irb!
# rescue LoadError => err
#   warn "Couldn't load awesome_print: #{err}"
# end

# configure irb
IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => "",
  :PROMPT_S => "%l",
  :PROMPT_C => "",
  :PROMPT_N => "",
  :RETURN => "# => %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
IRB.conf[:AUTO_INDENT] = false

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')

if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end

  def imeth
    interesting_methods
  end
end

