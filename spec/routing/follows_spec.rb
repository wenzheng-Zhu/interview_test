require 'rails_helper'

RSpec.describe 'follows routes' do
  it 'routes to follows#unfollow' do
    expect(delete '/api/v1/unfollow').to route_to('api/v1/follows#unfollow')
  end
end