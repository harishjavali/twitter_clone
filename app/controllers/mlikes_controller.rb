class MlikesController < ApplicationController
    def create
        @mlike = current_user.mlikes.new(mlike_params)
        if !@mlike.save
            flash[:notice] = @mlike.errors.full_messages.to_sentence
        end
        redirect_to root_url
    end
    def destroy
        @mlike = current_user.mlikes.find(params[:id])
        @mlike.destroy
        redirect_to root_url
    end
 private
 def mlike_params
    params.require(:mlike).permit(:micropost_id)
end
end