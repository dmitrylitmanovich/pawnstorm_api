# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :email, String, null: false, unique: true
      column :password_digest, String, null: false
      column :created_at, DateTime, null: false
    end
  end
end
