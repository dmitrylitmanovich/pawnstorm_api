RSpec.describe "POST /auth/register", type: :request do
  let(:app) { Hanami.app }
  let(:user_repo) { app["repos.user_repo"] }

  before { user_repo.clear }

  it "registers a new user and returns token" do
    post "/auth/register", { email: "test@example.com", password: "secret" }

    expect(last_response.status).to eq(201)
    json = JSON.parse(last_response.body)
    expect(json["token"]).not_to be_nil
  end

  it "rejects duplicate email" do
    user_repo.create(email: "test@example.com", password_digest: "hash", created_at: Time.now)

    post "/auth/register", { email: "test@example.com", password: "secret" }

    expect(last_response.status).to eq(409)
  end
end
