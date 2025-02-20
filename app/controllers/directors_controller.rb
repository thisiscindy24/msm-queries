class DirectorsController < ApplicationController
  def index
    render ({:template=>"directors_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    render ({:template=>"directors_templates/details"})
  end

  def young
    @youngest_director = Director.order(dob: :desc).first
    
    render ({:template=>"directors_templates/young"})
  end
end
