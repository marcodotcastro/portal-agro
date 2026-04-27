module PedidosHelper
  STATUS_BADGE_CLASSES = {
    "novo" => "pedidos-panel__badge--novo",
    "em_contato" => "pedidos-panel__badge--em-contato",
    "concluido" => "pedidos-panel__badge--concluido",
    "cancelado" => "pedidos-panel__badge--cancelado"
  }.freeze

  def pedido_status_label(status)
    I18n.t("activerecord.attributes.pedido.statuses.#{status}", default: status.to_s.humanize)
  end

  def pedido_status_badge_class(status)
    STATUS_BADGE_CLASSES.fetch(status.to_s, "pedidos-panel__badge--padrao")
  end
end
