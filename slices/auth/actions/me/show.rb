module Auth::Actions::Me
  class Show < Hanami::Action
    def handle(request, response)
      user = request.env["current_user"]
      response.body = { id: user.id, email: user.email }.to_json
    end
  end
end
