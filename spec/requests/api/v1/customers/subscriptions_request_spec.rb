require 'rails_helper'

describe 'Customer Subscriptions API' do
  it 'returns all of a customers subscriptions' do
    customer = create(:customer)
    customer2 = create(:customer)
    create_list(:tea, 3)
    sub1 = create(:subscription, customer: customer, tea: Tea.first)
    sub2 = create(:subscription, customer: customer, tea: Tea.second)
    sub3 = create(:subscription, customer: customer, tea: Tea.third)
    sub4 = create(:subscription, customer: customer2, tea: Tea.first)

    get "/api/v1/customers/#{customer.id}/subscriptions"

    expect(response).to be_successful

    subs = JSON.parse(response.body, symbolize_names: true)

    expect(subs[:data]).to be_an Array
    expect(subs[:data].count).to eq(3)
    expect(subs[:data][0][:id]).to eq(sub1.id.to_s)
    expect(subs[:data][0][:type]).to eq('subscription')
    expect(subs[:data][0][:attributes][:tea_id]).to eq(Tea.first.id)
    expect(subs[:data][0][:attributes][:customer_id]).to eq(customer.id)
    expect(subs[:data][0][:attributes][:title]).to eq(sub1.title)
    expect(subs[:data][0][:attributes][:price]).to eq(sub1.price)
    expect(subs[:data][0][:attributes][:status]).to eq(sub1.status)
    expect(subs[:data][0][:attributes][:frequency]).to eq(sub1.frequency)
    expect(subs[:data][1][:id]).to eq(sub2.id.to_s)
    expect(subs[:data][2][:id]).to eq(sub3.id.to_s)
  end
end
