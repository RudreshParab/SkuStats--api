class OrdersController < ApplicationController
  def create
    return {} unless order_params.present?

    @order = Order.find_or_initialize_by(external_id: order_params[:external_id])
    @order.assign_attributes(order_params.except(:external_id, line_items: [ :sku, :quantity ]))
    @order.accepts_nested_attributes_for(order_params.except(:external_id, :placed_at)) # if order_params[:line_item].present?

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessible_entity
    end
  end

  def lock
    @order = Order.find_by(id: lock_params)

    return {} unless @order.present?

    @order.locked_at = DateTime.now
  end

  private

  def order_params
    params.permit(:external_id, :placed_at, line_items: [ :sku, :quantity ])
  end

  def lock_params
    params.permit(:id)
  end
end
