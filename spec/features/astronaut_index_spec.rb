require 'rails_helper'

RSpec.describe 'Astronaut Index Page' do
  describe "When I visit the astronauts index page" do
    it "shows a list of astronauts and their details" do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 35, job: "Commander")
      @doug = Astronaut.create(name: "Neil Hurley", age: 34, job: "Engineer")
      @alan = Astronaut.create(name: "Alan Shepard", age: 36, job: "Badass")

      @apollo = Mission.create(title: "Apollo 13", time_in_space: 5)
      @capricorn = Mission.create(title: "Capricorn 4", time_in_space: 3)
      @gemini = Mission.create(title: "Gemini 7", time_in_space: 4)

      AstronautMission.create!(astronaut_id: @neil.id, mission_id: @apollo.id)
      AstronautMission.create!(astronaut_id: @neil.id, mission_id: @capricorn.id)
      AstronautMission.create!(astronaut_id: @alan.id, mission_id: @capricorn.id)
      AstronautMission.create!(astronaut_id: @alan.id, mission_id: @gemini.id)
      AstronautMission.create!(astronaut_id: @doug.id, mission_id: @apollo.id)
      AstronautMission.create!(astronaut_id: @doug.id, mission_id: @capricorn.id)
      AstronautMission.create!(astronaut_id: @doug.id, mission_id: @gemini.id)

      visit '/astronauts'

      expect(page).to have_content(@neil.name)
      expect(page).to have_content(@neil.age)
      expect(page).to have_content(@neil.job)
      expect(page).to have_content(@doug.name)
      expect(page).to have_content(@doug.age)
      expect(page).to have_content(@doug.job)

      expect(page).to have_content("Average Age: 35")

      expect(@apollo.title).to appear_before(@capricorn.title)
      expect(@capricorn.title).to appear_before(@gemini.title)
    end
  end
end
