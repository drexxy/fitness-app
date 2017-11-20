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

Given("They have filled out the username field with an invalid name") do
  fill_in "Display name", with: "Ben$"
end

Then("They are returned to the new profile page") do
  expect(page).to have_content("Create a Profile")
end

Then("they are shown an error message stating the problem") do
  expect(page).to have_content("Display name only allows letters and numbers")
  expect(page).to have_content("Display name is too short")
end

Given("There are some goals") do
  Goal.create!(name: "Lose weight")
  Goal.create!(name: "Put on muscle")
end

Given("They select a goal from the drop down menu") do
  select "Put on muscle", from: "Goal" 
end

Then("They see thier goal") do
  expect(page).to have_content("Put on muscle")
end