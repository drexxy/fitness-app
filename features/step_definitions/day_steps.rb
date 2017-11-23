

Given("they are on the new day page") do
  visit new_day_path
end

Given("they click on the form to add exercises to the day") do
  save_and_open_page
  click_on(page.find('OL:first-child'))
end

When("they submit the form") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("they create a day in the database") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("they are redirected to the day show page") do
  pending # Write code here that turns the phrase above into concrete actions
end
