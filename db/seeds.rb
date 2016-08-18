# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Manager.create name: "Elton", cpf: "11111"
Editor.create name: "Pablo", cpf: "22222"

User.create admin: true, email: "admin@admin.com", password: "12345678", active: true
User.create manager_id: 1, admin: false, email: "manager@manager.com", password: "12345678", active: true
User.create editor_id: 1, admin: false, email: "editor@editor.com", password: "12345678", active: true