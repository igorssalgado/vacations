require "application_system_test_case"

class VacationsTest < ApplicationSystemTestCase
  setup do
    @vacation = vacations(:one)
  end

  test "visiting the index" do
    visit vacations_url
    assert_selector "h1", text: "Vacations"
  end

  test "should create vacation" do
    visit vacations_url
    click_on "New vacation"

    fill_in "Bonus", with: @vacation.bonus
    fill_in "Email", with: @vacation.email
    fill_in "Ending date", with: @vacation.ending_date
    fill_in "First name", with: @vacation.first_name
    fill_in "Last name", with: @vacation.last_name
    fill_in "Starting date", with: @vacation.starting_date
    fill_in "Vacation days", with: @vacation.vacation_days
    click_on "Create Vacation"

    assert_text "Vacation was successfully created"
    click_on "Back"
  end

  test "should update Vacation" do
    visit vacation_url(@vacation)
    click_on "Edit this vacation", match: :first

    fill_in "Bonus", with: @vacation.bonus
    fill_in "Email", with: @vacation.email
    fill_in "Ending date", with: @vacation.ending_date
    fill_in "First name", with: @vacation.first_name
    fill_in "Last name", with: @vacation.last_name
    fill_in "Starting date", with: @vacation.starting_date
    fill_in "Vacation days", with: @vacation.vacation_days
    click_on "Update Vacation"

    assert_text "Vacation was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacation" do
    visit vacation_url(@vacation)
    click_on "Destroy this vacation", match: :first

    assert_text "Vacation was successfully destroyed"
  end
end
