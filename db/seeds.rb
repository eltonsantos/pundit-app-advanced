profile = Profile.create description: "Profile created by admin"
Role.roles.map do |_, role|
  role[:actions].each do |action|
    profile.permissions.create role: role[:role], action: action, permit: true
  end
end

Profile.create description: "Profile created by Manager", manager_id: 1
#ProfileFunctionality.create profile_id: 1, functionality_id: 1
#ProfileFunctionality.create profile_id: 1, functionality_id: 2

Profile.create description: "Profile created by Editor", editor_id: 1
#ProfileFunctionality.create profile_id: 2, functionality_id: 3
#ProfileFunctionality.create profile_id: 2, functionality_id: 4

User.create admin: true, email: "admin@admin.com", password: "12345678", active: true, profile: profile
User.create admin: false, manager_id: 1, email: "manager@manager.com", password: "12345678", active: true, father_id: 1
User.create admin: false, editor_id: 1, email: "editor@editor.com", password: "12345678", active: true, father_id: 2

Manager.create description: "Manager 1", user_id: 1
Editor.create description: "Editor 1", manager_id: 1
