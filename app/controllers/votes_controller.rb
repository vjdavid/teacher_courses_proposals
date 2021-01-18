class VotesController < ApplicationController
  before_action :authenticate
  before_action :find_resource

  def create
    @vote = @resource.votes.new(voter: @current_teacher)

    if @vote.save
      render json: 'You voted successfully', status: 201
    else
      render json: { message: @vote.errors.messages }, status: 400
    end
  end

  def destroy
    @resource.votes.where(voter: @current_teacher).delete_all

    head :no_content
  end

  def find_resource
    resource = [Course, Teacher].detect {|c| params["#{c.name.underscore}_id"]}

    @resource = resource.find(params["#{resource.name.underscore}_id"])
  end
end
