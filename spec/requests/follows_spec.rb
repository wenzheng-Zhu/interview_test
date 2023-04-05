require 'rails_helper'

RSpec.describe 'Follows', type: :request do
  describe 'Post /create' do
    context 'with valid parameters' do
      let(:teacher){ create(:teacher) }
      let(:student){ create(:student) }
      before do
        post '/api/v1/follows', params: {
          student_id: student.id,
          teacher_id: teacher.id
        }
      end

      it 'should return a created status ' do
        expect(response).to have_http_status(:created)
      end

      it 'should create a new accurate follow' do
        aggregate_failures do
          new_follow = Follow.find_by(teacher_id: teacher.id, student_id: student.id)
          expect(new_follow.nil?).to eq(false)
          expect(json["message"]).to include('Followed Successfully!')
        end
      end
      it "should return message 'The teacher has followed this student before!'if the given teacher has followed the given student" do
        post '/api/v1/follows', params: {
          student_id: student.id,
          teacher_id: teacher.id
        }
        expect(json["message"]).to include('The teacher has followed this student before!')
      end

      it 'should have errors when the given teacher does not exist' do
        post '/api/v1/follows', params: {
          student_id: student.id,
          teacher_id: 99999
        }
        aggregate_failures do
          expect(json["errors"][0]["status"]).to eq("404")
          expect(json["errors"][0]["title"]).to eq("Record not Found")
        end
      end

      it 'should have errors when the given student does not exist' do
        post '/api/v1/follows', params: {
          student_id: 99999,
          teacher_id: teacher.id
        }
        aggregate_failures do
          expect(json["errors"][0]["status"]).to eq("404")
          expect(json["errors"][0]["title"]).to eq("Record not Found")
        end
      end
    end

    context 'with invalid parameters' do
      let(:teacher){ create(:teacher) }
      let(:student){ create(:student) }
      before do
        post '/api/v1/follows', params: {
          student_id: '',
          teacher_id: ''
        }
      end
      it 'should have have errors' do
        aggregate_failures do
          expect(json["errors"][0]["status"]).to eq("404")
          expect(json["errors"][0]["title"]).to eq("Record not Found")
        end
      end

    end


  end
end
