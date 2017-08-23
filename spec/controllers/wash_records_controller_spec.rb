require 'rails_helper'

RSpec.describe WashRecordsController, type: :controller do
  it "Should direct to registration path if not signed in" do
    get :new
       expect(response).to redirect_to (new_user_session_path)
  end

  before(:each) do
      @user = FactoryGirl.create(:user)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  it "If logged in. You should be able to go to new carwash view" do
    sign_in @user
    get :new
    expect(response).to render_template("new")
  end

end
