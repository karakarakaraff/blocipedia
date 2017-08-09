class ChargesController < ApplicationController
  def new
    if current_user.premium? || current_user.admin?
      redirect_to edit_user_registration_path(current_user)
    end

    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership",
      amount: amount
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Blocipedia Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.stripe_id = customer.id
    current_user.update_attribute :premium, true
    current_user.update_attribute :standard, false

    flash[:notice] = "Thanks for all the money, #{current_user.username}! You are now a premium member."
    redirect_to edit_user_registration_path(current_user)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy
    current_user.update_attribute :premium, false
    current_user.update_attribute :standard, true
    flash[:notice] = "Your premium membership has been canceled."
    redirect_to edit_user_registration_path(current_user)
  end

  private

  def amount
    15_00
  end
end
