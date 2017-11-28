module XenditAPI
  class VirtualAccount
    def initialize(client)
      @client = client
    end

    def create(external_id:, bank_code:, name:)
      @client.post("/callback_virtual_accounts", {
        external_id: external_id,
        bank_code: bank_code,
        name: name
      })
    end

    def get(id)
      @client.get("/callback_virtual_accounts/#{id}")
    end
  end
end
