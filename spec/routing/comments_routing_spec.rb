require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes GET /articles/:article_id/comments to the comments controller' do
    expect(get('/articles/1/comments')).to route_to(controller: 'comments', action: 'index', article_id: '1')
  end

  it 'routes GET /articles/:article_id/comments/new to the comments controller' do
    expect(get('/articles/1/comments/new')).to route_to(controller: 'comments', action: 'new', article_id: '1')
  end

  it 'routes POST /articles/:article_id/comments' do
    expect(post('/articles/1/comments')).to route_to(controller: 'comments', action: 'create', article_id: '1')
  end
end
