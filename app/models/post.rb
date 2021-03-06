class Post < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  has_rich_text :rich_content

  before_save { rich_content.plain_text_body = rich_content.body.to_plain_text }
  scope :search_text, ->(query) { joins(:rich_text_rich_content).where("title ILIKE ?", "%" + query + "%").or(ActionText::RichText.where <<~SQL, "%" + query + "%") }
    plain_text_body ILIKE ?
  SQL

  acts_as_favoritable
  acts_as_votable
  accepts_nested_attributes_for :addresses
  after_initialize :calculate_sorting_score
  attr_accessor :score

  # Validates necessary post elements
  validates :title, :rich_content, presence: true

  # Validates a minimum title length of 4 characters & maximum title length of 60 chharacters
  validates :title, length: { in: 4..60 }

  # Validates phone number (Regex source: https://phoneregex.com/)
  # validates :phone_number, format: { with: %r{\+(9[976]\d|8[987530]\d|6[987]\d|
  #   5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|
  #   4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}\z}, allow_blank: true }

  # Validates email
  # validates :email, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }

  # Validates website (Regex source: https://urlregex.com/)
  # validates :website, format: { with: %r{\A(?:(?:https?|ftp)://)
  #   (?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})
  #   (?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})
  #   (?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])
  #   (?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])
  #   (?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))
  #   |(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*
  #   [a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})
  #   ?(?:\/[^\s]*)?\z}i, allow_blank: true }

  def calculate_sorting_score
    unless new_record?
      time_elapsed = (Time.zone.now - created_at) / 60 # time since submission (in hours)
      self.sorting_score = (cached_weighted_score + 1) / time_elapsed
    end
  end
end
