require "colorize"
require "./speech"
require "./txt"

class ExitException < Exception
end


class Bias
  VERSION = "0.1.0"
  @history = [] of String

  def intro
    Speech.say "starting..."
    Speech.say "..............", buffer: 1, delay: 0.5
    Speech.say LOGO, buffer: 3, delay: 0.001, min_delay: 0.001
    Speech.say "bias/v#{VERSION}\n"
    Speech.say "err: failsafe indicates logical malfunction @5b27ddecc192"
    Speech.say "uptime: -2147483647 ▒▒up -00002147483647 days, -▒▒▒9:02, 2 users,"
    Speech.say "time alloc #{Time.utc}"
    Speech.say "external temp: #{Random.rand(5)+ 20}C"
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
    if input == "ls"
      Speech.say "drw-r--r--    1 bias  bias    ??K  4 ?ct 16:25 ."
      Speech.say "-r?--?-?--    1 ????  ?ia?    ??K  9 ?c? 00:10 .?????s?D??"
      Speech.say "-r???▒▒▒??    ? ????  ????    ??? ▒ ????▒ 00:10 .??p????"
      Speech.say "??????????    ? ????▒▒▒???  ▒▒?▒?  ???▒? ??:?? .??p????"
      Speech.say "??????????▒▒▒▒? ????  ????    ???▒▒?▒▒?? ??:?? .???????"
      Speech.say "▒▒▒???????////?/???? / ???//  ???  ?▒?▒? ??:?? .???????"
      Speech.say "err: journal corrupt"
      return
    end

    if input == "shutdown"
     Speech.say "Nice try."
    end
    @history.push input
    Speech.say("ERR_LOCAL: access denied: #{input}")

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
