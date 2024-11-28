import { LightningElement, wire } from 'lwc';
import getActiveCampaigns from '@salesforce/apex/EventController.getActiveCampaigns';

export default class EventList extends LightningElement {
    campaigns;

    @wire(getActiveCampaigns)
    wiredCampaigns({ error, data }) {
        if (data) {
            this.campaigns = data;
        } else if (error) {
            console.error('Error fetching campaigns', error);
        }
    }

    get hasCampaigns() {
        return this.campaigns && this.campaigns.length > 0;
    }

    handleRegister(event) {
        const campaignId = event.target.dataset.id;
        window.location.href = `/formregister?campaignId=${campaignId}`;
    }
}
