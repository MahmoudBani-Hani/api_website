class TemplateComponent < ApplicationRecord
  belongs_to :template_section

  enum :component_type, { heading: 0, text: 1, image: 2, video: 3, button: 4, card: 5 }
  enum :status, { draft: 0, published: 1, archived: 2 }
end
