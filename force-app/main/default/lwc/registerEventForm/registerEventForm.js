import { LightningElement, track } from 'lwc';
import createRegistration from '@salesforce/apex/RegistrationFormController.createRegistration';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RegisterEventForm extends LightningElement {
    name = '';
    campaignId = '';
    lastname = '';
    email = '';
    campaignId;

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastname = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    
    connectedCallback() {
        const urlParams = new URLSearchParams(window.location.search);
        this.campaignId = urlParams.get('campaignId');
    }

    handleSubmit() {
        createRegistration({ firstName: this.name , lastName: this.lastname, email: this.email, campaignId: this.campaignId })
            .then(() => {
                console.log('Registration form created successfully');
                this.dispatchEvent(new CustomEvent('success'));
            })
            .catch(error => {
                console.error('Error creating registration form', error);
            });
    }
}