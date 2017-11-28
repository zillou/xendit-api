require "base64"
require 'net/http'
require 'json'

module XenditAPI
  class Client
    def initialize(secret_key: nil, api_host: nil)
      @secret_key = secret_key || ENV["XENDIT_SECRET_KEY"]
      @api_host = api_host || ENV["XENDIT_API_HOST"] || "https://api.xendit.co"
    end

    def get(request_uri, params = {})
      uri = URI(@api_host + request_uri)
      uri.query = Params.encode(params)

      message = Net::HTTP::Get.new(uri.request_uri)
      message["authorization"] = auth_header

      request(uri, message)
    end

    def post(request_uri, params = {})
      uri = URI(@api_host + request_uri)

      message = Net::HTTP::Post.new(uri.request_uri)
      message["authorization"] = auth_header
      message.form_data = params

      request(uri, message)
    end

    private

    def auth_header
      token = Base64.encode64("#{@secret_key}::").gsub("\n", "")
      "Basic #{token}"
    end


    def request(uri, message)
      http = Net::HTTP.new(uri.host, Net::HTTP.https_default_port)

      http.use_ssl = true

      http_response = http.request(message)

      case http_response
      when Net::HTTPSuccess
        if block_given?
          yield http_response
        else
          if http_response['Content-Type'].split(';').first == 'application/json'
            JSON.parse(http_response.body)
          else
            http_response.body
          end
        end
      when Net::HTTPNoContent
        :no_content
      else
        raise RequestError, "#{http_response.code} response from #{uri.host}"
      end
    end
  end
end
