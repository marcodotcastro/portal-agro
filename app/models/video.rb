# == Schema Information
#
# Table name: videos
#
#  id          :bigint(8)        not null, primary key
#  codigo      :string
#  descricao   :string
#  nome        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produto_id  :bigint(8)
#  produtor_id :bigint(8)
#
# Indexes
#
#  index_videos_on_produto_id   (produto_id)
#  index_videos_on_produtor_id  (produtor_id)
#
# Foreign Keys
#
#  fk_rails_...  (produto_id => produtos.id)
#  fk_rails_...  (produtor_id => produtores.id)
#

class Video < ApplicationRecord
  belongs_to :produtor, optional: true
  belongs_to :produto, optional: true

  validates :codigo, :nome, :descricao, presence: true
end
