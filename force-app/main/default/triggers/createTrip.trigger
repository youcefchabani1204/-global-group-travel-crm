trigger createTrip on Opportunity (before insert) {
 if (Trigger.isAfter && Trigger.isUpdate) {
        TripService.createTripWhenOpportunityUpdated(Trigger.new, Trigger.oldMap);
    }
}