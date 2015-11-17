class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    all_contacts = user.contacts + user.shared_contacts
    render json: all_contacts
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_parameters)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_parameters)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

private
  def contact_parameters
    params[:contact].permit(:name, :email, :user_id)
  end


end
