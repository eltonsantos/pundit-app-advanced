profile = Profile.create description: "Profile created by admin"
Role.roles.map do |role, _|
  profile.permissions.create role: role, can_create: 1, can_read: 1, can_update: 1, can_delete: 1
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

Functionality.create description: "Listar perfil"
Functionality.create description: "Visualizar perfil"
Functionality.create description: "Editar perfil"
Functionality.create description: "Remover perfil"
Functionality.create description: "Criar perfil"
Functionality.create description: "Visualizar funcionalidade"
Functionality.create description: "Visualizar funcionalidade"
Functionality.create description: "Editar funcionalidade"
Functionality.create description: "Remover funcionalidade"
Functionality.create description: "Criar funcionalidade"
Functionality.create description: "Listar usuario"
Functionality.create description: "Visualizar usuario"
Functionality.create description: "Editar usuario"
Functionality.create description: "Remover usuario"
Functionality.create description: "Criar usuario"
Functionality.create description: "Listar gerente"
Functionality.create description: "Visualizar gerente"
Functionality.create description: "Editar gerente"
Functionality.create description: "Remover gerente"
Functionality.create description: "Criar gerente"
Functionality.create description: "Listar editor"
Functionality.create description: "Visualizar editor"
Functionality.create description: "Editar editor"
Functionality.create description: "Remover editor"
Functionality.create description: "Criar editor"
