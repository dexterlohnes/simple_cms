class PagesController < ApplicationController

  layout "admin"
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Successfully created new page"
      redirect_to({:action => 'index'})
    else
      flash[:notice] = "Failed to create new page"
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully edited page"
      redirect_to ({:action => 'show', :id => @page.id})
    else
      flash[:notice] = "Couldn't make edits"
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Deleted page #{@page.name}"
    redirect_to({:action =>'index'})
  end

  private
    def page_params
      params.require(:page).permit(:name, :position, :visible, :permalink, :section_id, :subject_id)
    end
end
