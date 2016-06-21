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
#

class Emissor < ApplicationRecord
  belongs_to :user
end
