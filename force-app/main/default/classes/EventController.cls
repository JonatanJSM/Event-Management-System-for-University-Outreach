public with sharing class EventController {
    @AuraEnabled(cacheable=true)
    public static List<Campaign> getActiveCampaigns() {
        return [
            SELECT Id, Name, StartDate
            FROM Campaign
            WHERE IsActive = TRUE
            ORDER BY StartDate ASC
        ];
    }
}
