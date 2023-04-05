require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  describe 'Get api/v1/teachers#specific_teacher_students' do
    context 'with valid parameters' do
      let(:teacher){ create(:teacher) }
      let(:student1){ create(:student) }
      let(:student2){ create(:student) }
      let(:follow1){ create(:follow, teacher: teacher, student: student1) }
      let(:follow2){ create(:follow, teacher: teacher, student: student2) }

      it 'should list the right students' do
        # A big pit here, if not list follow1 and follow2, the test will fail, I've no idea why? But I guess it's because of the rspec cache
        follow1
        follow2
        get '/api/v1/teachers/specific_teacher_students', params: { teacher_id: teacher.id }
        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(json).to eq(
                            {"data"=>
                               [{"id"=>"1",
                                 "type"=>"student",
                                 "attributes"=>
                                   {"name"=>"#{student1.name}",
                                    "studying_id"=>"#{student1.studying_id}",
                                    "phone_no"=>"#{student1.phone_no}"}},
                                {"id"=>"2",
                                 "type"=>"student",
                                 "attributes"=>
                                   {"name"=>"#{student2.name}",
                                    "studying_id"=>"#{student2.studying_id}",
                                    "phone_no"=>"#{student2.phone_no}"}}]}
                          )
        end
      end

      it "should return 'Check please, could not find the teacher!' when the teacher does not exist" do
        follow1
        follow2
        get '/api/v1/teachers/specific_teacher_students', params: { teacher_id: 99999 }
        expect(json["message"]).to eq('Check please, could not find the teacher!')
      end
    end
  end
end