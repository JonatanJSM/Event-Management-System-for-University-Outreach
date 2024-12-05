@isTest
private class TestRegistrationFormController {

    @isTest
    static void testCreateRegistration() {
        // Test data
        String firstName = 'John';
        String lastName = 'Doe';
        String email = 'john.doe@example.com';
        
        // Create a Campaign for the test
        Campaign testCampaign = new Campaign(Name = 'Test Campaign');
        insert testCampaign;
        
        // Call the method
        Test.startTest();
        RegistrationFormController.createRegistration(firstName, lastName, email, testCampaign.Id);
        Test.stopTest();
        
        // Verify the Contact was created
        Contact[] contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :email];
        System.assertEquals(1, contacts.size(), 'One contact should have been created');
        Contact newContact = contacts[0];
        System.assertEquals(firstName, newContact.FirstName, 'First name should match');
        System.assertEquals(lastName, newContact.LastName, 'Last name should match');
        System.assertEquals(email, newContact.Email, 'Email should match');
        
        // Verify the Registration_Form__c was created
        Registration_Form__c[] regForms = [SELECT Id, Event__c, Registration_Status__c, Student__c FROM Registration_Form__c WHERE Student__c = :newContact.Id];
        System.assertEquals(1, regForms.size(), 'One registration form should have been created');
        Registration_Form__c regForm = regForms[0];
        System.assertEquals(testCampaign.Id, regForm.Event__c, 'Campaign ID should match');
        System.assertEquals('Accepted', regForm.Registration_Status__c, 'Registration status should be Accepted');
        System.assertEquals(newContact.Id, regForm.Student__c, 'Student ID should match');
    }
}