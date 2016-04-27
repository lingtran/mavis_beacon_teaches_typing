require 'rails_helper'

RSpec.feature "User can make an attempt with name" do
  scenario "they can see their name and attempts" do
    level = Level.create(
    title: "Easy",
    text: "This is the first level of the typing test."
    )

    level.attempts.create(text: "This is my text", name: "Ethel")

    attempt_one_text = level.attempts.create(text: "This is my other text", name: "Robin").text
    # attempt_user_two = Attempt.create(text: "This is another text", name: "Robin")

    visit new_level_attempt_path(level)
    fill_in 'attempt[text]', :with => "This is the first kevel of the typing text."
    fill_in 'attempt[name]', :with => "Robin"
    click_button 'Score'

    expect(page).to have_current_path(level_path(level))

    visit '/attempts?name=Robin'

    within(".user-attempts") do
      expect(page).to have_content("Robin: This is the first kevel of the typing text")
      expect(page).to have_content("Robin: #{attempt_one_text}")
      expect(page).to_not have_content("Ethel: This is my text")
    end
  end
end
