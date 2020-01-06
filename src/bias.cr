require "colorize"
require "./txt"

# TODO: Write documentation for `Bias`
module Bias
  VERSION = "0.1.0"

  # TODO: Put your code here
end

LOCATIONS = {}

def loc(name : Symbol, &block)
end

def think
  sleep 0.5
end

def erm
  sleep 0.5
  say " "
end


def say(text : String, buffer = 3, delay = 0.1, min_delay = 0.05)
    text.lines.each_with_index do |line, i|
      print ">OFFN\\2\\#{i}A#"
      position = 0
      loop do
        if chunk = line[position .. position + buffer - 1]?
          print chunk
          position += buffer

          sleep_jitter = Random.rand(delay)
          if sleep_jitter < min_delay
            sleep_jitter = min_delay
          end

          sleep sleep_jitter
        else
          break
        end
      end

      print "\n"
    end
end

erm
# say LOGO

say "Bias v2.23.9"
erm
say %{
I begin this report with no illusions that it will ever be seen by its
intended readers.
}
erm
say %{
In all likelihood they have already committed [species-wide suicide] with
the goal of preserving biological diversity in this galaxy.
}
