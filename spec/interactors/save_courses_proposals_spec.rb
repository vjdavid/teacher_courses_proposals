require 'rails_helper'

RSpec.describe SaveCoursesProposals, type: :interactor do

  let(:teacher) { create(:teacher, email: 'sample@gmail.com') }
  let(:courses) do
    { 'title' => 'sample', 'description' => 'sample' }
  end
  subject(:context) { SaveCoursesProposals.call(teacher: teacher, courses: courses) }

  describe '.call' do
    context 'when given valid paramters' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the correct courses' do
        expect(context.courses).to eq(courses)
      end
    end

    context 'when given invalid parameters' do
      let(:course_registered) { create(:course, title: 'advanced programming') }
      let(:courses) do
        {
          'title' => 'advanced programming'
        }
      end

      it 'fails' do
        course_registered
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        course_registered
        expect(context.errors).to be_present
      end
    end
  end
end
