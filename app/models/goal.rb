class Goal < ActiveRecord::Base
  # validates_inclusion_of :finished, in: [true, false]
  # validates_inclusion_of :blobby, in: [true, false]

  belongs_to :user
end
