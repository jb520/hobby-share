class HobbiesController < ApplicationController
  def index
    matching_hobbies = Hobby.all

    @list_of_hobbies = matching_hobbies.order({ :created_at => :desc })

    render({ :template => "hobbies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hobbies = Hobby.where({ :id => the_id })

    @the_hobby = matching_hobbies.at(0)

    render({ :template => "hobbies/show" })
  end

  def create
    the_hobby = Hobby.new
    the_hobby.name = params.fetch("query_name")

    if the_hobby.valid?
      the_hobby.save
      redirect_to("/hobbies", { :notice => "Hobby created successfully." })
    else
      redirect_to("/hobbies", { :alert => the_hobby.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_hobby = Hobby.where({ :id => the_id }).at(0)

    the_hobby.name = params.fetch("query_name")

    if the_hobby.valid?
      the_hobby.save
      redirect_to("/hobbies/#{the_hobby.id}", { :notice => "Hobby updated successfully."} )
    else
      redirect_to("/hobbies/#{the_hobby.id}", { :alert => the_hobby.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_hobby = Hobby.where({ :id => the_id }).at(0)

    the_hobby.destroy

    redirect_to("/hobbies", { :notice => "Hobby deleted successfully."} )
  end
end
