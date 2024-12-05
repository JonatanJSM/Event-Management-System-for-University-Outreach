@isTest
private class TestEventController {

    @testSetup
    static void setup() {
        // Create test data
        List<Campaign> campaigns = new List<Campaign>();
        campaigns.add(new Campaign(Name = 'Campaign 1', StartDate = Date.today().addDays(1), IsActive = true));
        campaigns.add(new Campaign(Name = 'Campaign 2', StartDate = Date.today().addDays(2), IsActive = true));
        campaigns.add(new Campaign(Name = 'Campaign 3', StartDate = Date.today().addDays(3), IsActive = false));
        insert campaigns;
    }

    @isTest
    static void testGetActiveCampaigns() {
        // Call the method to test
        List<Campaign> activeCampaigns = EventController.getActiveCampaigns();

        // Verify the results
        System.assertEquals(2, activeCampaigns.size(), 'There should be 2 active campaigns');
        System.assertEquals('Campaign 1', activeCampaigns[0].Name, 'First campaign should be Campaign 1');
        System.assertEquals('Campaign 2', activeCampaigns[1].Name, 'Second campaign should be Campaign 2');
    }
}