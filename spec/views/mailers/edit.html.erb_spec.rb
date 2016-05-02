require 'rails_helper'

RSpec.describe "mailers/edit", type: :view do
  before(:each) do
    @mailer = assign(:mailer, Mailer.create!(
      :name => "MyString",
      :email => "MyString",
      :login => "MyString"
    ))
  end

  it "renders the edit mailer form" do
    render

    assert_select "form[action=?][method=?]", mailer_path(@mailer), "post" do

      assert_select "input#mailer_name[name=?]", "mailer[name]"

      assert_select "input#mailer_email[name=?]", "mailer[email]"

      assert_select "input#mailer_login[name=?]", "mailer[login]"
    end
  end
end
