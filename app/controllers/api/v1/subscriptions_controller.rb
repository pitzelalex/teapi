class Api::V1::SubscriptionsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    sub = Subscription.new(sub_params)
    if sub.save
      render json: SubscriptionSerializer.new(sub)
    end
  end

  private

  def sub_params
    params.require(:subscription).permit(:tea_id, :customer_id, :title, :price, :frequency)
  end
end
