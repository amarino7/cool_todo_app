class Task < ActiveRecord::Base
	belongs_to :taskable, polymorphic: true
	has_many :tasks, as: :taskable

	after_create :post_to_facebook


private
	def post_to_facebook
	    if taskable.is_a?(User) && taskable.oauth_token.present?
	        graph = Koala::Facebook::API.new(taskable.oauth_token)
	        graph.put_connections("me", "feed", message: "TODO: #{content}")
	    end
	end
end