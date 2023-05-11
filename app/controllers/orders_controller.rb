class OrdersController < ApplicationController
  before_action :set_email, only: [:create]

  def show
    @order = Order.find(params[:id])
    @stripe_email = session[:stripe_email]
  end

  def create
    charge = perform_stripe_charge
    order = create_order(charge)
    session[:stripe_email] = params[:stripeEmail]

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def set_email
    if current_user
      params[:stripeEmail] = current_user.email
    else
      params[:stripeEmail] = '' # Set an empty string for visitors
    end
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source: params[:stripeToken],
      amount: cart_subtotal_cents,
      description: "#{current_user&.first_name} #{current_user&.last_name}'s Jungle Order",
      currency: 'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id
    )
  
    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
  
    order.save!
    order
  end
  
end  