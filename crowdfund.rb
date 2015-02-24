require_relative 'fundrequest'

project1 = Project.new("abc", 100, 10)
project2 = Project.new("lmn", 200, 100)
project3 = Project.new("xyz", 75, 25)

startup = FundRequest.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.add_project(project3)

startup.request_funding(2)
startup.print_stats
