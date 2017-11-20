Given("a customer is logged in") do
  @customer = Customer.create!
  page.set_rack_session(customer_id: @customer.id)
end

Given("They are on the new profile page") do
  visit new_profile_path
end

Given("They have filled out all required fields") do
  fill_in "Display name", with: "Ben123"
end

When("They submit the new form") do
  click_on "Submit"
end

Then("Their profile is created") do
  expect(Profile.last.display_name).to eq("Ben123")
end

Then("They are redirected to their profile page") do
  expect(page).to have_content("Name: Ben123")
end
