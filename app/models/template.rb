class Template < ApplicationRecord
  has_many :template_pages, dependent: :destroy

  enum :status, { draft: 0, published: 1, archived: 2 }
end
