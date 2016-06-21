FactoryGirl.define do
  factory :cliente do
    tipo_de_pessoa
    numero_do_documento '123'
    inscricao_estadual '123'
    inscricao_municipal '123'
    razao_social 'foo'
    cep '123'
    endereco 'foo'
    numero '123'
    complemento 'fd'
    bairro 'foo'
    pais
    uf
    municipio
  end
end
