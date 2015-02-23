require_relative 'fundrequest'

project1 = Project.new("lmn", 200, 100)
project2 = Project.new("xyz", 75, 25)

startup = FundRequest.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)

startup.request_funding(10)
startup.print_stats
