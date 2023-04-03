require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe '#validations' do
    let(:teacher) { build(:teacher) }
    context 'name validation' do
      it 'should be not valid when name value is empty' do
        aggregate_failures 'not valid' do
          teacher.name = ''
          expect(teacher).not_to be_valid
          expect(teacher.errors[:name]).to include("can't be blank")
        end
      end
    end

    context 'phone_no validation' do
      it 'should be not valid when name value is empty' do
        aggregate_failures 'not valid' do
          teacher.phone_no = ''
          expect(teacher).not_to be_valid
          expect(teacher.errors[:phone_no]).to include("can't be blank")
        end
      end

      it 'should be not valid when phone_no is not unique' do
        aggregate_failures 'not valid' do
          teacher.save!
          teacher2 = build(:teacher)
          teacher2.phone_no = teacher.phone_no
          expect(teacher2).not_to be_valid
          expect(teacher2.errors[:phone_no]).to include("has already been taken")
        end

      end




    end



  end
end
