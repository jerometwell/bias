module Speech
  extend self
  def think
    sleep 0.5
  end
  
  def erm
    sleep 0.5
    say " "
  end
  
  
  def say(text : String, buffer = 3, delay = 0.1, min_delay = 0.05)
    text.lines.each_with_index do |line, i|
      print "[>BIAS:#{i}] "
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
end
