puts "# Administrador"
AdminUser.create!(email: "admin@portalagro.com.br", password: "abc12345", password_confirmation: "abc12345")

puts "# Categoria"
animal = Categoria.create(nome: "Animal", descricao: "")
vegetal = Categoria.create(nome: "Vegetal", descricao: "")
industrial = Categoria.create(nome: "Industrial", descricao: "")

puts "# Qualidade"
normal = Qualidade.create(nome: "Normal", descricao: "")
natural = Qualidade.create(nome: "Natural", descricao: "")
organica = Qualidade.create(nome: "Orgânica", descricao: "")


#if Rails.env.development?
   
puts "# Produtores e Produtos"   
    produtor1 = Produtor.create(
        nome: "Vanderley Pio", 
        telefone: "(62)99998-12345", 
        email: "vanderley.pio@gmail.com", 
        endereco: "R 03, Bro 9 de Julho - Corumbá de Goiás, GO",
        apelido: "Dentista", 
        whatsapp: true,
        cartao: true
        )
        
    produtor1.perfil.attach(io: File.open(Rails.root + "test/imagens/vanderley-pio-perfil.jpg"), filename: "vanderley-pio-perfil.jpg" )
    
    produtor1.fotos.attach(io: File.open(Rails.root + "test/imagens/produtor-foto-1.jpg"), filename: "produtor-foto-1.jpg" )
    produtor1.fotos.attach(io: File.open(Rails.root + "test/imagens/produtor-foto-2.jpg"), filename: "produtor-foto-2.jpg" )
    
    Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...", produtor: produtor1)
    Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...", produtor: produtor1)
    Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....", produtor: produtor1)
    
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
    produtor2.perfil.attach(io: File.open(Rails.root + "test/imagens/wilson-frade-perfil.jpg"), filename: "wilson-frade-perfil.jpg" )
    
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
        
    produtor3.perfil.attach(io: File.open(Rails.root + "test/imagens/stephan-gaehwiler-perfil.jpg"), filename: "stephan-gaehwiler-perfil.jpg" )
        
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
    
    produto1.capa.attach(io: File.open(Rails.root + "test/imagens/leite-capa.jpg"), filename: "leite-capa.jpg" )
    
    produto1.fotos.attach(io: File.open(Rails.root + "test/imagens/produto-foto-1.jpg"), filename: "produto-foto-1.jpg" )
    produto1.fotos.attach(io: File.open(Rails.root + "test/imagens/produto-foto-2.jpg"), filename: "produto-foto-2.jpg" )
    
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
    
    produto2.capa.attach(io: File.open(Rails.root + "test/imagens/soja-capa.jpg"), filename: "soja-capa.jpg" )
    
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "0FuZWc8Bpw8", produto: produto2)
   
#end