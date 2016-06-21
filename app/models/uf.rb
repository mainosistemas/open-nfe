# == Schema Information
#
# Table name: ufs
#
#  id               :integer          not null, primary key
#  codigo_ibge      :integer          not null
#  nome             :string           not null
#  nome_por_extenso :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Uf < ApplicationRecord
end
