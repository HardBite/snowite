# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['superadmin', 'admin', 'user'].each do |role|
  Role.find_or_create_by_rolename(role)
end

sa = {fname: "qwer", email: "qwer", password: "qwer", password_confirmation: "qwer", role_id: 1}
Admin.create(sa)
