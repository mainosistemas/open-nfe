# == Schema Information
#
# Table name: tipos_de_pessoas
#
#  id               :integer          not null, primary key
#  codigo           :string           not null
#  nome_por_extenso :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TipoDePessoa < ApplicationRecord
end
