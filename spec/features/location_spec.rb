require 'rails_helper'

describe 'user can CRUD locations' do

  before :each do
    @user = User.create(email: 'test@fake.com', password: '1234')
  end

  scenario 'user can create a location' do

    visit '/'

    click_on 'Sign In'

      fill_in 'email', with: 'test@fake.com'
      fill_in 'password', with: '1234'
      click_on 'Save changes'

    expect(page).to have_content('good job')

    click_on "Create location"

      fill_in 'location[name]', with: 'coors field'
      fill_in 'location[address]', with: 'denver, co'
      fill_in 'location[zip_code]', with: '1234'
      click_on 'Create Location'

    expect(page).to have_content('Location was successfully created.')
    expect(page).to have_content('coors field')

  end

  scenario 'user can access show page of location' do

    Location.create(name: 'coors field', address: 'denver, co', zip_code: '1234')
    current_user = @user

    visit '/'

    click_on 'coors field'

    expect(page).to have_content ('address' && 'denver, co')

  end

end
