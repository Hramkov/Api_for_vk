class Person < ActiveRecord::Base
	has_many :takes, dependent: :destroy
  belongs_to :user
end
