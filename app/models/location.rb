class Location < ActiveRecord::Base
  belongs_to :rover

  scope :lunar, { where :body => :luna }
end
