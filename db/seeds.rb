# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create admin: true, email: "admin@admin.com", password: "12345678", active: true
User.create admin: false, manager_id: 1, email: "manager@manager.com", password: "12345678", active: true, father_id: 1, profile_id: 1
User.create admin: false, editor_id: 1, email: "editor@editor.com", password: "12345678", active: true, father_id: 2, profile_id: 2

Manager.create description: "Manager 1", user_id: 1
Editor.create description: "Editor 1", manager_id: 1

Functionality.create description: "Functionality 1"
Functionality.create description: "Functionality 2"
Functionality.create description: "Functionality 3"
Functionality.create description: "Functionality 4"

Profile.create description: "Profile Manager"
ProfileFunctionality.create profile_id: 1, functionality_id: 1
ProfileFunctionality.create profile_id: 1, functionality_id: 2

Profile.create description: "Profile Editor"
ProfileFunctionality.create profile_id: 2, functionality_id: 3
ProfileFunctionality.create profile_id: 2, functionality_id: 4