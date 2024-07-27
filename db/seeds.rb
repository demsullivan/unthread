# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Pane.all.destroy_all

user = User.find_or_create_by!(username: "dave", display_name: "Dave")
user.create_viewport!(
  layout: nil,
  active_tab: "chat", 
  tabs: [{ name: "Chat", id: "chat", closeable: false }]
)
