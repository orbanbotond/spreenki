class Admin::DashboardController < Admin::Enki::BaseController
  def show
    @posts            = Post.find_recent(:limit => 8)
    @comment_activity = CommentActivity.find_recent
    @stats            = Stats.new
  end
end
