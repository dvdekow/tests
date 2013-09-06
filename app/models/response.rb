class Response < ActiveRecord::Base
  attr_accessible :duration
  has_one :algo
end
