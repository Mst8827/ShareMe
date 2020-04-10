require 'rails_helper'
describe PostsController do
  describe 'GET #new' do
    it 'new.html.hamlに遷移すること' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it '@postに値が入っていること' do
      post = create(:post)
      get :edit, params: { id: post}
      expect(assigns(:post)).to eq post
    end
    it 'edit.html.hamlに遷移すること' do
      post = create(:post)
      get :edit, params: {id: post}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it '@postに正しい情報が入っていること' do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)). to match(posts.sort{ |a,b|b.created_at <=> a.created_at})
      
    end
    it 'index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index     
    end
  end
end