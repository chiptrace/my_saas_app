class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else
            flash[:error] = 'Error occured, message has not been sent.'
            redirect_to new_contact_path
        end
    end
    
    private
        # Dit stuk code zal de inkomende gegevens van de contact-from ontvangen en in een array aanbieden aan contact.new om er een nieuw contact mee te maken
        # Dit zal een een privaat stuk gebeuren = achter gesloten deuren in de code
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
    
end