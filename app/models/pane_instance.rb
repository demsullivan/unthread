class PaneInstance < ApplicationRecord
  belongs_to :parent_pane, class_name: "Pane"
  belongs_to :child_pane, class_name: "Pane"

  accepts_nested_attributes_for :child_pane
end
