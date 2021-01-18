class ProposalsController < ApplicationController
  def submit
    result = SubmitProposal.call(proposal_params: proposal_params)

    if result.success?
      render json: { message: 'Your proposals has been sent' }, status: 201
    else
      render json: { message: result.errors }, status: 400
    end
  end

  private

  def proposal_params
    params.permit(
      :description, :email, :full_name,
      courses: [:title, :description]
    )
  end
end
