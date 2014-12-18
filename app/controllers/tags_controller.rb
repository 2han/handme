class TagsController < ApplicationController
	before_action :set_tag, only: [:show]

	def show
		@jobs = Job.tagged_with(@tag.name).paginate(page: params[:page], :per_page => 10)
	end

	private
	def set_tag
		@tag = ActsAsTaggableOn::Tag.find(params[:id])
	end

end
