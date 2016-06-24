# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TipoDePessoa.create(codigo: 'F', nome_por_extenso: 'Pessoa física')
TipoDePessoa.create(codigo: 'J', nome_por_extenso: 'Pessoa jurídica')
TipoDePessoa.create(codigo: 'E', nome_por_extenso: 'Estrangeiro')

30.times.each do |i|
  Pais.create(
    nome: Faker::Address.country,
    codigo_ibge: i,
    codigo_siscomex: "0#{i}"
  )
end

30.times.each do |i|
  Uf.create(
    codigo_ibge: i,
    nome: Faker::Address.state_abbr,
    nome_por_extenso: Faker::Address.state
  )
end

30.times.each do |i|
  Municipio.create(
    nome: Faker::Address.city,
    codigo_ibge: i,
    capital: Faker::Address.city,
    uf_id: i + 1
  )
end
