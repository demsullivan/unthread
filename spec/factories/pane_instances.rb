FactoryBot.define do
  factory :pane_instance do
    parent_pane_id { "" }
    child_pane_id { "" }
    size { 1 }
  end
end
