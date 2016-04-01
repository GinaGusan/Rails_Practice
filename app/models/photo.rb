class Photo < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", high: "500x500#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	acts_as_votable
	belongs_to :album
	has_many :comments

	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
end
