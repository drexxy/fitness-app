Given("an admin is logged in") do
  @admin = Admin.create!
  page.set_rack_session(admin_id: @admin.id)
end

Given("they are on the new goal page") do
  visit new_goal_path
end

Given("they have filled in the name of the goal") do
  fill_in "Name", with: "Lose weight"
end

Then("a goal is added to the goals table") do
  expect(Goal.last.name).to eq("Lose weight")
end
