class MlikesController < ApplicationController
    def create
        @mlike = current_user.mlikes.new(mlike_params)
        if !@mlike.save
            flash[:notice] = @mlike.errors.full_messages.to_sentence
        end
        redirect_to request.referrer
    end

    def show
        @users = User.find(Micropost.find(params[:viewlike_id]).mlikes.map(&:user_id))
        render 'mlikes/view_likes'
    end
    def destroy
        @mlike = current_user.mlikes.find(params[:id])
        @mlike.destroy
        redirect_to request.referrer
    end
 private
 def mlike_params
    params.require(:mlike).permit(:micropost_id)
end
end