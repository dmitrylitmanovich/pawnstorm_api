RSpec.describe "POST /auth/register", type: :request do
  it "registers a new user" do
    post "/auth/register", { email: "test@example.com", password: "secret" }
    expect(last_response.status).to eq(201)
    expect(JSON.parse(last_response.body)["token"]).not_to be_nil
  end

  it "rejects duplicate email" do
    post "/auth/register", { email: "test@example.com", password: "secret" }
    post "/auth/register", { email: "test@example.com", password: "another" }
    expect(last_response.status).to eq(409)
  end
end
