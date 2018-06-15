require "rails_helper"

RSpec.describe Review, :type => :model do

  it "Creazione review per un'inserzione" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :rating => 5, :comment => "Wow", :user_id => user.id, :place_id => place.id)
    expect(place.reload.reviews.first).to eq(review)
  end

  it "Creazione review senza descrizione" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :rating => 5, :user_id => user.id, :place_id => place.id)
    expect(review).not_to be_valid
  end

  it "Creazione review senza valutazione" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :comment => "Wow", :user_id => user.id, :place_id => place.id)
    expect(review).not_to be_valid
  end

  it "Creazione review con valutazione minore o uguale a 0" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :rating => -1, :comment => "Posto scadente", :user_id => user.id, :place_id => place.id)
    expect(review).not_to be_valid
  end

  it "Creazione review con valutazione maggiore di 5" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :rating => 6, :comment => "Wow", :user_id => user.id, :place_id => place.id)
    expect(review).not_to be_valid
  end

  it "Creazione review con valutazione non intera" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
    review = Review.create(:id => 1, :rating => 3.4, :comment => "Wow", :user_id => user.id, :place_id => place.id)
    expect(review).not_to be_valid
  end

end
