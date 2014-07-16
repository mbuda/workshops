require 'spec_helper'

describe 'Category index' do
  subject { page }
  let!(:category) { create(:category) }
  let(:valid_session) { {} }

  before do
    visit categories_path
  end

  context 'when user not signed in' do
    describe 'categories list' do
      it 'contains links to every category show page' do
        expect(page).to have_link(category.name)
      end

      it 'have no actions available' do
        expect(page).to have_content('None for you')
      end

      it 'contains link to log in' do
        expect(page).to have_link('Log in')
      end
    end
  end
end

