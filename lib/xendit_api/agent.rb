module XenditAPI
  class Agent
    def initialize(client)
      @client = client
    end

    def virtual_account
      @virtual_account ||= VirtualAccount.new(@client)
    end
  end
end
