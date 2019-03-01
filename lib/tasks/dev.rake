namespace :dev do
  desc "configures the development environment"
  task setup: :environment do
    puts "Resetando o banco de dados..."
    %x(rails db:drop db:create db:migrate)
    puts "\n"

    puts "Cadastrando os tipos de contato..."
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Tipos de contato cadastrado com sucesso!"
    puts "\n"

    puts "Cadastrando os contatos..."
    50.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(102.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso!"
    puts "\n"

    puts "Cadastrando os telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
      end
      contact.save!
    end
    puts "Telefones cadastrados com sucesso!"
    puts "\n"
    
    puts "Cadastrando os endereços..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Endereços cadastrados com sucesso!"
  end
end
