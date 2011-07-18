require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController do
  describe "route" do
    it "should generate index params" do
      {:get => "/"}.should route_to(:controller => "posts", :action => "index")
      {:get => "format/posts.atom"}.should route_to(:controller => "posts", :action => "index", :format => 'atom')
    end

    it "should generate tag params" do
      {:get => "tags/code"}.should route_to(:controller => "posts", :action => "index", :tag => "code")
      {:get => "tags/code.atom"}.should route_to(:controller => "posts", :action => "index", :tag => "code", :format => 'atom')
    end

    it "should generate show params" do
      {:get => "/blog//2008/02/01/a-post"}.should route_to(:controller => "posts", :action => "show", :year => '2008', :month => '02', :day => '01', :slug => 'a-post')
    end
  end
end
