class PaymentsController < ApplicationController
  def new
  end
   
  # def create
  #   customer = Stripe::Customer.create({
  #     :email => params[:stripeEmail],
  #     :source => params[:stripeToken]
  #   })
    
  #   charge = Stripe::Charge.create({
  #     :customer => customer.id,
  #     :amount => 500,
  #     :description => 'Description of your product',
  #     :currency => 'usd'
  #   })
  
  #   rescue Stripe::CardError => e
  #     flash[:error] = e.message
  #     redirect_to new_payment_path
  # end

  def create
    #create stripe customer for payment, update if already created
    customer = Stripe::Customer.create(
      name: current_user.full_name,
      email: current_user.email,
      description: "Customer id: #{current_user.id}",
    )
  
    session = Stripe::Checkout::Session.create( 
      customer: customer, 
      payment_method_types: ['card'],
      line_items: [{
        price: 'price_1234', #price api id usually starts with price_ApIiD
        quantity: 1,
      }],
      mode: 'subscription',
      success_url:  payments_success_url,
      cancel_url: payments_cancel_url
     )
     redirect_to session.url
  end
  
  def success
    #handle successful payments
    redirect_to root_url, notice: "Purchase Successful"
  end
  
  def cancel
    #handle if the payment is cancelled
    redirect_to root_url, notice: "Purchase Unsuccessful"
  end
end
