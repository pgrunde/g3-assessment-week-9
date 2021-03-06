feature "ToDos" do
  before :each do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"
  end

  scenario "A user can sign in a create a ToDo" do

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end

  scenario "A user can see an edit form for ToDos" do
    expect(page).to have_content "Edit ToDo"

    click_link "Edit ToDo"

    expect(page).to have_content "Get a haircut"
  end

  scenario "A user can update a ToDo via the Edit form" do
    click_link "Edit ToDo"

    fill_in "todo", with: "Get lice removing shampoo"

    click_button "Update ToDo"

    expect(page).to have_content "Get lice removing shampoo"
    expect(page).to have_content "ToDo updated"
  end

  scenario "A user can Complete a Task and remove it from the list" do
    click_button "Task Complete!"
    expect(page).to have_button "Add ToDo"
    expect(page).to_not have_content "Get a haircut"
  end

  scenario "A user can only see their own To Do list items" do
    click_button "Sign Out"

    click_link "Register"

    fill_in "Username", with: "kaylee"
    fill_in "Password", with: "123"

    click_button "Register"

    fill_in "Username", with: "kaylee"
    fill_in "Password", with: "123"

    click_button "Sign In"

    fill_in "What do you need to do?", with: "snuggle a puppy"
    click_button "Add ToDo"

    expect(page).to have_content "snuggle a puppy"
    expect(page).to_not have_content "Get a haircut"
  end
end
