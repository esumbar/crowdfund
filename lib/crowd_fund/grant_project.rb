require_relative 'project'

module CrowdFund
  class GrantProject < Project  

    def remove_funds(less_funds)
      puts "Can not remove funds from grant project #{@name}"
    end

  end
end
