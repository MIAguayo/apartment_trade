class ApartmentsController < ApplicationController
  def index
    matching_apartments = Apartment.all

    @list_of_apartments = matching_apartments.order({ :created_at => :desc })

    render({ :template => "apartments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_apartments = Apartment.where({ :id => the_id })

    @the_apartment = matching_apartments.at(0)

    render({ :template => "apartments/show.html.erb" })
  end

  def create
    the_apartment = Apartment.new
    the_apartment.city_id = params.fetch("query_city_id")
    the_apartment.owner_id = params.fetch("query_owner_id")
    the_apartment.from_date = params.fetch("query_from_date")
    the_apartment.to_date = params.fetch("query_to_date")
    the_apartment.price = params.fetch("query_price")
    the_apartment.availability = params.fetch("query_availability", false)
    the_apartment.negotiable = params.fetch("query_negotiable", false)
    the_apartment.area = params.fetch("query_area")
    the_apartment.description = params.fetch("query_description")
    the_apartment.image = params.fetch("query_image")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments", { :notice => "Apartment created successfully." })
    else
      redirect_to("/apartments", { :alert => the_apartment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.city_id = params.fetch("query_city_id")
    the_apartment.owner_id = params.fetch("query_owner_id")
    the_apartment.from_date = params.fetch("query_from_date")
    the_apartment.to_date = params.fetch("query_to_date")
    the_apartment.price = params.fetch("query_price")
    the_apartment.availability = params.fetch("query_availability", false)
    the_apartment.negotiable = params.fetch("query_negotiable", false)
    the_apartment.area = params.fetch("query_area")
    the_apartment.description = params.fetch("query_description")
    the_apartment.image = params.fetch("query_image")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments/#{the_apartment.id}", { :notice => "Apartment updated successfully."} )
    else
      redirect_to("/apartments/#{the_apartment.id}", { :alert => the_apartment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.destroy

    redirect_to("/apartments", { :notice => "Apartment deleted successfully."} )
  end
end
