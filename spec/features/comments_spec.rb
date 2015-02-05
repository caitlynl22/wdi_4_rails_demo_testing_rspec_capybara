require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all comments associated with an article' do

    article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
    another_article = Article.create!(title: 'Right Shark', body: 'Right shark sucks balls.')
    comments = Comment.create!([
      {body: 'Right shark is better.', article: article},
      {body: 'Left shark is better.', article: another_article},
      {body: 'Right shark is better.', article: article}
    ])

    visit "/articles/#{article.id}/comments"

    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'p',
      count: 2
  end

  scenario 'Create a comment' do
    article = Article.create!(title: 'Left Shark', body: 'Left Shark is awesome.')
    visit "/articles/#{article.id}/comments/new"

    fill_in 'Body', with: 'Sharks are awesome!'
    click_on 'Create Comment'

    expect(page).to have_content(/success/i)
  end
end
