# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Client.create(cliente: '2h', cidade: 'Guarulhos', bairro: 'Cumbica', contato: 'Erik', fone:'997899896', status: true, url: 'www.teste.com.br/2h', username: 'erikikoo', password: '123456')
Admin.create!(username: 'erikikoo', password_digest: '$2a$10$u2Tm03fSHs2tsoky7Xqg0.OBebPYk.cV6d8i1yHHn9KfRuD5gARF.')