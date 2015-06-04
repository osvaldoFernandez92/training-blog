require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'create' do
    context 'when article is invalid' do
      let(:article) { FactoryGirl.build(:article, title: 'ABC') }
      it 'raises an error' do
        expect(article).not_to be_valid
      end
    end
  end

  describe 'destroy' do
    let(:article) { FactoryGirl.create(:article) }
    let(:comment) { FactoryGirl.create(:comment) }

    context 'when it has a comment associated' do
      before do
        article.comments << comment
      end
      it 'destroys the comments that belong to the article' do
        expect { article.destroy }.to change { Comment.count }.by(-1)
      end
    end
  end
end
