require 'rails_helper'

RSpec.describe Student, type: :model do
  describe '#validations' do
    let(:student) { build(:student) }
    context 'name validation' do
      it 'should be not valid when name value is empty' do
        aggregate_failures 'not valid' do
          student.name = ''
          expect(student).not_to be_valid
          expect(student.errors[:name]).to include("can't be blank")
        end
      end
    end

    context 'phone_no validation' do
      it 'should be not valid when phone_no value is empty' do
        aggregate_failures 'not valid' do
          student.phone_no = ''
          expect(student).not_to be_valid
          expect(student.errors[:phone_no]).to include("can't be blank")
        end
      end
    end

    context 'studying_id validation' do
      it 'should be not valid when studying_id value is empty' do
        aggregate_failures 'not valid' do
          student.studying_id = ''
          expect(student).not_to be_valid
          expect(student.errors[:studying_id]).to include("can't be blank")
        end
      end

      it 'should be not valid when studying_id is not unique' do
        aggregate_failures 'not valid' do
          student.save!
          student2 = build(:student)
          student2.studying_id = student.studying_id
          expect(student2).not_to be_valid
          expect(student2.errors[:studying_id]).to include("has already been taken")
        end
      end
    end
  end
end
