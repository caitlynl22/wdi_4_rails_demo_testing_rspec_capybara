require 'rails_helper'

RSpec.describe CommentsController do
  let(:valid_attributes) {
    { body: "Right shark is better." }
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

  describe 'GET new' do
    it 'has a 200 status code' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      get :new, article_id: article
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      get :new, article_id: article
      expect(response).to render_template('new')
    end

    it 'assigns @comment' do
      article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
      get :new, article_id: article
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new comment' do
        article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
        expect {
          post :create, comment: valid_attributes, article_id: article.id
          }.to change(Comment, :count).by 1
      end
    end
  end

end
