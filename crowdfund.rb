require_relative 'fundrequest'

startup = FundRequest.new("VC-Friendly Start-up Projects")
startup.from_file(ARGV.shift || "projects.csv")

loop do
  puts "\nHow many funding rounds? ('quit' to exit)"
  answer = gets.chomp
  case answer
  when /^\d+$/
    rounds = Integer(answer)
    startup.request_funding(rounds)
  when 'quit', 'exit'
    startup.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

startup.save_under_funded
