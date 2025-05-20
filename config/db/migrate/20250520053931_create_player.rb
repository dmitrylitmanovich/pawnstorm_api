ROM::SQL.migration do
  change do
    create_table :players do
      primary_key :id
      column :username, String, null: false
    end
  end
end
