require 'rails_helper'

RSpec.describe User, type: :model do
  it "Validazione utente" do
    user = User.new(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    expect(user).to be_valid
  end

  it "Creazione utente" do
    user = User.create(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    expect(User.first).to eq(user)
  end

  it "Utente senza email" do
    user = User.new(:password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente", :phone_number => "3281743104")
    expect(user).not_to be_valid
  end

  it "Utente senza nome" do
    user = User.new(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :surname => "utente", :phone_number => "3281743104")
    expect(user).not_to be_valid
  end

  it "Utente senza password" do
    user = User.new(:email => "user@luggagestorage.it", :password_confirmation => "12345678", :name => "utente", :phone_number => "3281743104")
    expect(user).not_to be_valid
  end

  it "Utente senza cognome" do
    user = User.new(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :phone_number => "3281743104")
    expect(user).not_to be_valid
  end
  
  it "Utente senza telefono" do
     user = User.new(:email => "user@luggagestorage.it", :password => "12345678", :password_confirmation => "12345678", :name => "utente", :surname => "utente")
     expect(user).not_to be_valid
   end
end
