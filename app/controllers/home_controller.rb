class HomeController < ApplicationController
  def index
  	@assignment = Assignment.all
  	render "assignments/show"
  	
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

end
