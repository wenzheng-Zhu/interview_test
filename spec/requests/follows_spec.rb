require 'rails_helper'

RSpec.describe 'Follows', type: :request do
  describe 'Post /create follow' do
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

  describe 'Delete /destroy unfollow' do
    let(:teacher){ create(:teacher) }
    let(:student){ create(:student) }
    before do
      post '/api/v1/follows', params: {
        student_id: student.id,
        teacher_id: teacher.id
      }
    end
    context 'with valid parameters' do
      it 'should delete the related follow and unfollow successfully' do
        follow_before = Follow.find_by(teacher_id: teacher.id, student_id: student.id)
        delete '/api/v1/unfollow', params: {
          student_id: student.id,
          teacher_id: teacher.id
        }
        follow_after = Follow.find_by(teacher_id: teacher.id, student_id: student.id)
        aggregate_failures do
          expect(follow_before.nil?).to eq(false)
          expect(follow_after.nil?).to eq(true)
        end
      end

      it "should return 'This teacher did not follow this student!' when the follow does not exist" do
        Follow.find_by(teacher_id: teacher.id, student_id: student.id).destroy
        delete '/api/v1/unfollow', params: {
          student_id: student.id,
          teacher_id: teacher.id
        }
        expect(json["message"]).to eq('This teacher did not follow this student!')
      end

      it "should return 'Check the params, the params should not be empty!' when teacher_id or student_id is nil" do
        delete '/api/v1/unfollow', params: {
          student_id: nil,
          teacher_id: teacher.id
        }
        expect(json["message"]).to eq('Check the params, the params should not be empty!')
      end

      it "should return 'Check the params, the teacher or the student does not exist!' when teacher or student does not exist" do
        delete '/api/v1/unfollow', params: {
          student_id: 99999,
          teacher_id: teacher.id
        }
        expect(json["message"]).to eq('Check the params, the teacher or the student does not exist!')
      end
    end
  end
end
