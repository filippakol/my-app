class StretchesController < ApplicationController
  def index
    matching_stretches = Stretch.all

    @list_of_stretches = matching_stretches.order({ :created_at => :desc })

    render({ :template => "stretches/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stretches = Stretch.where({ :id => the_id })

    @the_stretch = matching_stretches.at(0)

    render({ :template => "stretches/show.html.erb" })
  end

  def create
    the_stretch = Stretch.new
    the_stretch.stretch_name = params.fetch("query_stretch_name")
    the_stretch.body_part_id = params.fetch("query_body_part_id")

    if the_stretch.valid?
      the_stretch.save
      redirect_to("/stretches", { :notice => "Stretch created successfully." })
    else
      redirect_to("/stretches", { :alert => the_stretch.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_stretch = Stretch.where({ :id => the_id }).at(0)

    the_stretch.stretch_name = params.fetch("query_stretch_name")
    the_stretch.body_part_id = params.fetch("query_body_part_id")

    if the_stretch.valid?
      the_stretch.save
      redirect_to("/stretches/#{the_stretch.id}", { :notice => "Stretch updated successfully."} )
    else
      redirect_to("/stretches/#{the_stretch.id}", { :alert => the_stretch.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_stretch = Stretch.where({ :id => the_id }).at(0)

    the_stretch.destroy

    redirect_to("/stretches", { :notice => "Stretch deleted successfully."} )
  end
end
