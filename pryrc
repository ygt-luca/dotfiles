begin
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
rescue
  puts "pry-nav gem is not installed, continue/step/next will not be available"
end

class Object
  def interesting_methods
    case self.class
    when Class
      (self.public_methods - Object.public_methods).sort
    when Module
      (self.public_methods - Module.public_methods).sort
    else
      (self.public_methods - Object.new.public_methods).sort
    end
  end

  def imeth
    interesting_methods
  end
end
