class Blog < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
end
