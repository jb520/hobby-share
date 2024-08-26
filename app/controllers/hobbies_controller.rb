class HobbiesController < ApplicationController
  before_action :set_hobby, only: %i[ show update destroy ]
  def index
    #  matching_hobbies = Hobby.all
    @hobbies = Hobby.all
    @list_of_hobbies = @hobbies.order({ :created_at => :desc })

    #  render({ :template => "hobbies/index" })
    # #@hobbies = Hobby.all
  end

  def show
    # You are adding all hobbies to the show page so technically a user can have access to all the hobbies in the show page but it should only be one hobby.
    # Which you do in the before action

    @hobbies = Hobby.all

    # remove any unused code

     #the_id = params.fetch("path_id")

     #matching_hobbies = Hobby.where({ :id => the_id })

     #@the_hobby = matching_hobbies.at(0)

    # render({ :template => "hobbies/show" })
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
    # the hobby is being set in the before action so no need to look for it again
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
    # also being done in the before action. Not necessary to do the queries agian.
    the_id = params.fetch("path_id")
    the_hobby = Hobby.where({ :id => the_id }).at(0)

    the_hobby.destroy

    redirect_to("/hobbies", { :notice => "Hobby deleted successfully."} )
  end

  private
    def set_hobby
      @hobby = Hobby.find(params[:id])
    end

  # Strong params are good. Any reason to comment out?

  #   def hobby_params
  #     params.require(:hobby).permit(:name)
  #   end

end
