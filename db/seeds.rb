# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

notes_types = ['10th','12th','BBA','BCA','BA','MA','MBA','MCA','Other Graduation','Other PG','Computer','Business','Other']
notes_types.each do |notes_type|
  if !(NotesType.find_by_name(notes_type))
    NotesType.create({name: notes_type})
  end
end