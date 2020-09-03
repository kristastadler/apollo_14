# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
