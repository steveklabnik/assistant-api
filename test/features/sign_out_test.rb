require "test_helper"

class SignOutTest < Capybara::Rails::TestCase
  let(:shop) do
    Shop.create(
      name: "Artisan",
      email: "artisan@example.com",
      password: "password",
      password_confirmation: "password",
    )
  end

  def sign_in
    shop # make sure our shop exists

    visit sign_in_path

    page.must_have_content "Sign in"
    page.must_have_button "Sign in"

    within("#session") do
      fill_in "Email", :with => "artisan@example.com"
      fill_in "Password", :with => "password"
    end

    click_button "Sign in"
  end

  test "When signed in, the home page has a sign out link" do
    sign_in 

    visit root_path
 
    page.must_have_link "Sign out"
  end
end
