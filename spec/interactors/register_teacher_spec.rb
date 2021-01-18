require 'rails_helper'

RSpec.describe RegisterTeacher, type: :interactor do
  let(:proposal_params) do
    {
      'description' => 'I am a awesome teacher ever',
      'full_name' => 'Johm Doe',
      'email' => 'sample@gmail.com',
      'courses' => [ { :name => 'sample', :description => 'sample'} ]
    }
  end
  subject(:context) { RegisterTeacher.call(proposal_params: proposal_params) }

  describe '.call' do
    context 'when given valid paramters' do

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the user email' do
        expect(context.teacher.email).to eq(proposal_params['email'])
      end
    end

    context 'when given invalid parameters' do
      let(:teacher_already_registered) { create(:teacher, email: 'sample@gmail.com') }
      let(:proposal_params) do
        {
          'description' => 'I am a awesome teacher',
          'full_name' => 'Johm Doe',
          'email' => 'sample@gmail.com'
        }
      end

      it 'fails' do
        teacher_already_registered
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        teacher_already_registered
        expect(context.errors).to be_present
      end
    end
  end
end
