Given("a personal trainer is logged in") do
  @trainer = Trainer.create!
  page.set_rack_session(customer_id: @trainer.id)
end

Given("they are on the new workout page") do
  visit new_workout_path
end
