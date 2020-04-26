# == Schema Information
#
# Table name: servicos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  medida       :integer          default("hora")
#  nome         :string
#  preco        :decimal(, )
#  published_at :date
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  produtor_id  :bigint(8)
#
# Indexes
#
#  index_servicos_on_produtor_id  (produtor_id)
#  index_servicos_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (produtor_id => produtores.id)
#

FactoryBot.define do
  factory :servico do
    sequence :nome do |n|
      "Roçar #{n}"
    end

    descricao {"O roçar é ..."}
    medida {:dia}
    preco {20.0}
    capa {fixture_file_upload(Rails.root.join('spec', 'imagens', 'divino-pereira-roçar-capa.jpg'), 'image/png')}

  end
end
