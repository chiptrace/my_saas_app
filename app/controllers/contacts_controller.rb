class ContactsController < ApplicationController
    # Maken van een nieuwe tijdelijke gebruiker in de server, klaar om gegevens te ontvangen 
    def new
        @contact = Contact.new
    end
    
    # De ontvangen gegevens van "new" bewaren in een effectief DB bestand
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            # Bij naam geven van een FLASH-gebreurtenissen best woorden gebruiken die ook bij BOOTSTRAP gebruitk wordt.
            # Hier gebruiken we "succes" en "danger"
            # Dan kunnen we die naam van de FLASH gebruiken als variabele om een "stijl" te benoemen.
            # Met een andere Random naam werkt het even goed, maar dan moet je nog de stijl appart gaan toevoegen = extra code = trager
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_contact_path
        end
    end
    
    # De gebruikergegevens aanpassen in DB
    def update
        
    end
    
    # Verwijderen van een gebruiker uit de DB
    def delete
        
    end
    
    # Welke gegevens dienen er in formulier te komen ?
    # Welke opbouw van de DB willen we ?
    private
        # Dit stuk code zal de inkomende gegevens van de contact-from ontvangen en in een array aanbieden aan contact.new om er een nieuw contact mee te maken
        # Dit zal een een privaat stuk gebeuren = achter gesloten deuren in de code
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
    
end