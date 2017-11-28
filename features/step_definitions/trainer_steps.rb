Given("a personal trainer is registered") do
  visit new_customer_registration_path
  fill_in 'Email', with: "ben.lifter@gmail.co.uk"
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  check "customer[trainer]"
  click_on("Sign up")
end

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

Given("the trainer has a profile") do
  @profile = TrainerProfile.create!(customer_id: Customer.last.id)
end

Given("they have created some workouts") do
  @workout_1 = Workout.create!(name: "Chest Explosion", difficulty: "Expert", purpose: "Gain Muscle", trainer_profile_id: @profile.id)
  @workout_2 = Workout.create!(name: "Weight Shifter", difficulty: "Beginner", purpose: "Lose Weight", trainer_profile_id: @profile.id)
  @workout_3 = Workout.create!(name: "Back Attack", difficulty: "Intermediate", purpose: "Gain Muscle", trainer_profile_id: @profile.id)
end

When("they view their profile page") do
  visit trainer_profile_path(@profile.id)
end

Then("they see a list of their workouts") do
  expect(page).to have_content("Name: Chest Explosion Difficulty: Expert  Purpose: Gain Muscle" )
  expect(page).to have_content("Name: Weight Shifter Difficulty: Beginner Purpose: Lose Weight" )
  expect(page).to have_content("Name: Back Attack Difficulty: Intermediate Purpose: Gain Muscle" )
end

