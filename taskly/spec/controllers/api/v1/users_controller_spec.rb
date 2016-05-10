require "rails_helper"

RSpec.describe "api v1 request", :type => :request do
  describe "GET /api/v1/users" do
    before { @user = User.create(name: 'Alex', email: 'alex@ironhack.com')}
    it "return a list of users" do
      get api_v1_users_path(format: :json)
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq(1)
    end
  end

  describe "POST /api/v1/users" do
    it "create a new user" do
      post api_v1_users_path(format: :json), user: {name: 'Alex', email: 'alex@ironhack.com'}
      data = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(User.last.name).to eq('Alex')
    end
  end
end