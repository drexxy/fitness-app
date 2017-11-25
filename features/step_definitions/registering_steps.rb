Given("they are on the sign up page") do
  visit new_customer_registration_path
end

When("they provide their credentials") do
  fill_in 'Email', with: "ben.lifter@gmail.co.uk"
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

end

When("they sign up") do
  click_on("Sign up")
end

Then("they will be registered but not confirmed") do
  expect(Customer.last.email).to eq("ben.lifter@gmail.co.uk")
end

Then("they recieve confirmation insturctions by email") do
  expect(ActionMailer::Base.deliveries.length).to eq(1)
end

When("they follow the confirmation link in the confirmation email") do
  ctoken = ActionMailer::Base.deliveries.last.body.match(/confirmation_token=[^"]+/)
  visit "http://localhost:3000/customers/confirmation?#{ctoken}"
end

Then("they'll be redirected to the new profile page") do
  expect(page).to have_content("Create a Profile")
  expect(page).to have_content(
    "All profile information is private unless you choose to share it. It is only used for filtering workout results."
  )
end

When("they check the box to say they are a personal trainer") do
  check "customer[trainer]"
end

Then("they'll be redirected to the new trainer profile page") do
  expect(page).to have_content("Create a Trainer Profile")
  expect(page).to have_content(
    "All profile information is public to registered users of this site."
  )
end
