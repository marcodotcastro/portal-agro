animal = Categoria.create(nome: "Animal", descricao: "")
vegetal = Categoria.create(nome: "Vegetal", descricao: "")
industrial = Categoria.create(nome: "Industrial", descricao: "")

normal = Qualidade.create(nome: "Normal", descricao: "")
natural = Qualidade.create(nome: "Natural", descricao: "")
organica = Qualidade.create(nome: "Orgânica", descricao: "")

AdminUser.create!(email: "admin@portalagro.com.br", password: "abc12345", password_confirmation: "abc12345")

if Rails.env.development?
   
    
    produtor1 = Produtor.create(
        nome: "Vanderley Pio", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
        apelido: "Dentista", 
        whatsapp: true,
        cartao: true
        )
    
    Foto.create(nome: "Foto 1",descricao: "Foto 1", url: "https://i.ytimg.com/vi/A8Rok7zz2mg/maxresdefault.jpg", principal: true, produtor: produtor1)
    Foto.create(nome: "Foto 2",descricao: "Foto 2", url: "https://www.jornalcontabil.com.br/wp-content/uploads/2018/12/funrural-e1544089438373.jpg", principal: false, produtor: produtor1)
    Foto.create(nome: "Foto 3",descricao: "Foto 3", url: "https://www.somaurbanismo.com.br/wp-content/uploads/2018/05/08-04-Produtor-rural-de-Jaguar%C3%A9-pode-pagar-por-lote-nas-colheitas.jpg", principal: false, produtor: produtor1)
    
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "Fdbk4v4a16Y", produtor: produtor1)
    
    produtor2 = Produtor.create(
        nome: "Wilson Frade", 
        telefone: "(62)99998-12345", 
        email: "wilson.frade@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
        apelido: "Wilson do Bar", 
        whatsapp: false,
        cartao: false
        )
    
    Foto.create(nome: "Foto 1",descricao: "Foto 1", url: "http://4.bp.blogspot.com/-JS8bro-9T5s/URQ8mMDk74I/AAAAAAAAGiY/oUz6VRqdEWU/s1600/DSC02793.JPG", principal: true, produtor: produtor2)
    Video.create(nome: "Video 2",descricao: "Video 2", codigo: "Uit7H-78XPI", produtor: produtor2)
    
    produtor3 = Produtor.create(
        nome: "Stephan Gaehwiler", 
        telefone: "(62)99998-12345", 
        email: "stephan.gaehwiler@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
        apelido: "Queijo Suíço", 
        whatsapp: false,
        cartao: true
        )
        
    Foto.create(nome: "Foto 1",descricao: "Foto 1", url: "https://blog.oobj.com.br/wp-content/uploads/2018/05/cpf-produtor-rual-650x390.png", principal: true, produtor: produtor3)
    Video.create(nome: "Video 3",descricao: "Video 3", codigo: "cen9ZMYzUm0", produtor: produtor3)
    
    produto1 = Produto.create(
        nome: "Leite", 
        descricao: "Leite é uma secreção nutritiva de cor esbranquiçada e opaca produzida pelas glândulas mamárias das fêmeas dos mamíferos. O líquido é produzido pelas células secretoras das glândulas mamárias ou mamas. A secreção láctea de uma fêmea dias antes e depois do parto se chama colostro.", 
        producao:"1000 L / dia", 
        preco: "R$ 1,00 L"
    )
    
    produto1.produtor = produtor1
    produto1.categoria = animal
    produto1.qualidade = normal
    produto1.save
    
    Foto.create(nome: "Foto 1",descricao: "Foto 1", url: "https://i.ytimg.com/vi/0-Fu3Aj4SoY/maxresdefault.jpg", principal: true, produto: produto1)
    Foto.create(nome: "Foto 2",descricao: "Foto 2", url: "https://i.ytimg.com/vi/6ZFDEWwBttM/maxresdefault.jpg", principal: false, produto: produto1)
    Foto.create(nome: "Foto 3",descricao: "Foto 3", url: "https://sebraers.com.br/wp-content/uploads/2017/11/iStock-671065136.jpg", principal: false, produto: produto1)
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "XRgDSQJgoCI", produto: produto1)

    produto2 = Produto.create(
        nome: "Soja", 
        descricao: "A soja (Glycine max), também conhecida como feijão-soja e feijão-chinês,[1] é uma planta pertence à família Fabaceae, família esta que compreende também plantas como o feijão, a lentilha e a ervilha.", 
        producao:"1000 sc / ano", 
        preco: "R$ 60,00 sc"
    )
    
    produto2.produtor = produtor1
    produto2.categoria = vegetal
    produto2.qualidade = natural
    produto2.save
    
    Foto.create(nome: "Foto 1",descricao: "Foto 1", url: "http://forabuvaeamargoso.com.br/assets/img/temp/Soja_1140x760px.jpg", principal: true, produto: produto2)
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "0FuZWc8Bpw8", produto: produto2)
   
end

    
