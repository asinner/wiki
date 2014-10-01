class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pages = Page.all
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])    
    if @page.update(page_params)
      @page.contributors << current_user
      redirect_to page_url(@page), notice: 'Page was successfully updated'
    else
      render :edit
    end
  end
  
  def page_params
    params.require(:page).permit(:title, :body)
  end
end
