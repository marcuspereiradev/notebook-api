namespace :dev do
  desc "configures the development environment"
  task setup: :environment do
    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(102.years.ago, 18.years.ago)
      )
    end
    puts "Contatos cadastrados com sucesso!"
  end
end
