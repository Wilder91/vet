# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.create(name: 'Tully', age: 5, breed: "Mixed-Breed")
Pet.create(name: 'Rosie', age: 7, breed: "Mixed-Breed")
Pet.create(name: 'Ruger', age: 9, breed: "Hound")

Doctor.create(name: "Fitzpatrick", practice_name: "LVP")


Medication.create(name: 'Carprofen', kind: 'nSAID', dose: 0.6, frequency: 2)
Medication.create(name: 'Firocoxib', kind: 'nSAID', dose: 5, frequency: 1)
Medication.create(name: 'Grapiprant', kind: 'nSAID', dose: 2, frequency: 1)
Medication.create(name: 'Tramadol', kind: 'Opioid Antagonist' , dose: 6, frequency: 3)
Medication.create(name: 'Gabapentin', kind: 'Anticonvulsant', dose: 15, frequency: 3)
Medication.create(name: 'Trazodone', kind: 'Seratonin antagonist', dose: 3.5, frequency: 2)
Medication.create(name: 'Fluoxetine', kind: 'SSRI', dose: 1.5, frequency: 1)
