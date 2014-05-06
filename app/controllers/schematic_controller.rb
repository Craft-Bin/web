class SchematicController < ApplicationController

  def view
    @schem = Schematic.where(hash: params[:hash]).first
    if @schem == nil
      raise ActionController::RoutingError.new 'Not found'
    end
  end

  def browse
    @list = Schematic.all
  end

end