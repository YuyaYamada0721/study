class Blog < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  has_many :favorites
end
