class TemplatePage < ApplicationRecord
  belongs_to :template
  has_many :template_sections, dependent: :destroy

  enum :page_type, { home: 0, about: 1 }
  enum :status, { draft: 0, published: 1, archived: 2 }
end
