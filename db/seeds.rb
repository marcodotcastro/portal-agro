animal = Categoria.create(nome: "Animal", descricao: "")
Categoria.create(nome: "Vegetal", descricao: "")
Categoria.create(nome: "Industrial", descricao: "")

if Rails.env.development?
    AdminUser.create!(email: "admin@portalagro.com.br", password: "password", password_confirmation: "password")
    
    produtor = Produtor.create(
        nome: "Vanderley Pio", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
        foto: "http://www.sebrae.com.br/Sebrae/Portal%20Sebrae/UFs/AP/Imagens/rural.png",
        video: "Fdbk4v4a16Y"
        )
        
    
    Produtor.create(
        nome: "Wilson Frade", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
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
    produto1.categoria = animal
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
    produto2.categoria = animal
    produto2.save
   
end

    
