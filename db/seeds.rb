# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
@team_2 = Team.create!(name: "Chicago Bulls", wins: 46, losses: 36, active: true)
@team_3 = Team.create!(name: "Karasuno High", wins: 2, losses: 2, active: true)
@player = @team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
@player_2 = @team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
@player_3 = @team_2.players.create!(name: "Lonzo Ball", age: 24, retired: false)
@player_4 = @team_3.players.create!(name: "Tenma Udai", age: 21, retired: true)
@player_5 = @team_3.players.create!(name: "Tobio Kageyama", age: 16, retired: false)
