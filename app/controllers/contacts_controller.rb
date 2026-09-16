class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_sent_path, notice: "Mensagem enviada com sucesso."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
