Given("an admin is on the new exercise page") do
  visit new_exercise_path
end

Given("they have filled out the form") do
  fill_in "Name", with: "Bench Press"
  select "Chest", from: "Muscle group"
  fill_in "Description", with: "Lift the big weight"
  choose "exercise_category_compound"
end

Then("an exercise is created") do
  @exercise = Exercise.last
  expect(@exercise.name).to eq("Bench Press")
  expect(@exercise.muscle_group).to eq("Chest")
  expect(@exercise.description).to eq("Lift the big weight")
  expect(@exercise.category).to eq("Compound")
end

Then("they are redirected to the exercise show page") do
  expect(page).to have_content("Bench Press")
  expect(page).to have_content("Chest")
  expect(page).to have_content("Compound")
  expect(page).to have_content("Lift the big weight")
end

Given("there is already an exercise") do
  @exercise = Exercise.create!(
    name: "Bench Press",
    muscle_group: "Chest",
    description: "Lift the big weight",
    category: "Compound"
    )
end

Then("they are redirected to the new exercise page") do
  expect(page).to have_content("Add an exercise")
end

Then("they are shown an error message") do
  expect(page).to have_content("Name has already been taken")
end
