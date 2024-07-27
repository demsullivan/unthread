# frozen_string_literal: true

class PanesController < ApplicationController
  ################################################################################
  # Callbacks
  ################################################################################
  before_action :require_login
  before_action :fetch_pane, only: %i[show update]

  private def fetch_pane
    @pane = current_user.panes.find(params[:id])
  end

  def show
  end

  def update
    # TODO: Support resizing - though that might be a layout concern?
    # attributes = {}
    @pane.update!(update_params)
    
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(@pane)
      end
    end
  end

  private def update_params
    params.require(:pane).permit(
      :layout,
      :tabs,
      child_pane_instances_attributes: [
        :size,
        child_pane_attributes: [
          :user_id, 
          :active_tab,
          tabs: [:name, :id, :closeable]
        ]
      ]
    )
  end
end