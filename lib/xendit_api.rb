require "xendit_api/version"
require "xendit_api/params"
require "xendit_api/request_error"
require "xendit_api/client"
require "xendit_api/agent"
require "xendit_api/virtual_account"

module XenditAPI
  def self.connect(secret_key = nil, api_host = nil)
    client = Client.new(secret_key: secret_key, api_host: api_host)
    agent = Agent.new(client)
  end
end
