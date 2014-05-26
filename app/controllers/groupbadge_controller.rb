class GroupbadgeController < ApplicationController
  def create
  	@groupbadge = current_user.groupbadge!(target) if target rescue ActiveRecord::RecordInvalid

    if @groupbadge
      respond_to do |format|
        format.html { render :nothing => true, :status => 201 }
        format.mobile { redirect_to post_path(@groupbadge.post_id) }
        format.json { render :json => @groupbadge.as_api_response(:backbone), :status => 201 }

      end
    else
      render :nothing => true, :status => 422
    end
  end

  def index
    result = []
    next_id = nil
    while result.length <100
      data = User.groupbadge()
      next_id = data.pagination.next_max_id
      result.concat(data)
    end

  	@groupbadge = target.groupbadge.includes(:author => :profile)
    @people = @groupbadge.map(&:author)

    respond_to do |format|
      format.all { render :layout => false }
      format.json { render :json => @groupbadge.as_api_response(:backbone) }
    end
  end

  def target
  	@target ||= if params[:user_id]
    current_user.find_visible_shareable_by_id(Post, params[:user_id]) || raise(ActiveRecord::RecordNotFound.new)
  	end
  end

  def voteup
  	@totallike = likes.find(params[:id])
 	  @totallike.ups=@likes.ups+1
 	  @totallike.save
 	  render :text => "<div class='up'></div>"
  end
  def voteddown
  	@totallike = likes.find(params[:id])
    @totallike.downs=@likes.downs+1
 	  @totallike.save
 	  render :text => "<div class='down'></div>"
  end

end
