class ContactSharesController < ApplicationController

def index
  render json: ContactShare.all
end


def show
  render json: ContactShare.find(params[:id])
end

def create
  contact_share = ContactShare.new(contact_share_parameters)
  if contact_share.save
    render json: contact_share
  else
    render json: contact_share.errors.full_messages, status: :unprocessable_entity
  end
end

def update
  contact_share = ContactShare.new(contact_share_parameters)
  if contact_share.update
    render json: contact_share
  else
    render json: contact_share.errors.full_messages, status: :unprocessable_entity
  end
end

def destroy
  contact_share = ContactShare.new(contact_share_parameters)
  if contact_share.destroy
    render json: contact_share
  else
    render json: contact_share.errors.full_messages, status: :unprocessable_entity
  end
end





private
  def contact_share_parameters
    params[:contact_share].permit(:contact_id, :user_id)
  end
end
