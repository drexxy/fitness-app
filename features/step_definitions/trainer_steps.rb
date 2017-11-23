Given("they are on the new trainer profile page") do
  visit new_trainer_profile_path
end

Given("they have filled out the trainer profile form") do
  fill_in "Name", with: "Ben Hornsby"
  fill_in "Gym name", with: "Gold's Gym"
  fill_in "Gym postcode", with: "RG1 8AE"
  fill_in "Years experience", with: "4"
  fill_in "Qualification", with: "Personal Trainer Level 5"
  fill_in "Rate", with: "£20 per session"
  fill_in "Bio", with: "Been training for 4 years, I look great" 
end

Then("they create a profile in the database") do
  expect(TrainerProfile.last.name).to eq("Ben Hornsby")
  expect(TrainerProfile.last.gym_name).to eq("Gold's Gym")
  expect(TrainerProfile.last.gym_postcode).to eq("RG1 8AE")
  expect(TrainerProfile.last.years_experience).to eq("4")
  expect(TrainerProfile.last.qualification).to eq("Personal Trainer Level 5")
  expect(TrainerProfile.last.rate).to eq("£20 per session")
  expect(TrainerProfile.last.bio).to eq("Been training for 4 years, I look great")
end

Then("they are redirected to their profile page") do
  expect(page).to have_content("Name: Ben Hornsby")
  expect(page).to have_content("Gym Name: Gold's Gym")
  expect(page).to have_content("Years Experience: 4")
  expect(page).to have_content("Qualification: Personal Trainer Level 5")
  expect(page).to have_content("Rate: £20 per session")
  expect(page).to have_content("Bio: Been training for 4 years, I look great")
end
