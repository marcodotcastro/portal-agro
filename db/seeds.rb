puts Rails.env

puts "# Administrador"
AdminUser.first_or_create!(email: "admin@portalagro.com.br", password: "abc12345", password_confirmation: "abc12345")

puts "# Categoria"
animal = Categoria.create(id: 1, nome: "Animal", descricao: "")
vegetal = Categoria.create(id: 2, nome: "Vegetal", descricao: "")
industrial = Categoria.create(id: 3, nome: "Industrial", descricao: "")

puts "# Qualidade"
normal = Qualidade.create(id: 1, nome: "Tradicional", descricao: "")
natural = Qualidade.create(id: 2, nome: "Natural", descricao: "")
organico = Qualidade.create(id: 3, nome: "Orgânico", descricao: "")


#if Rails.env.development?
   
puts "# Produtores e Produtos"   
    produtor1 = Produtor.create(
        nome: "Vanderley",
        sobrenome: "Pio",
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
    
    historia1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
    historia2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
    historia3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
    
    video1 = Video.create(nome: "Video 1",descricao: "Video 1", codigo: "Fdbk4v4a16Y")
    
    produtor1.video = video1
    produtor1.historias << [historia1, historia2, historia3]
    
    produtor1.save
    
    produtor2 = Produtor.create(
        nome: "Wilson",
        sobrenome: "Frade",
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
        nome: "Stephan",
        sobrenome: "Gaehwiler",
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
        preco: "R$ 1,00 l"
    )
    
    producao1 = Producao.create(numero: 100, unidade: :litro, periodo: :dia)
    producao2 = Producao.create(numero: 150, unidade: :litro, periodo: :dia)
    producao3 = Producao.create(numero: 250, unidade: :litro, periodo: :dia)
    
    produto1.produtor = produtor1
    produto1.categoria = animal
    produto1.qualidade = normal
    produto1.producoes << [producao1, producao2, producao3]
    produto1.save
    
    produto1.capa.attach(io: File.open(Rails.root + "test/imagens/leite-capa.jpg"), filename: "leite-capa.jpg" )
    
    produto1.fotos.attach(io: File.open(Rails.root + "test/imagens/produto-foto-1.jpg"), filename: "produto-foto-1.jpg" )
    produto1.fotos.attach(io: File.open(Rails.root + "test/imagens/produto-foto-2.jpg"), filename: "produto-foto-2.jpg" )
    
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "XRgDSQJgoCI", produto: produto1)

    produto2 = Produto.create(
        nome: "Soja", 
        descricao: "A soja (Glycine max), também conhecida como feijão-soja e feijão-chinês,[1] é uma planta pertence à família Fabaceae, família esta que compreende também plantas como o feijão, a lentilha e a ervilha.", 
        preco: "R$ 60,00 sc"
    )
    
    producao4 = Producao.create(numero: 500, unidade: :saco, periodo: :ano)
    producao5 = Producao.create(numero: 450, unidade: :saco, periodo: :ano)
    
    produto2.produtor = produtor1
    produto2.categoria = vegetal
    produto2.qualidade = natural
    produto2.producoes << [producao4, producao5]
    produto2.save
    
    produto2.capa.attach(io: File.open(Rails.root + "test/imagens/soja-capa.jpg"), filename: "soja-capa.jpg" )
    
    Video.create(nome: "Video 1",descricao: "Video 1", codigo: "0FuZWc8Bpw8", produto: produto2)
   
#end