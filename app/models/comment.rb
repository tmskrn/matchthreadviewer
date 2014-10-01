class Comment < ActiveRecord::Base
	acts_as_tree :order => 'created_at'

	def self.get_comments(connection, thread_fullname)
		@thread = connection.by_id(thread_fullname)

		@thread.each do |thread|
			self.get_replies(thread)
		end
	end

	def self.get_replies(object)
		type_identifier = object.fullname[0..1]
		case type_identifier
		when "t1" # object is comment
			@comments = object.replies
		when "t3" # object is thread
			@comments = object.comments
		end

		self.save_comments(@comments)

		@comments.each do |comment|
			unless comment.instance_of?(Redd::Object::MoreComments)
				self.get_replies(comment)
			end
		end
	end

	def self.save_comments(comments)
		comments.each do |comment| 
			unless comment.instance_of?(Redd::Object::MoreComments)	
				if !(comment.parent_id[0..1] == "t3") # comment is not root
					parent_id = Comment.find_by(comment_id: comment.parent_id[3..-1]).id
				else 
					parent_id = 0
				end

				if Comment.exists?(:comment_id => comment.id)
					@Comment = Comment.find_by(comment_id: comment.id)
					@Comment.content = comment.body
					@Comment.parent_id = parent_id
					@Comment.score = comment.score
					@Comment.save
				else
					@Comment = Comment.create(
					parent_id: parent_id,
					content:comment.body,
					author:comment.author,
					score:comment.score,
					created_at:comment.created,
					thread_id:comment.link_id,
					comment_id:comment.id)
				end
			end
		end
	end
end