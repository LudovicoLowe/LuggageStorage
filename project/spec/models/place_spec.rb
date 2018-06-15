require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "Creazione Place senza nome" do
    it "dovrebbe non essere valida" do
      place = Place.new(:state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
      expect(place).not_to be_valid
    end
  end

  describe "Creazione Place senza stato" do
    it "dovrebbe non essere valida" do
      place = Place.create(:name => "Casa Temp", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
      expect(place).not_to be_valid
    end
  end

  describe "Creazione Place senza città" do
    it "dovrebbe non essere valida" do
      place = Place.create(:name => "Casa Temp", :state => "Italy", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
      expect(place).not_to be_valid
    end
  end

  describe "Creazione Place senza indirizzo" do
    it "dovrebbe non essere valida" do
      place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :cap => "00179", :description => "Temp place", :user_id => 1)
      expect(place).not_to be_valid
    end
  end

  describe "Creazione Place senza cap" do
    it "dovrebbe non essere valida" do
      place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :description => "Temp place", :user_id => 1)
      expect(place).not_to be_valid
    end
  end

  describe "Creazione Place completa" do
    it "dovrebbe essere valida e salvata correttamente" do
      user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
      place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
      expect(place).to be_valid
      place.save!
      expect(Place.first).to eq(place)
    end
  end

  context "Place con 2 o più recensioni" do
    it "dovrei vedere le recensioni ordinate per data crescente" do
      user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
      place = Place.create(:name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
      place.save!
      review1 = Review.create(:id => 1, :rating => 5, :comment => "Wow", :user_id => user.id, :place_id => place.id)
      review2 = Review.create(:id => 2, :rating => 4, :comment => "Wow", :user_id => user.id, :place_id => place.id)
      expect(place.reload.reviews).to eq([review1, review2])
    end
  end

end
