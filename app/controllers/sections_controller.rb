class SectionsController < ApplicationController

  layout "admin"
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_attributes)
    if @section.save
      flash[:notice] = "Created Section successfully"
      redirect_to({:action => 'show', :id => @section.id})
    else
      render('create')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_attributes)
    if @section.save
      # Successfully updated
      flash[:notice] = "Updated Section successfully"
      redirect_to({:action => 'show', :id => @section.id})
    else
      # failed to update
      render('edit')
    end

  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Successfuly deleted Section #{@section.name}"
    redirect_to({:action => 'index'})
  end

  private
    def section_attributes
      params.require(:section).permit(:name, :visible, :position, :content_type, :content, :page_id)
    end
end
