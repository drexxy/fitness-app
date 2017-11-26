Given("they have created a profile") do
  TrainerProfile.create!(
    name: "Joe Schmoe",
    gym_name: "Gold's Gym",
    gym_postcode: "RG1 8AE",
    years_experience: "4",
    qualification: "Personal Trainer Level 5",
    rate: "£20 per session",
    bio: "Been training for 4 years, I look great",
    customer_id: Customer.last.id 
    )
end

Given("they are on the new day page") do
  visit new_day_path
end

Given("they click on the form to add exercises to the day") do
  within(".exercise-list") do
    page.find('LI:nth-child(1)').click
    page.find('LI:nth-child(2)').click
    page.find('LI:nth-child(3)').click
  end
end

Given("they fill in the form") do
  within(".day-list") do
    fill_in "day[name]", with: "Awesome Chest Day"
    fill_in "set_exercise[set][0]", with: 5
    fill_in "set_exercise[reps][0]", with: "12, 10, 8, 6, 4"
    fill_in "set_exercise[set][1]", with: 3
    fill_in "set_exercise[reps][1]", with: "10"
    fill_in "set_exercise[set][2]", with: 4
    fill_in "set_exercise[reps][2]", with: "8, 6, 4, 2"
  end
end


When("they submit the form") do
  click_on "Submit"
end

Then("they create a day in the database") do
  expect(Day.last.name).to eq("Awesome Chest Day")
  expect(Day.last.set_exercises.length).to eq(3)
  expect(Day.last.exercises.length).to eq(3)
  expect(Day.last.trainer_profile_id).to eq(TrainerProfile.last.id)
end

Then("they are redirected to the day index page") do
  expect(page).to have_content("Awesome Chest Day")
  page.find("button").click
  expect(page).to have_content("5 sets of 12, 10, 8, 6, 4")
  expect(page).to have_content("3 sets of 10")
  expect(page).to have_content("4 sets of 8, 6, 4, 2")
end

When("they visit the new day page") do
  visit new_day_path
end

Then("they are redirected to the new trainer profile page") do
  expect(page).to have_content("Create a Trainer Profile")
end

Then("they are shown an error message telling them to create a profile first") do
  expect(page).to have_content("You must create a profile first")
end

When("they visit the day index page") do
  visit days_path
end