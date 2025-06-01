trigger createTrip on Opportunity (after update) {
 if (Trigger.isAfter && Trigger.isUpdate) {
        TripService.createTripWhenOpportunityUpdated(Trigger.new, Trigger.oldMap);
        
    }
}