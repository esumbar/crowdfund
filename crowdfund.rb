require_relative 'fundrequest'

project1 = Project.new("lmn", 500, 3000)
project2 = Project.new("xyz", 25, 75)

startup = FundRequest.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.request_funding
