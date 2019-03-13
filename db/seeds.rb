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
produtor_jose_silva.perfil.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-perfil.jpg"), filename: "jose-silva-perfil.jpg")
produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-1.jpg"), filename: "jose-silva-foto-1.jpg")
produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-2.jpg"), filename: "jose-silva-foto-2.jpg")
produtor_jose_silva_historia_1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_jose_silva_historia_2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_jose_silva_historia_3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_jose_silva_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "Fdbk4v4a16Y")
produtor_jose_silva.video = produtor_jose_silva_video_1
produtor_jose_silva.historias << [produtor_jose_silva_historia_1, produtor_jose_silva_historia_2, produtor_jose_silva_historia_3]
produtor_jose_silva.cidade = cidade_cocalzinho
produtor_jose_silva.save

puts "# #{produtor_jose_silva.nome_completo}"

produtor_jose_silva_produto_leite = Produto.create(
    nome: "Leite",
    descricao: "Leite é uma secreção nutritiva de cor esbranquiçada e opaca produzida pelas glândulas mamárias das fêmeas dos mamíferos. O líquido é produzido pelas células secretoras das glândulas mamárias ou mamas. A secreção láctea de uma fêmea dias antes e depois do parto se chama colostro.",
    preco: "R$ 1,00"
)
produtor_jose_silva_produto_leite_producao_1 = Producao.create(numero: 100, medida: :litro, periodo: :dia)
produtor_jose_silva_produto_leite_producao_2 = Producao.create(numero: 150, medida: :litro, periodo: :dia)
produtor_jose_silva_produto_leite_producao_3 = Producao.create(numero: 250, medida: :litro, periodo: :dia)
produtor_jose_silva_produto_leite_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "XRgDSQJgoCI")
produtor_jose_silva_produto_leite.video = produtor_jose_silva_produto_leite_video_1
produtor_jose_silva_produto_leite.producoes << [produtor_jose_silva_produto_leite_producao_1, produtor_jose_silva_produto_leite_producao_2, produtor_jose_silva_produto_leite_producao_3]
produtor_jose_silva_produto_leite.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-capa.jpg"), filename: "jose-silva-leite-capa.jpg")
produtor_jose_silva_produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-1.jpg"), filename: "jose-silva-leite-foto-1.jpg")
produtor_jose_silva_produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-2.jpg"), filename: "jose-silva-leite-foto-2.jpg")
produtor_jose_silva_produto_leite.categoria = animal
produtor_jose_silva_produto_leite.qualidade = normal
produtor_jose_silva_produto_leite.produtor = produtor_jose_silva
produtor_jose_silva_produto_leite.save

puts "# #{produtor_jose_silva_produto_leite.nome}"

produtor_jose_silva_produto_bezerro = Produto.create(
    nome: "Bezerro",
    descricao: "Vitelo, terneiro, bezerro ou novilho são termos utilizados para descrever o boi que se encontra na idade de 1 a 6 meses, impróprio ainda para o abate, mas tem larga utilização na recria, que é a venda desses animais para um outro produtor engordar e abater. Sua carne é chamada vitela.",
    preco: "R$ 1000,00"
)
produtor_jose_silva_produto_bezerro_producao_1 = Producao.create(numero: 10, medida: :unidade, periodo: :ano)
produtor_jose_silva_produto_bezerro_producao_2 = Producao.create(numero: 15, medida: :unidade, periodo: :ano)
produtor_jose_silva_produto_bezerro_producao_3 = Producao.create(numero: 25, medida: :unidade, periodo: :ano)
produtor_jose_silva_produto_bezerro_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "tVs8EQ9bkUA")
produtor_jose_silva_produto_bezerro.video = produtor_jose_silva_produto_bezerro_video_1
produtor_jose_silva_produto_bezerro.producoes << [produtor_jose_silva_produto_bezerro_producao_1, produtor_jose_silva_produto_bezerro_producao_2, produtor_jose_silva_produto_bezerro_producao_3]
produtor_jose_silva_produto_bezerro.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-capa.jpg"), filename: "jose-silva-bezerro-capa.jpg")
produtor_jose_silva_produto_bezerro.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-foto-1.jpg"), filename: "jose-silva-bezerro-foto-1.jpg")
produtor_jose_silva_produto_bezerro.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-foto-2.jpg"), filename: "jose-silva-bezerro-foto-2.jpg")
produtor_jose_silva_produto_bezerro.categoria = animal
produtor_jose_silva_produto_bezerro.qualidade = normal
produtor_jose_silva_produto_bezerro.produtor = produtor_jose_silva
produtor_jose_silva_produto_bezerro.save

puts "# #{produtor_jose_silva_produto_bezerro.nome}"

produtor_jose_silva_produto_milho = Produto.create(
    nome: "Milho",
    descricao: "O milho é um conhecido cereal cultivado em grande parte do mundo. O milho é extensivamente utilizado como alimento humano ou para ração animal, devido às suas qualidades nutricionais.",
    preco: "R$ 30,00"
)
produtor_jose_silva_produto_milho_producao_1 = Producao.create(numero: 100, medida: :saco, periodo: :ano)
produtor_jose_silva_produto_milho_producao_2 = Producao.create(numero: 150, medida: :saco, periodo: :ano)
produtor_jose_silva_produto_milho_producao_3 = Producao.create(numero: 250, medida: :saco, periodo: :ano)
produtor_jose_silva_produto_milho_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "ki_hznmHIT8")
produtor_jose_silva_produto_milho.video = produtor_jose_silva_produto_milho_video_1
produtor_jose_silva_produto_milho.producoes << [produtor_jose_silva_produto_milho_producao_1, produtor_jose_silva_produto_milho_producao_2, produtor_jose_silva_produto_milho_producao_3]
produtor_jose_silva_produto_milho.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-capa.jpg"), filename: "jose-silva-milho-capa.jpg")
produtor_jose_silva_produto_milho.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-foto-1.jpg"), filename: "jose-silva-milho-foto-1.jpg")
produtor_jose_silva_produto_milho.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-foto-2.jpg"), filename: "jose-silva-milho-foto-2.jpg")
produtor_jose_silva_produto_milho.categoria = animal
produtor_jose_silva_produto_milho.qualidade = normal
produtor_jose_silva_produto_milho.produtor = produtor_jose_silva
produtor_jose_silva_produto_milho.save

puts "# #{produtor_jose_silva_produto_milho.nome}"

produtor_jose_silva_produto_pamonha = Produto.create(
    nome: "Pamonha",
    descricao: "Pamonha é um quitute brasileiro, comum nos estados do Nordeste e ainda em Goiás, Mato Grosso, Minas Gerais, Paraná, São Paulo e Tocantins. Provavelmente descende da culinária indígena.",
    preco: "R$ 3,50"
)
produtor_jose_silva_produto_pamonha_producao_1 = Producao.create(numero: 100, medida: :unidade, periodo: :dia)
produtor_jose_silva_produto_pamonha_producao_2 = Producao.create(numero: 150, medida: :unidade, periodo: :dia)
produtor_jose_silva_produto_pamonha_producao_3 = Producao.create(numero: 250, medida: :unidade, periodo: :dia)
produtor_jose_silva_produto_pamonha_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "MTUVNZOOnNw")
produtor_jose_silva_produto_pamonha.video = produtor_jose_silva_produto_pamonha_video_1
produtor_jose_silva_produto_pamonha.producoes << [produtor_jose_silva_produto_pamonha_producao_1, produtor_jose_silva_produto_pamonha_producao_2, produtor_jose_silva_produto_pamonha_producao_3]
produtor_jose_silva_produto_pamonha.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-capa.jpg"), filename: "jose-silva-pamonha-capa.jpg")
produtor_jose_silva_produto_pamonha.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-foto-1.jpg"), filename: "jose-silva-pamonha-foto-1.jpg")
produtor_jose_silva_produto_pamonha.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-foto-2.jpg"), filename: "jose-silva-pamonha-foto-2.jpg")
produtor_jose_silva_produto_pamonha.categoria = animal
produtor_jose_silva_produto_pamonha.qualidade = normal
produtor_jose_silva_produto_pamonha.produtor = produtor_jose_silva
produtor_jose_silva_produto_pamonha.save

puts "# #{produtor_jose_silva_produto_pamonha.nome}"


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
produtor_divino_pereira_video_1 = Video.create(nome: "Video 2", descricao: "Video 2", codigo: "Uit7H-78XPI")
produtor_divino_pereira.perfil.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-perfil.jpg"), filename: "divino-pereira-perfil.jpg")
produtor_divino_pereira.video = produtor_divino_pereira_video_1
produtor_divino_pereira.cidade = cidade_cocalzinho
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
produtor_stephan_historia_1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_stephan_historia_2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_stephan_historia_3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_stephan_video_1 = Video.create(nome: "Video 3", descricao: "Video 3", codigo: "cen9ZMYzUm0")
produtor_stephan.perfil.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-perfil.jpg"), filename: "stephan-gaehwiler-perfil.jpg")
produtor_stephan.historias << [produtor_stephan_historia_1, produtor_stephan_historia_2, produtor_stephan_historia_3]
produtor_stephan.cidade = cidade_corumba_de_goias
produtor_stephan.video = produtor_stephan_video_1
produtor_stephan.save

puts "# #{produtor_stephan.nome_completo}"

pprodutor_stephan_produto_queijo = Produto.create(
    nome: "Queijo",
    descricao: "Queijo é um alimento sólido feito a partir do leite de vacas, cabras, ovelhas, búfalas e/ou outros mamíferos. O queijo é produzido pela coagulação do leite.",
    preco: "R$ 50,00"
)
pprodutor_stephan_produto_queijo_producao_1 = Producao.create(numero: 100, medida: :unidade, periodo: :ano)
pprodutor_stephan_produto_queijo_producao_2 = Producao.create(numero: 120, medida: :unidade, periodo: :ano)
pprodutor_stephan_produto_queijo_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8")
pprodutor_stephan_produto_queijo_criacao_1 = Criacao.create(data: Date.parse("Dec 8 2001"), titulo: "A criação", descricao: "Criado para atender ... foi transido pela família...")
pprodutor_stephan_produto_queijo_criacao_2 = Criacao.create(data: Date.parse("Dec 8 2002"), titulo: "A transformação", descricao: "Importou as vacas devido ... e perceber ...")
pprodutor_stephan_produto_queijo_criacao_3 = Criacao.create(data: Date.parse("Dec 8 2005"), titulo: "O sentimento", descricao: "Hoje seu sonho foi realizado, devido o prêmio ....")
pprodutor_stephan_produto_queijo.capa.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-capa.jpg"), filename: "stephan-gaehwiler-queijo-capa.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-1.jpg"), filename: "stephan-gaehwiler-queijo-foto-1.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-2.jpg"), filename: "stephan-gaehwiler-queijo-foto-2.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-3.jpg"), filename: "stephan-gaehwiler-queijo-foto-3.jpg")
pprodutor_stephan_produto_queijo.video = pprodutor_stephan_produto_queijo_video_1
pprodutor_stephan_produto_queijo.criacoes << [pprodutor_stephan_produto_queijo_criacao_1, pprodutor_stephan_produto_queijo_criacao_2, pprodutor_stephan_produto_queijo_criacao_3]
pprodutor_stephan_produto_queijo.producoes << [pprodutor_stephan_produto_queijo_producao_1, pprodutor_stephan_produto_queijo_producao_2]
pprodutor_stephan_produto_queijo.categoria = industrial
pprodutor_stephan_produto_queijo.qualidade = organico
pprodutor_stephan_produto_queijo.produtor = produtor_stephan
pprodutor_stephan_produto_queijo.save

puts "# #{pprodutor_stephan_produto_queijo.nome}"

produtor_maria_alves = Produtor.create(
    nome: "Maria",
    sobrenome: "Alves",
    telefone: "(62) 99998-12345",
    email: "maria.alves@gmail.com",
    endereco: "R 03, Bro 9 de Julho",
    apelido: "Mariazinha",
    whatsapp: false,
    cartao: true
)
produtor_maria_alves.perfil.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-perfil.jpg"), filename: "maria-alves-perfil.jpg")
produtor_maria_alves.fotos.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-foto-1.jpg"), filename: "maria-alves-foto-1.jpg")
produtor_maria_alves.fotos.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-foto-2.jpg"), filename: "maria-alves-foto-2.jpg")
produtor_maria_alves_historia_1 = Historia.create(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_maria_alves_historia_2 = Historia.create(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_maria_alves_historia_3 = Historia.create(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_maria_alves_video_1 = Video.create(nome: "Video 3", descricao: "Video 3", codigo: "cen9ZMYzUm0")
produtor_maria_alves.historias << [produtor_maria_alves_historia_1, produtor_maria_alves_historia_2, produtor_maria_alves_historia_3]
produtor_maria_alves.video = produtor_maria_alves_video_1
produtor_maria_alves.cidade = cidade_corumba_de_goias
produtor_maria_alves.save

puts "# #{produtor_maria_alves.nome_completo}"

produtor_maria_alves_produto_soja = Produto.create(
    nome: "Soja",
    descricao: "A soja (Glycine max), também conhecida como feijão-soja e feijão-chinês, é uma planta pertence à família Fabaceae, família esta que compreende também plantas como o feijão, a lentilha e a ervilha.",
    preco: "R$ 60,00"
)
produtor_maria_alves_produto_soja_producao_4 = Producao.create(numero: 500, medida: :saco, periodo: :ano)
produtor_maria_alves_produto_soja_producao_5 = Producao.create(numero: 450, medida: :saco, periodo: :ano)
produtor_maria_alves_produto_soja_video_1 = Video.create(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8")
produtor_maria_alves_produto_soja.produtor = produtor_maria_alves
produtor_maria_alves_produto_soja.categoria = vegetal
produtor_maria_alves_produto_soja.qualidade = natural
produtor_maria_alves_produto_soja.video = produtor_maria_alves_produto_soja_video_1
produtor_maria_alves_produto_soja.producoes << [produtor_maria_alves_produto_soja_producao_4, produtor_maria_alves_produto_soja_producao_5]
produtor_maria_alves_produto_soja.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-soja-capa.jpg"), filename: "jose-silva-soja-capa.jpg")
produtor_maria_alves_produto_soja.save

puts "# #{produtor_maria_alves_produto_soja.nome}"

#end