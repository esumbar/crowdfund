current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%Y %I:%M%p")
puts "It is currently #{formatted_time}\n"

project1 = 'ABC'
funding1 = 1000

project2 = 'LMN'
funding2 = 2000

project3 = 'XYZ'
funding3 = 23000

puts "Projects:"
puts "\tProject #{project1} has $#{funding1} in funding."
puts "\tProject #{project2} has $#{funding2} in funding."
puts "\tProject #{project3} has $#{funding3} in funding."
