class TemplateSection < ApplicationRecord
  belongs_to :template_page
  has_many :template_components, dependent: :destroy
end
