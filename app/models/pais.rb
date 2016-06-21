# == Schema Information
#
# Table name: paises
#
#  id              :integer          not null, primary key
#  nome            :string           not null
#  codigo_ibge     :integer          not null
#  codigo_siscomex :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Pais < ApplicationRecord
  validates_presence_of :nome, :codigo_ibge, :codigo_siscomex
end
