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

puts "# Estado"

estado = Estado.create(id: 1, nome: "Goiás")

puts "# Cidade"

cidade_corumba_de_goias = Cidade.create(id: 1, nome: "Corumbá de Goiás", estado: estado)
cidade_cocalzinho = Cidade.create(id: 2, nome: "Cocalzinho", estado: estado)


#if Rails.env.development?

puts "# Produtores e Produtos"

produtor_jose_silva = Produtor.create(
    nome: "José",
    sobrenome: "Silva",
    telefone: "(62) 99998-12345",
    email: "jose.silva@gmail.com",
    endereco: "R 01, Bro 9 de Julho",
    apelido: "Zé",
    whatsapp: true,
    cartao: true
)

produtor_jose_silva.cidade = cidade_cocalzinho

produtor_jose_silva.perfil.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-perfil.jpg"), filename: "jose-silva-perfil.jpg")

produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-1.jpg"), filename: "jose-silva-foto-1.jpg")
produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-2.jpg"), filename: "jose-silva-foto-2.jpg")

historia_1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
historia_2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
historia_3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")

video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "Fdbk4v4a16Y")

produtor_jose_silva.video = video_1
produtor_jose_silva.historias << [historia_1, historia_2, historia_3]

produtor_jose_silva.save

puts "# #{produtor_jose_silva.nome_completo}"

produto_leite = Produto.create(
    nome: "Leite",
    descricao: "Leite é uma secreção nutritiva de cor esbranquiçada e opaca produzida pelas glândulas mamárias das fêmeas dos mamíferos. O líquido é produzido pelas células secretoras das glândulas mamárias ou mamas. A secreção láctea de uma fêmea dias antes e depois do parto se chama colostro.",
    preco: "R$ 1,00 l"
)

producao_1 = Producao.create(numero: 100, unidade: :litro, periodo: :dia)
producao_2 = Producao.create(numero: 150, unidade: :litro, periodo: :dia)
producao_3 = Producao.create(numero: 250, unidade: :litro, periodo: :dia)

produto_leite.produtor = produtor_jose_silva
produto_leite.categoria = animal
produto_leite.qualidade = normal
produto_leite.producoes << [producao_1, producao_2, producao_3]
produto_leite.save

produto_leite.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-capa.jpg"), filename: "jose-silva-leite-capa.jpg")

produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-1.jpg"), filename: "jose-silva-leite-foto-1.jpg")
produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-2.jpg"), filename: "jose-silva-leite-foto-2.jpg")

Video.create(nome: "Video 1", descricao: "Video 1", codigo: "XRgDSQJgoCI", produto: produto_leite)

puts "# #{produto_leite.nome}"

produto_soja = Produto.create(
    nome: "Soja",
    descricao: "A soja (Glycine max), também conhecida como feijão-soja e feijão-chinês, é uma planta pertence à família Fabaceae, família esta que compreende também plantas como o feijão, a lentilha e a ervilha.",
    preco: "R$ 60,00 sc"
)

producao_4 = Producao.create(numero: 500, unidade: :saco, periodo: :ano)
producao_5 = Producao.create(numero: 450, unidade: :saco, periodo: :ano)

produto_soja.produtor = produtor_jose_silva
produto_soja.categoria = vegetal
produto_soja.qualidade = natural
produto_soja.producoes << [producao_4, producao_5]
produto_soja.save

produto_soja.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-soja-capa.jpg"), filename: "jose-silva-soja-capa.jpg")

Video.create(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8", produto: produto_soja)

puts "# #{produto_soja.nome}"

produtor_divino_pereira = Produtor.create(
    nome: "Divino",
    sobrenome: "Pereira",
    telefone: "(62) 99998-12345",
    email: "divino.pereira@gmail.com",
    endereco: "R 02, Bro 9 de Julho",
    apelido: "Filho do Tião",
    whatsapp: false,
    cartao: false
)

produtor_divino_pereira.cidade = cidade_cocalzinho

produtor_divino_pereira.perfil.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-perfil.jpg"), filename: "divino-pereira-perfil.jpg")

Video.create(nome: "Video 2", descricao: "Video 2", codigo: "Uit7H-78XPI", produtor: produtor_divino_pereira)

produtor_divino_pereira.save


puts "# #{produtor_divino_pereira.nome_completo}"

produtor_stephan = Produtor.create(
    nome: "Stephan",
    sobrenome: "Gaehwiler",
    telefone: "(62) 99998-12345",
    email: "stephan.gaehwiler@gmail.com",
    endereco: "R 03, Bro 9 de Julho",
    apelido: "Suíço",
    whatsapp: false,
    cartao: true
)

produtor_stephan.cidade = cidade_corumba_de_goias

produtor_stephan.perfil.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-perfil.jpg"), filename: "stephan-gaehwiler-perfil.jpg")

historia_1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
historia_2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
historia_3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")

Video.create(nome: "Video 3", descricao: "Video 3", codigo: "cen9ZMYzUm0", produtor: produtor_stephan)
produtor_stephan.historias << [historia_1, historia_2, historia_3]

produtor_stephan.save

puts "# #{produtor_stephan.nome_completo}"

produto_queijo = Produto.create(
    nome: "Queijo",
    descricao: "Queijo é um alimento sólido feito a partir do leite de vacas, cabras, ovelhas, búfalas e/ou outros mamíferos. O queijo é produzido pela coagulação do leite.",
    preco: "R$ 50,00 pç"
)

producao_6 = Producao.create(numero: 100, unidade: :unitario, periodo: :ano)
producao_7 = Producao.create(numero: 120, unidade: :unitario, periodo: :ano)

produto_queijo.produtor = produtor_stephan
produto_queijo.categoria = industrial
produto_queijo.qualidade = organico
produto_queijo.producoes << [producao_6, producao_7]
produto_queijo.save

produto_queijo.capa.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-capa.jpg"), filename: "stephan-gaehwiler-queijo-capa.jpg")

produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-1.jpg"), filename: "stephan-gaehwiler-queijo-foto-1.jpg")
produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-2.jpg"), filename: "stephan-gaehwiler-queijo-foto-2.jpg")
produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-3.jpg"), filename: "stephan-gaehwiler-queijo-foto-3.jpg")

Video.create(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8", produto: produto_queijo)

criacao_1 = Criacao.create(data: Date.parse("Dec 8 2001"), titulo: "A criação", descricao: "Criado para atender ... foi transido pela família...")
criacao_2 = Criacao.create(data: Date.parse("Dec 8 2002"), titulo: "A transformação", descricao: "Importou as vacas devido ... e perceber ...")
criacao_3 = Criacao.create(data: Date.parse("Dec 8 2005"), titulo: "O sentimento", descricao: "Hoje seu sonho foi realizado, devido o prêmio ....")


produto_queijo.criacoes << [criacao_1, criacao_2, criacao_3]

puts "# #{produto_queijo.nome}"


#end