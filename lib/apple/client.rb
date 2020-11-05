require "openssl"
require 'jwt'
require 'httparty'
class Client
  attr_accessor :key_content
  attr_accessor :key_id
  attr_accessor :team_id
  attr_accessor :client_id

  def initialize
  end

  def post(path, params={})
    params[:client_id] = client_id
    params[:client_secret] = client_secret
    headers = {
      "Authorization" => "Bearer #{access_token}",
      "Content-Type" => "application/x-www-form-urlencoded"
    }
    r = HTTParty.post("https://appleid.apple.com#{path}", body: params, headers: headers)
    JSON.parse(r.body)
  end

  private

  def access_token
    params = {
      grant_type: "client_credentials",
      scope: "user.migration",
      client_id: client_id,
      client_secret: client_secret
    }
    headers = {
      "Content-Type" => "application/x-www-form-urlencoded"
    }
    r = HTTParty.post('https://appleid.apple.com/auth/token', body: params, headers: headers)
    JSON.parse(r.body)["access_token"]
  end

  def client_secret
    validity_period = 180 
    private_key = OpenSSL::PKey::EC.new(key_content)

    token = JWT.encode(
      {
        iss: team_id,
        iat: Time.now.to_i,
        exp: Time.now.to_i + 86400 * validity_period,
        aud: "https://appleid.apple.com",
        sub: client_id
      },
      private_key,
      "ES256",
      header_fields=
      {
        kid: key_id 
      }
    )
  end
end
