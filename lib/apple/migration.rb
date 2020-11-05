class Migration
  attr_accessor :old_client
  attr_accessor :new_client
  attr_accessor :sub

  def initialize
  end

  def migrate!
    response = old_client.post(
      "/auth/usermigrationinfo",
      {
        sub: sub,
        target: new_client.team_id
      }
    )
    transfer_sub = response["transfer_sub"]
    return "NO_TRANSFER_SUB!!!" if transfer_sub.nil?
    transfer_response = new_client.post(
      "/auth/usermigrationinfo",
      {
        transfer_sub: transfer_sub,
      }
    )
  end
end