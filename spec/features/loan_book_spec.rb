require 'rails_helper'

describe 'Loan book', type: :feature do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  context 'Loan the available book' do
    let(:email) { user.email }
    let(:password) { user.password }

    it 'displays success message' do
      within '#new_user' do
        fill_in 'Email',	with: email
        fill_in 'Password',	with: password
        click_button 'Log in'
      end

      visit book_path(book.id)

      expect(find_button('Loan')[:id]).to eq('loan_book')
      click_button('Loan')
      expect(page).to have_content('Book Loan was successfully created.')
    end
  end
end
