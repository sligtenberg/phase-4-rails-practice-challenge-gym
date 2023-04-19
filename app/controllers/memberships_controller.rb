class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Membership.all
    end

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    # def destroy
    #     Membership.find(params[:id]).destroy
    #     head :no_content
    # end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
    
end
