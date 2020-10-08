require "colorize"

class ExitException < Exception
end

class Bias
  VERSION = "0.1.0"
  @history = [] of String

  def intro
    puts "Welcome to {}//A23 v#{VERSION}\n"
  end

  def exit
    puts "Exiting..."
  end

  def prompt
    return gets.not_nil!
  end

  def process
    print "> "
    input = prompt
    if input == "exit"
      raise ExitException.new
    end
    if input == "history"
      puts "history:"
      @history.each do |x|
        puts x
      end
      return
    end
    if input == "clear"
      print "\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    end
    @history.push input
    puts "[#{@history.size}] command not found: #{input}"
  end

  def run
    intro

    # ignore an interrupt
    ::Signal::INT.trap do
      print "\r>                                        \n> "
    end

    loop do
      begin
        process
      rescue
        break
      end
    end

    exit
  end
end
