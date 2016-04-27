require 'rails_helper'

RSpec.describe "mailers/new", type: :view do
  before(:each) do
    assign(:mailer, Mailer.new(
      :name => "MyString",
      :email => "MyString",
      :login => "MyString"
    ))
  end

  it "renders new mailer form" do
    render

    assert_select "form[action=?][method=?]", mailers_path, "post" do

      assert_select "input#mailer_name[name=?]", "mailer[name]"

      assert_select "input#mailer_email[name=?]", "mailer[email]"

      assert_select "input#mailer_login[name=?]", "mailer[login]"
    end
  end
end
