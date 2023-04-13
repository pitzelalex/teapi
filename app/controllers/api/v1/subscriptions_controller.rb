class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(sub_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription)
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    if subscription.destroy
      render json: SubscriptionSerializer.new(subscription)
    end
  end

  private

  def sub_params
    params.require(:subscription).permit(:tea_id, :customer_id, :title, :price, :frequency)
  end
end
