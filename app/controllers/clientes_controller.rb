class ClientesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cliente, only: [:edit, :update] 

  def new
    @cliente = current_user.clientes.new
  end

  def create
    @cliente = current_user.clientes.new(cliente_params)
    if @cliente.save
      flash[:notice] = 'Cliente cadastrado com sucesso'
      redirect_to action: :edit, id: @cliente.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cliente.update(cliente_params)
      flash[:notice] = 'Cliente atualizado com sucesso'
      redirect_to action: :edit, id: @cliente.id
    else
      render :edit
    end
  end

  private

    def find_cliente
      @cliente = current_user.clientes.find(params[:id])
    end

    def cliente_params
      params.require(:cliente).permit(:tipo_de_pessoa_id, :numero_do_documento,
        :inscricao_estadual, :inscricao_municipal, :razao_social, :cep,
        :endereco, :numero, :complemento, :bairro, :pais_id, :uf_id,
        :municipio_id)
    end
end
