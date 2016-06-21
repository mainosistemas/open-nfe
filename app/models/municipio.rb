# == Schema Information
#
# Table name: municipios
#
#  id          :integer          not null, primary key
#  nome        :string           not null
#  codigo_ibge :integer          not null
#  capital     :boolean          default(FALSE), not null
#  uf_id       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Municipio < ApplicationRecord
  belongs_to :uf
  validates_presence_of :uf, :nome, :codigo_ibge
end
