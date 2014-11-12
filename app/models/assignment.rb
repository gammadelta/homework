class Assignment < ActiveRecord::Base
belongs_to :user
validates :description,  presence: true, length: { minimum: 30 }
validates :points, presence:true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
validates :subsubject, presence:true, numericality: {greater_than: 0 ,:message => "choose and option without a -- infront" }



end
