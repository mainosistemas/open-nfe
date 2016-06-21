# == Schema Information
#
# Table name: emissores
#
#  id                  :integer          not null, primary key
#  user_id             :integer          not null
#  nome_fantasia       :string
#  razao_social        :string
#  inscricao_estadual  :string
#  inscricao_municipal :string
#  cep                 :string
#  logradouro          :string
#  numero_do_endereco  :string
#  complemento         :string
#  bairro              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  tipo_de_pessoa_id   :integer          not null
#  uf_id               :integer          not null
#  municipio_id        :integer          not null
#

class Emissor < ApplicationRecord
  belongs_to :user
  belongs_to :tipo_de_pessoa
  belongs_to :uf
  belongs_to :municipio
  validates_presence_of :user_id, :tipo_de_pessoa_id, :nome_fantasia, :razao_social,
    :inscricao_estadual, :cep, :logradouro, :numero_do_endereco, :complemento,
    :bairro, :uf_id, :municipio_id
end
