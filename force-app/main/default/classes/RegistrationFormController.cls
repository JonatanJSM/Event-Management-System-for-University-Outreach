public with sharing class RegistrationFormController {

    @AuraEnabled
    public static void createRegistration(String firstName, String lastName, String email, String campaignId) {

        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email
        );
        insert newContact;

       
        Registration_Form__c regForm = new Registration_Form__c(
            Event__c = campaignId, 
            Registration_Status__c = 'Accepted',   
            Student__c = newContact.Id
        );
        
        insert regForm;
    }
}
