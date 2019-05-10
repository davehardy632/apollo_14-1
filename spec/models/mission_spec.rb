require 'rails_helper'

describe Mission, type: :model do
  before :each do
    @neil_armstrong = Astronaut.create!(name: "Neil Armstrong", age: 60, job: "engineer")
    @buzz_aldrin = Astronaut.create!(name: "Buzz Aldrin", age: 50, job: "mechanic")
    @john_snow = Astronaut.create!(name: "John Snow", age: 30, job: "pilot")

    @mission_1 = @neil_armstrong.missions.create!(title: "lmnop", time_in_space: 40)
    @mission_2 = @neil_armstrong.missions.create!(title: "abcd", time_in_space: 50)

    @mission_3 = @buzz_aldrin.missions.create!(title: "Mission 3", time_in_space: 30)
    @mission_4 = @buzz_aldrin.missions.create!(title: "Mission 4", time_in_space: 90)

    @mission_5 = @john_snow.missions.create!(title: "Efgh", time_in_space: 30)
    @mission_6 = @john_snow.missions.create!(title: "Abcd", time_in_space: 100)
    @mission_7 = @john_snow.missions.create!(title: "Ijkl", time_in_space: 20)

  end
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end
end
