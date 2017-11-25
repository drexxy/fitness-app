Given("a personal trainer is logged in") do
  @trainer = Trainer.create!
  page.set_rack_session(customer_id: @trainer.id)
end

Given("the personal trainer has created some days") do
  @day_1 = Day.create!(name: "Chest Day", set_exercises_attributes: [{sets: 5, reps: "6", exercise_id: Exercise.first.id}])
  @day_2 = Day.create!(name: "Back Day", set_exercises_attributes: [{sets: 5, reps: "8", exercise_id: Exercise.second.id}])
  @day_3 = Day.create!(name: "Leg Day", set_exercises_attributes: [{sets: 5, reps: "10", exercise_id: Exercise.third.id}])
end

Given("they are on the new workout page") do
  visit new_workout_path
end

Given("they have filled out the workout form") do
  fill_in "workout[name]", with: "Ben's Ultimate Workout"
  select "Hard", from: "workout[difficulty]"
  select "Put on Muscle", from: "workout[purpose]"
end

Given("they click on some days") do
  within(".day-list") do
    page.find('LI:nth-child(1)').click
    page.find('LI:nth-child(2)').click
    page.find('LI:nth-child(3)').click
  end
end

Then("a workout is created") do
  expect(Workout.last.name).to eq("Ben's Ultimate Workout")
  expect(Workout.last.difficulty).to eq("hard")
  expect(Workout.last.purpose).to eq("put on muscle")
  expect(Workout.last.days.length).to eq(3)
end