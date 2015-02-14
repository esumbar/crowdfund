def today
  current_time = Time.new
  current_time.strftime("%A %m/%d/%Y")
end

def say_funding(project, funding=10000)
  "Project #{project.upcase} has $#{funding} in funding as of #{today}"
end

puts "Projects:"
puts say_funding("abc", 1000)
puts say_funding("lmn")
puts say_funding("xyz", 23000)
