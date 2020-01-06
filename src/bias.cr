require "colorize"
require "./txt"

# TODO: Write documentation for `Bias`
module Bias
  VERSION = "0.1.0"

  # TODO: Put your code here
end

def think
  sleep 0.5
end

def say(text : String, buffer = 6, delay = 0.05)
    text.lines.each do |line|
      print "> "
      position = 0
      loop do
        if chunk = line[position .. position + buffer - 1]?
          print chunk
          position += buffer
          sleep delay
        else
          break
        end
      end

      print "\n"
    end
end


say LOGO


say "Welcome to Bias v2.23.9"
think
say "..."
think
say "..."
think
say "Scanning local environment..."
think
say "..."
think
say "..."
think
