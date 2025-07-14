# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Module management', type: :system do
  let(:user) { create(:user) }

  it 'can add exams' do
    login_as user

    uni_module = create(:uni_module, user: user)
    visit uni_module_path(uni_module)

    find('a[title="Add Assessment"]').click

    fill_in 'Weight', with: 10
    fill_in 'Name', with: 'Test Exam'
    click_on 'Save'

    expect(page).to have_content 'Test Exam'

    visit uni_module_path(uni_module)

    expect(page).to have_content 'Test Exam'
  end
end
