class BelongingsController < ApplicationController

  def belonging
  end

  def create
    @belonging = Belonging.create(organization_id:param[:organaization_id],user_id:params[:user_id])
    @belonging.save
  end

end
