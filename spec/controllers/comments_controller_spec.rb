require 'rails_helper'

RSpec.describe CommentsController do
  let(:valid_attributes) {
    {body: 'Right shark is better.'}
  }

  let(:invalid_attributes) {
    { body: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      get :index, article_id: article
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      get :index, article_id: article
      expect(response).to render_template('index')
    end

    it 'assigns @comments' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      comments = Comment.all
      get :index, article_id: article
      expect(assigns(:comments)).to eq comments
    end
  end

end
