require 'rails_helper'

RSpec.feature "User makes an attempt" do
  scenario "an attempt is made and scored" do
    level = Level.create(
      title: "Easy",
      text: "This is the first level of the typing test."
    )

    visit level_path(level)
    click_link_or_button 'Start Typing Test'
    fill_in 'attempt[text]', :with => "This is the first kevel of the typing text."
    click_button 'Score'

    attempt = Attempt.last

    expect(page).to have_current_path(level_path(level))
    expect(page).to have_content(level.title)

    within('#attempts li:first') do
      expect(page).to have_content(attempt.created_at)
      expect(page).to have_content('95%')
    end
  end
end
