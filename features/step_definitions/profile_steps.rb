Given("a customer is registered") do
  visit new_customer_registration_path
  fill_in 'Email', with: "ben.lifter@gmail.co.uk"
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_on("Sign up")
end

Given("they have confirmed their account") do
  Customer.first.confirm
end

Given("they have logged in") do
  visit new_customer_session_path
  fill_in 'Email', with: "ben.lifter@gmail.co.uk"
  fill_in 'Password', with: 'password'
  click_on("Log in")
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

Given("They select the number of days they train") do
  select "4", from: "How many days a week will you train?"
end

Then("They see the number of days listed") do
  expect(page).to have_content("Days per week: 4")
end

Given("They select their level of experience") do
  select "Intermediate", from: "Level of experience"
end

Then("They see their level of experience listed") do
  expect(page).to have_content("Experience: Intermediate")
end

Given("They fill in their weight") do
  fill_in "Weight in Kg", with: 100.2
end

Then("They see their weight listed") do
  expect(page).to have_content("Weight: 100.2")
end
