class TradeRequestsController < ApplicationController
  def index
    matching_trade_requests = TradeRequest.all

    @list_of_trade_requests = matching_trade_requests.order({ :created_at => :desc })

    render({ :template => "trade_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trade_requests = TradeRequest.where({ :id => the_id })

    @the_trade_request = matching_trade_requests.at(0)

    render({ :template => "trade_requests/show.html.erb" })
  end

  def create
    the_trade_request = TradeRequest.new
    the_trade_request.sender_id = params.fetch("query_sender_id")
    the_trade_request.recipient_id = params.fetch("query_recipient_id")
    the_trade_request.apartment_id = params.fetch("query_apartment_id")
    the_trade_request.body = params.fetch("query_body")

    if the_trade_request.valid?
      the_trade_request.save
      redirect_to("/trade_requests", { :notice => "Trade request created successfully." })
    else
      redirect_to("/trade_requests", { :alert => the_trade_request.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trade_request = TradeRequest.where({ :id => the_id }).at(0)

    the_trade_request.sender_id = params.fetch("query_sender_id")
    the_trade_request.recipient_id = params.fetch("query_recipient_id")
    the_trade_request.apartment_id = params.fetch("query_apartment_id")
    the_trade_request.body = params.fetch("query_body")

    if the_trade_request.valid?
      the_trade_request.save
      redirect_to("/trade_requests/#{the_trade_request.id}", { :notice => "Trade request updated successfully."} )
    else
      redirect_to("/trade_requests/#{the_trade_request.id}", { :alert => the_trade_request.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trade_request = TradeRequest.where({ :id => the_id }).at(0)

    the_trade_request.destroy

    redirect_to("/trade_requests", { :notice => "Trade request deleted successfully."} )
  end
end
