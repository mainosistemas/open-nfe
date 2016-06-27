# == Schema Information
#
# Table name: clientes
#
#  id                  :integer          not null, primary key
#  tipo_de_pessoa_id   :integer          not null
#  numero_do_documento :string           not null
#  inscricao_estadual  :string
#  inscricao_municipal :string
#  razao_social        :string           not null
#  nome_fantasia       :string
#  cep                 :string           not null
#  endereco            :string           not null
#  numero              :string
#  complemento         :string
#  bairro              :string           not null
#  pais_id             :integer          not null
#  uf_id               :integer          not null
#  municipio_id        :integer          not null
#  user_id             :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Cliente < ApplicationRecord
  belongs_to :tipo_de_pessoa
  belongs_to :municipio
  belongs_to :user
  belongs_to :uf
  belongs_to :pais

  delegate :codigo, to: :tipo_de_pessoa, prefix: true, allow_nil: true
  delegate :nome_por_extenso, to: :tipo_de_pessoa, prefix: true, allow_nil: true
  delegate :nome, to: :uf, prefix: true, allow_nil: true

  validates_presence_of :tipo_de_pessoa_id, :numero_do_documento,
    :razao_social, :cep, :endereco, :bairro, :pais_id, :uf_id, :municipio_id,
    :user_id
end
