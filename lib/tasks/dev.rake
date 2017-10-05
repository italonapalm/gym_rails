namespace :dev do
  desc "Setup Development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."
    puts "APAGANDO BD... #{%x(rake db:drop)}"

    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_states)
    puts %x(rake dev:generate_cities)
    puts %x(rake dev:generate_students)
  end

  desc "Create States"
  task generate_states: :environment do
    puts "Registering STATES"
    10.times do
      State.create!(
        name: Faker::Address.state
      )
    end
    puts "STATES successfully registered!"
  end

  desc "Create Cities"
  task generate_cities: :environment do
    puts "Registering CITIES"
    20.times do
      City.create!(
        name: Faker::Address.city,
        state: State.all.sample
      )
    end
    puts "CITIES successfully registered!"
  end

  desc "Create Students"
  task generate_students: :environment do
    puts "Registering STUDENTS"
    10.times do
      student = Student.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        full_name: Faker::Name.name,
        birthdate: Faker::Date.birthday(14, 65),
        cpf: Faker::CPF.numeric,
        rg: Faker::Number.number(10),
        active: true
      )
      student.build_address
      student.address.cep = Faker::Address.zip
      student.address.neighborhood = Faker::Address.community
      student.address.number = Faker::Address.building_number
      student.address.street = Faker::Address.street_name
      student.address.address = Faker::Address.street_name
      student.address.complement = Faker::Address.secondary_address
      student.address.reference = Faker::Address.community
      student.address.city = City.all.sample

      student.save!
    end

    puts "STUDENTS successfully registered!"
  end

end
