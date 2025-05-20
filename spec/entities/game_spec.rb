RSpec.describe PawnstormAPI::Entities::Game, type: :entity do
  it "creates a game with player IDs and default status" do
    game = described_class.new(white_id: 1, black_id: 2, id: 1)
    expect(game.white_id).to eq(1)
    expect(game.black_id).to eq(2)
    expect(game.state).to eq("waiting")
  end
end
