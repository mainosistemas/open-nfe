FactoryGirl.define do
  factory :emissor do
    tipo_de_pessoa
    nome_fantasia 'FOO'
    razao_social 'FOO LTDA'
    inscricao_estadual '123456'
    inscricao_municipal '123456'
    cep '123456'
    logradouro 'av dos testes'
    numero_do_endereco '123'
    complemento 'SL 123'
    bairro 'CENTRO'
    uf
    municipio
  end
end
