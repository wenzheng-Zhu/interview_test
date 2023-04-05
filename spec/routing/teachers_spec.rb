require 'rails_helper'

describe 'teachers route' do
  it 'route to teachers#specific_teacher_students' do
    expect(get '/api/v1/teachers/specific_teacher_students').to route_to('api/v1/teachers#specific_teacher_students')
  end
end
