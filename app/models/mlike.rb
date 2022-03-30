class Mlike < ApplicationRecord
  validates :user_id, uniqueness: {scope: :micropost_id}
  belongs_to :user
  belongs_to :micropost
end
