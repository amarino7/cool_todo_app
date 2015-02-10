class Task < ActiveRecord::Base
	belongs_to :taskable, polymorphic: true
	has_many :tasks, as: :taskable
end
