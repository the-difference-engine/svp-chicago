require 'rails_helper'

RSpec.describe "mailers/show", type: :view do
  before(:each) do
    @mailer = assign(:mailer, Mailer.create!(
      :name => "Name",
      :email => "Email",
      :login => "Login"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Login/)
  end
end
