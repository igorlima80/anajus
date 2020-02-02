require "application_system_test_case"

class SexesTest < ApplicationSystemTestCase
  setup do
    @sex = sexes(:one)
  end

  test "visiting the index" do
    visit sexes_url
    assert_selector "h1", text: "Sexes"
  end

  test "creating a Sex" do
    visit sexes_url
    click_on "New Sex"

    fill_in "Description", with: @sex.description
    click_on "Create Sex"

    assert_text "Sex was successfully created"
    click_on "Back"
  end

  test "updating a Sex" do
    visit sexes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sex.description
    click_on "Update Sex"

    assert_text "Sex was successfully updated"
    click_on "Back"
  end

  test "destroying a Sex" do
    visit sexes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sex was successfully destroyed"
  end
end
