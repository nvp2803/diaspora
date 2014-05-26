class Groupbadge < ActiveRecord::Base
  attr_accessible :loginfrequency, :rank, :totallike, :totalreshare
  belongs_to :user
  belongs_to :aspect
end
