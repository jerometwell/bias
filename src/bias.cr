require "colorize"
require "./speech"

class ExitException < Exception
end


class Bias
  VERSION = "0.1.0"
  @history = [] of String

  def intro
    Speech.say "Welcome to {}//A23 v#{VERSION}\n"
    Speech.say "-----"
  end

  def exit
    Speech.say "Exiting..."
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
      Speech.say "history:"
      @history.each do |x|
        Speech.say x
      end
      return
    end
    if input == "clear"
      print "\r\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    end
    @history.push input
    Speech.say("[#{@history.size}] command not found: #{input}")

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