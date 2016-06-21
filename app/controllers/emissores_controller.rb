class EmissoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @emissor = Emissor.new
  end

  def create
    @emissor = current_user.build_emissor(emissor_params)
    if @emissor.save!
      flash[:notice] = 'Emissor cadastrado com sucesso'
      redirect_to action: :new
    end
  end

  private

    def emissor_params
      params.require(:emissor).permit(:nome_fantasia, :razao_social,
        :inscricao_estadual, :inscricao_municipal, :cep, :logradouro,
        :numero_do_endereco, :complemento, :bairro, :tipo_de_pessoa_id,
        :uf_id, :municipio_id)
    end
end
