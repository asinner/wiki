class Page < ActiveRecord::Base
  has_and_belongs_to_many :contributors, -> { uniq }, class_name: 'User'
end
