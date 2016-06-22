class ClienteDecorator < Draper::Decorator
  delegate_all

  def menu_de_acoes
    h.link_to('Editar', h.edit_cliente_path(object))
  end
end
