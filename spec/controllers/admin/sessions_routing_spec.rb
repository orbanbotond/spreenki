require File.dirname(__FILE__) + '/../../spec_helper'

describe PostsController do
  describe "route" do
    it 'generates show params' do
      {:get => "/admin/blog/session"}.should route_to(:controller => 'admin/sessions', :action => 'show')
    end

    it 'generates new params' do
      {:get => "/admin/blog/session/new"}.should route_to(:controller => 'admin/sessions', :action => 'new')
    end

    it 'generates destroy params' do
      {:delete => "/admin/blog/session"}.should route_to(:controller => 'admin/sessions', :action => 'destroy')
    end
  end
end
