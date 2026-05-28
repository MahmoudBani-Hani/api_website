class Website < ApplicationRecord
  belongs_to :template
  enum :status, { active: 0, inactive: 1 }

  before_create :generate_uuid

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: URI.regexp(%w[http https])
  validates :template_id, presence: true

  private
  def generate_uuid
    self.uuid = SecureRandom.alphanumeric(5)
  end
end
