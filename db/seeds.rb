# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: "admin@portalagro.com.br", password: "password", password_confirmation: "password") if Rails.env.development?
if Rails.env.development?
    produtor = Produtor.create(
        nome: "Vanderley Pio", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, , Bro 9 de Julho - Corumbá de Goiás, GO",
        foto: "http://www.sebrae.com.br/Sebrae/Portal%20Sebrae/UFs/AP/Imagens/rural.png",
        video: "Fdbk4v4a16Y"
        )
        
    
    Produtor.create(
        nome: "Wilson Frade", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, , Bro 9 de Julho - Corumbá de Goiás, GO",
        foto: "https://zootecniaativa.com/wp-content/uploads/2015/04/2012_fevereiro_thumbnails_thumb_alaor_rodrigues_acude_acrelandia_foto_gleilson_miranda_01-300x193.jpg",
        video: "Uit7H-78XPI"
        )
    
    Produtor.create(
        nome: "Stephan Gaehwiler", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, , Bro 9 de Julho - Corumbá de Goiás, GO",
        foto: "https://blog.oobj.com.br/wp-content/uploads/2018/05/cpf-produtor-rual-650x390.png",
        video: "cen9ZMYzUm0"
        )
    
    produto1 = Produto.create(
        nome: "Leite", 
        descricao: "Leite é uma secreção nutritiva de cor esbranquiçada e opaca produzida pelas glândulas mamárias das fêmeas dos mamíferos. O líquido é produzido pelas células secretoras das glândulas mamárias ou mamas. A secreção láctea de uma fêmea dias antes e depois do parto se chama colostro.", 
        producao:"1000 L / dia", 
        preco: "R$ 1,00 L",
        foto: "http://dicademae.com/weloly/wp-content/uploads/2014/12/leite-de-vaca.jpg",
        video: "XRgDSQJgoCI"
    )
    
    produto1.produtor = produtor
    produto1.save

    produto2 = Produto.create(
        nome: "Leite", 
        descricao: "Leite é uma secreção nutritiva de cor esbranquiçada e opaca produzida pelas glândulas mamárias das fêmeas dos mamíferos. O líquido é produzido pelas células secretoras das glândulas mamárias ou mamas. A secreção láctea de uma fêmea dias antes e depois do parto se chama colostro.", 
        producao:"500 L / dia", 
        preco: "R$ 1,00 L",
        foto: "http://dicademae.com/weloly/wp-content/uploads/2014/12/leite-de-vaca.jpg",
        video: "sDfqfc3bEUU"
    )

    produto2.produtor = produtor
    produto2.save
    
   
end

    
