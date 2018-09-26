class Song < ActiveRecord::Base
	validates :title,
	          presence:   true,
	          uniqueness: {scope:   [:release_year, :artist_name],
	                       message: "Cannot be repeated by the same artist in the same year"},
	          length:     {minimum: 3}
	validates :artist_name,
	          presence: true,
	          length:   {minimum: 3}
	validates :release_year,
	          presence:     true,
	          numericality: {only_integer:          true,
	                         less_than_or_equal_to: Date.today.year},
	          if:           :released?
	validates :released,
	          inclusion: {in: [true, false]}
	validates :genre,
	          presence: true
end
