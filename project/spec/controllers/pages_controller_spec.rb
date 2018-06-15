require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET home" do
    it "gives a response status 200" do
      get :home
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :home
      expect(response.content_type).to eq "text/html"
    end

    it "renders the home page" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "GET about" do
    it "gives a response status 200" do
      get :about
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :about
      expect(response.content_type).to eq "text/html"
    end

    it "renders the results page" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "GET map" do
    it "gives a response status 200" do
      get :map
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :map
      expect(response.content_type).to eq "text/html"
    end

    it "renders the map page" do
      get :map
      expect(response).to render_template(:map)
    end
  end

  describe "GET profile" do
    it "gives a response status 200" do
      get :profile
      expect(response.status).to eq(200)
    end

    it "shows an html page" do
      get :profile
      expect(response.content_type).to eq "text/html"
    end

    it "renders the profile page" do
      get :profile
      expect(response).to render_template(:profile)
    end
  end
end
