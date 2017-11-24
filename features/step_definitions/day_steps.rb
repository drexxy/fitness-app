

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
  within(".workout-list") do
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
end

Then("they are redirected to the day index page") do
  expect(page).to have_content("Awesome Chest Day")
  page.find("button").click
  expect(page).to have_content("5 sets of 12, 10, 8, 6, 4")
  expect(page).to have_content("3 sets of 10")
  expect(page).to have_content("4 sets of 8, 6, 4, 2")
end
