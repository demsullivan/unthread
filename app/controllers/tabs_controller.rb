# frozen_string_literal: true

class TabsController < ApplicationController
  ################################################################################
  # Callbacks
  ################################################################################
  before_action :require_login
  before_action :fetch_pane

  private def fetch_pane
    @pane = current_user.panes.find(params[:pane_id])
  end

  ################################################################################
  # Actions
  ################################################################################
  def create
    new_tab    = { name: "New Thread", id: params[:id], closeable: true }
    attributes = { active_tab: params[:id] }

    attributes.merge!(tabs: @pane.tabs + [new_tab]) unless @pane.has_tab?(params[:id])

    @pane.update(attributes)

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(@pane)
      end
    end
  end

  def update
    attributes = {}
    attributes.merge!(active_tab: params[:id]) if params[:active]

    @pane.update(attributes)

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(@pane)
      end
    end
  end

  def destroy
    tabs = @pane.tabs.reject { |tab| tab['id'] == params[:id] }

    @pane.update(active_tab: tabs.last['id'], tabs:)

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(@pane)
      end
    end
  end
end