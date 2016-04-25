require 'rails_helper'

RSpec.describe Attempt, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:text) }

    it "is valid with text" do
      attempt = Attempt.new(text: "Here is a typing test.")
      expect(attempt).to be_valid
    end

    it "is not valid with empty text" do
      attempt = Attempt.new(text: "")
      expect(attempt).to be_invalid
    end
  end

  context "associations" do
    it { should belong_to(:level) }
  end

  scenario "it scores the text of an attempt" do
    level_text   = "Here is a typing test."
    attempt_text = "Here is a typing text."

    level   = Level.new(title: "Level 1", text: level_text)
    attempt = level.attempts.new(text: attempt_text)

    expect(attempt.percent_correct).to eq(95)
  end
end
