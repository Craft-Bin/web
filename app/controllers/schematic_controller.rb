class SchematicController < ApplicationController

  def view
    @schem = Schematic.where(hash: params[:hash]).first
    if @schem == nil
      raise ActionController::RoutingError.new 'Not found'
    end
    @schem.views = @schem.views + 1
    @schem.save!
  end

  def user_browse
    if !user_signed_in?
      flash[:error] = 'You must be signed in to do that'
      redirect_to '/users/sign_in'
      return
    end
    @list = current_user.schematics
  end

  def browse
    @list = Schematic.all
  end


end