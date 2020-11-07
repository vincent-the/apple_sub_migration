# apple_sub_migration

## Usage

### 1, Install Gems: 

```shell
bundle install
```

### 2, Configure Cliens

Open `apple.rb` and change Client Options

```ruby

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

```
### 3, Set Apple Sub

Open `apple.rb` and change the Sub
```ruby
migration.sub = 'XXX'
```
### 4, Run Migration: 

```shell
ruby ./lib/apple.rb
```
