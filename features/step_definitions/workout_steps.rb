Given("the personal trainer has created some days") do
  @day_1 = Day.create!(name: "Chest Day", trainer_profile_id: TrainerProfile.first.id, set_exercises_attributes: [{sets: 5, reps: "6", exercise_id: Exercise.first.id}])
  @day_2 = Day.create!(name: "Back Day", trainer_profile_id: TrainerProfile.first.id, set_exercises_attributes: [{sets: 5, reps: "8", exercise_id: Exercise.second.id}])
  @day_3 = Day.create!(name: "Leg Day", trainer_profile_id: TrainerProfile.first.id, set_exercises_attributes: [{sets: 5, reps: "10", exercise_id: Exercise.third.id}])
end

Given("they are on the new workout page") do
  visit new_workout_path
end

Given("they have filled out the workout form") do
  fill_in "workout[name]", with: "Ben's Ultimate Workout"
  select "Expert", from: "workout[difficulty]"
  select "Put on Muscle", from: "workout[purpose]"
end

Given("they click on some days") do
  within(".day-workout-list") do
    page.find('LI:nth-child(1)').click
    page.find('LI:nth-child(2)').click
    page.find('LI:nth-child(3)').click
  end
end

Then("a workout is created") do
  expect(Workout.last.name).to eq("Ben's Ultimate Workout")
  expect(Workout.last.difficulty).to eq("Expert")
  expect(Workout.last.purpose).to eq("Put on muscle")
  expect(Workout.last.days.length).to eq(3)
end

Given("another trainer has created a day") do
  Customer.create!(email: "scott@lift.com", password: "password")
  TrainerProfile.create!(
    name: "Hot Scott",
    gym_name: "Gold's Gym",
    gym_postcode: "RG1 8AE",
    years_experience: "4",
    qualification: "Personal Trainer Level 5",
    rate: "£20 per session",
    bio: "Been training for 4 years, I look great",
    customer_id: Customer.last.id 
    )
  @day_3 = Day.create!(name: "Arms Day", trainer_profile_id: TrainerProfile.last.id, set_exercises_attributes: [{sets: 5, reps: "10", exercise_id: Exercise.third.id}])
end


When("they visit the new workout page") do
  visit new_workout_path
end

Then("they see only the days they have made") do
  expect(page).to have_content("Chest Day")
  expect(page).to have_content("Back Day")
  expect(page).to have_content("Leg Day")
  expect(page).to have_no_content("Arms Day")
end
