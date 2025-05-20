
@isTest
private class TripBatchStatusTest {

    @isTest
    static void tripBatchStatusTest() {
        Trip__c tripFuture= TestDataFactory.createTestTrip(Date.today().addDays(5),Date.today().addDays(10));
        Trip__c tripCurrent= TestDataFactory.createTestTrip(Date.today().addDays(-1),Date.today().addDays(1));
        Trip__c tripPast= TestDataFactory.createTestTrip(Date.today().addDays(-10),Date.today().addDays(-5));

    insert new List<Trip__c>{ tripFuture, tripCurrent, tripPast };
        Test.startTest();
        Database.executeBatch(new TripBatchStatus());
        Test.stopTest();
        Map<Id, Trip__c> updatedTrips = new Map<Id, Trip__c>(
            [SELECT Id, Status__c FROM Trip__c WHERE Id IN :new List<Id>{tripFuture.Id, tripCurrent.Id, tripPast.Id}]
        );
         System.assertEquals('A venir', updatedTrips.get(tripFuture.Id).Status__c);
        System.assertEquals('En cours', updatedTrips.get(tripCurrent.Id).Status__c);
        System.assertEquals('Terminé', updatedTrips.get(tripPast.Id).Status__c);
    }
}