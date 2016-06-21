class EmissoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @emissor = Emissor.new
  end

  def create
    @emissor = current_user.build_emissor(emissor_params)
    if @emissor.save
      flash[:notice] = 'Emissor cadastrado com sucesso'
      redirect_to action: :edit, id: @emissor.id
    else
      render :new
    end
  end

  def edit
    @emissor = current_user.emissor
  end

  def update
    @emissor = current_user.emissor
    if @emissor.update(emissor_params)
      flash[:notice] = 'Emissor atualizado com sucesso'
      redirect_to action: :edit, id: @emissor.id
    else
      render :edit
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
