Given("they have created a profile with a goal") do
  Profile.create!(
    display_name: "Ben123",
    days: 4,
    weight: 100,
    experience: "Beginner",
    goal_id: 1,
    customer_id: Customer.last.id
    )
end

Given("there are some workouts") do
  Customer.create(email: "ben@123.com", password: "password", trainer: true)

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

  4.times do
    Day.create!(name: "Chest Day", trainer_profile_id: TrainerProfile.first.id)
  end

  @set_exercise_1 = SetExercise.create!(sets: 5, reps: "6", exercise_id: Exercise.first.id, day_id: Day.first.id)
  @set_exercise_2 = SetExercise.create!(sets: 5, reps: "6", exercise_id: Exercise.first.id, day_id: Day.second.id)
  @set_exercise_3 = SetExercise.create!(sets: 5, reps: "6", exercise_id: Exercise.first.id, day_id: Day.third.id)
  @set_exercise_3 = SetExercise.create!(sets: 5, reps: "6", exercise_id: Exercise.first.id, day_id: Day.fourth.id)

  @workout_1 = Workout.create!(name:"Workout 1", difficulty: "Beginner", purpose: "Lose weight", day_count: 4, days: [Day.first, Day.second, Day.third, Day.fourth])
  @workout_2 = Workout.create!(name:"Workout 2", difficulty: "Expert", purpose: "Put on muscle", day_count: 4, days: [Day.first, Day.second, Day.third, Day.fourth]) 
  @workout_3 = Workout.create!(name:"Workout 3", difficulty: "Beginner", purpose: "Put on muscle", day_count: 4, days: [Day.first, Day.second, Day.third, Day.fourth])
  @workout_4 = Workout.create!(name:"Workout 4", difficulty: "Beginner", purpose: "Put on muscle", day_count: 3, days: [Day.first, Day.second, Day.third])
end

Given("they are viewing their profile") do
  visit profile_path(Customer.first.id)
end

When("they click on the Find Workouts Button") do
  click_on("Find a Workout")
end

Then("they are shown a list of workouts that fufill their criteria") do
  expect(page).to have_content("Workout 1")
  expect(page).to have_no_content("Workout 2")
  expect(page).to have_no_content("Workout 3")
  expect(page).to have_no_content("Workout 4")
end

Given("they are viewing the workout matching page") do
  visit matches_profile_path(Customer.first.id)
end

When("they click to select a workout") do
  click_on("Select Workout") 
end

Then("their choice of workout appears on their profile page") do
  expect(page).to have_content("Workout 1")
end

