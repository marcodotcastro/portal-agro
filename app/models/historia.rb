# == Schema Information
#
# Table name: historias
#
#  id          :bigint(8)        not null, primary key
#  data        :datetime
#  descricao   :string
#  titulo      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produtor_id :bigint(8)
#
# Indexes
#
#  index_historias_on_produtor_id  (produtor_id)
#
# Foreign Keys
#
#  fk_rails_...  (produtor_id => produtores.id)
#

class Historia < ApplicationRecord
  belongs_to :produtor, optional: true
  belongs_to :produto, optional: true

  validates :data, :descricao, :titulo, :produtor_id, presence: true
end
