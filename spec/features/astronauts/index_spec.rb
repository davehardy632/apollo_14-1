require "rails_helper"

describe "astronauts index page" do
  before :each do
    @neil_armstrong = Astronaut.create!(name: "Neil Armstrong", age: 60, job: "engineer")
    @buzz_aldrin = Astronaut.create!(name: "Buzz Aldrin", age: 50, job: "mechanic")
    @john_snow = Astronaut.create!(name: "John Snow", age: 30, job: "pilot")

    @mission_1 = @neil_armstrong.missions.create!(title: "lmnop", time_in_space: 40)
    @mission_2 = @neil_armstrong.missions.create!(title: "abcd", time_in_space: 50)

    @mission_3 = @buzz_aldrin.missions.create!(title: "Mission 3", time_in_space: 30)
    @mission_4 = @buzz_aldrin.missions.create!(title: "Mission 4", time_in_space: 90)

    @mission_5 = @john_snow.missions.create!(title: "efgh", time_in_space: 30)
    @mission_6 = @john_snow.missions.create!(title: "abcd", time_in_space: 100)
    @mission_7 = @john_snow.missions.create!(title: "ijkl", time_in_space: 20)

  end
  describe "When I visit astronauts path" do
    it "I see a list of astronauts with name, age and job" do


      visit astronauts_path

      within("#astronaut-info") do
        expect(page).to have_content(@neil_armstrong.name)
        expect(page).to have_content(@neil_armstrong.age)
        expect(page).to have_content(@neil_armstrong.job)

        expect(page).to have_content(@buzz_aldrin.name)
        expect(page).to have_content(@buzz_aldrin.age)
        expect(page).to have_content(@buzz_aldrin.job)

        expect(page).to have_content(@john_snow.name)
        expect(page).to have_content(@john_snow.age)
        expect(page).to have_content(@john_snow.job)
      end
    end
    it "I see the average age of all astronauts" do

      visit astronauts_path

      within("#avg-age") do
        expect(page).to have_content("Average astronaut age: 46")
      end
    end
    it "I see a list of space missions names in alphabetical order" do

      visit astronauts_path

      within("#astronaut-info") do
          expect(page.all('p')[0]).to have_content(@mission_6.title)
          expect(page.all('p')[1]).to have_content(@mission_5.title)
          expect(page.all('p')[2]).to have_content(@mission_7.title)
      end
    end
  end
end
