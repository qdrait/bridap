require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question = questions(:one)
  end

  test "visiting the index" do
    visit questions_url
    assert_selector "h1", text: "Questions"
  end

  test "creating a Question" do
    visit questions_url
    click_on "New Question"

    fill_in "Choices", with: @question.choices
    fill_in "Display", with: @question.display
    fill_in "Input Type", with: @question.input_type
    fill_in "Office", with: @question.office_id
    fill_in "Order", with: @question.order
    fill_in "Question No", with: @question.question_no
    fill_in "Required", with: @question.required
    fill_in "Title", with: @question.title
    click_on "Create Question"

    assert_text "Question was successfully created"
    click_on "Back"
  end

  test "updating a Question" do
    visit questions_url
    click_on "Edit", match: :first

    fill_in "Choices", with: @question.choices
    fill_in "Display", with: @question.display
    fill_in "Input Type", with: @question.input_type
    fill_in "Office", with: @question.office_id
    fill_in "Order", with: @question.order
    fill_in "Question No", with: @question.question_no
    fill_in "Required", with: @question.required
    fill_in "Title", with: @question.title
    click_on "Update Question"

    assert_text "Question was successfully updated"
    click_on "Back"
  end

  test "destroying a Question" do
    visit questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question was successfully destroyed"
  end
end
