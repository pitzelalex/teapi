require 'rails_helper'

describe 'Subscriptions API' do
  it 'creates a subscription' do
    customer = create(:customer)
    tea = create(:tea)
    sub_params = {
      tea_id: tea.id,
      customer_id: customer.id,
      title: 'Test Subscription',
      price: 3000,
      frequency: 'Every 3 months'
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(sub_params)

    expect(response).to be_successful

    new_object = Subscription.last
    created_sub = JSON.parse(response.body, symbolize_names: true)

    expect(created_sub).to have_key(:data)
    expect(created_sub[:data][:id]).to eq(new_object.id.to_s)
    expect(created_sub[:data][:type]).to eq('subscription')
    expect(created_sub[:data]).to have_key(:attributes)
    expect(created_sub[:data][:attributes][:tea_id]).to eq(new_object.tea_id)
    expect(created_sub[:data][:attributes][:customer_id]).to eq(new_object.customer_id)
    expect(created_sub[:data][:attributes][:title]).to eq(new_object.title)
    expect(created_sub[:data][:attributes][:price]).to eq(new_object.price)
    expect(created_sub[:data][:attributes][:status]).to eq(new_object.status)
    expect(created_sub[:data][:attributes][:frequency]).to eq(new_object.frequency)
  end
end
