RSpec.describe PawnstormAPI::Entities::Player, type: :entity do
  it "creates a new player with a username" do
    player = described_class.new(username: "PawnMaster", id: 1)
    expect(player.username).to eq("PawnMaster")
  end
end
