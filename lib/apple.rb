require_relative 'apple/migration.rb'
require_relative 'apple/client.rb'

class Apple
  def self.test
    migration = Migration.new

    migration.sub = 'XXX'
    migration.old_client = old_client
    migration.new_client = new_client
    migration.migrate!
  end

  private

  def self.new_client
    client = Client.new
    client.key_content = '-----BEGIN PRIVATE KEY-----\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n-----END PRIVATE KEY-----\n'
    client.team_id = 'XXX'
    client.key_id = 'XXX'
    client.client_id = 'XXX'
    client
  end

  def self.old_client
    client = Client.new
    client.key_content = '-----BEGIN PRIVATE KEY-----\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n-----END PRIVATE KEY-----\n'
    client.team_id = 'XXX'
    client.key_id = 'XXX'
    client.client_id = 'XXX'
    client
  end
end

puts Apple.test