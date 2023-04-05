require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe '#validations' do
    let(:follow) { build(:follow) }
    context 'teacher_id validation' do
      it 'should be not valid when teacher_id value is empty' do
        aggregate_failures 'not valid' do
          follow.teacher_id = ''
          expect(follow).not_to be_valid
          expect(follow.errors[:teacher_id]).to include("can't be blank")
        end
      end
    end
    context 'student_id validation' do
      it 'should be not valid when student_id value is empty' do
        aggregate_failures 'not valid' do
          follow.student_id = ''
          expect(follow).not_to be_valid
          expect(follow.errors[:student_id]).to include("can't be blank")
        end
      end
    end
  end
end
