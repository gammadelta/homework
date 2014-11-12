# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Subject.create(name: "Natural Sciences")
Subject.create(name: "Language & Literature")
Subject.create(name: "Art")
Subject.create(name: "Mathematics")
Subject.create(name: "Technology")
Subject.create(name: "Social Studies")
Subject.create(name: "Professions")
Subject.create(name: "Other")

Subsubject.create(name:"Biology", subjectID: 1)
Subsubject.create(name:"Chemistry", subjectID: 1)
Subsubject.create(name:"Physics", subjectID: 1)
Subsubject.create(name:"Geology", subjectID: 1)
Subsubject.create(name:"Communicaitons", subjectID: 2)
Subsubject.create(name:"English", subjectID: 2)
Subsubject.create(name:"Literature", subjectID: 2)
Subsubject.create(name:"Drawing", subjectID: 3)
Subsubject.create(name:"Graphic Design", subjectID: 3)
Subsubject.create(name:"Algebra", subjectID: 4)
Subsubject.create(name:"Pre-Calculus", subjectID: 4)
Subsubject.create(name:"Calculus", subjectID: 4)
Subsubject.create(name:"Computer Science", subjectID: 5)
Subsubject.create(name:"Intro to Engineering", subjectID: 5)
Subsubject.create(name:"History", subjectID: 6)
Subsubject.create(name:"Psychology", subjectID: 6)
Subsubject.create(name:"Geography", subjectID: 6)
Subsubject.create(name:"Teaching", subjectID: 7)
Subsubject.create(name:"Law", subjectID: 7)
Subsubject.create(name:"ASU 101", subjectID: 8)
















