class Post < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  has_rich_text :rich_content
  acts_as_favoritable

  accepts_nested_attributes_for :addresses

  # Validates necessary post elements
  validates :title, :vote_score, presence: true

  # Validates content of a post
  validate :content_is_attached

  # Validates a minimum title length of 4 characters & maximum title length of 30 chharacters
  validates :title, length: { in: 4..30 }

  # Validation to only allow integers as vote score
  validates :vote_score, numericality: { only_integer: true }

  # Validates phone number (Regex source: https://phoneregex.com/)
  validates :phone_number, format: { with: %r{\+(9[976]\d|8[987530]\d|6[987]\d|
    5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|
    4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}\z}, allow_blank: true }

  # Validates email
  validates :email, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }

  # Validates website (Regex source: https://urlregex.com/)
  validates :website, format: { with: %r{\A(?:(?:https?|ftp)://)
    (?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})
    (?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})
    (?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])
    (?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])
    (?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))
    |(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*
    [a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})
    ?(?:\/[^\s]*)?\z}i, allow_blank: true }

  private

  def content_is_attached
    errors.add(:rich_content, 'must be attached') unless rich_content.present?
  end
end
