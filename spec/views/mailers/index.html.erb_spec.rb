require 'rails_helper'

RSpec.describe "mailers/index", type: :view do
  before(:each) do
    assign(:mailers, [
      Mailer.create!(
        :name => "Name",
        :email => "Email",
        :login => "Login"
      ),
      Mailer.create!(
        :name => "Name",
        :email => "Email",
        :login => "Login"
      )
    ])
  end

  it "renders a list of mailers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
  end
end
