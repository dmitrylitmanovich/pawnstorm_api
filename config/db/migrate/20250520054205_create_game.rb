ROM::SQL.migration do
  change do
    create_table :games do
      primary_key :id
      foreign_key :white_id, :players
      foreign_key :black_id, :players
      column :state, String, default: "waiting"
    end
  end
end
