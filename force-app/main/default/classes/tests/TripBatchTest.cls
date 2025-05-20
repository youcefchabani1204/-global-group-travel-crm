
@isTest
private class TripBatchTest {

    @isTest
    static void tripBatchTest () {
        Trip__c trip = TestDataFactory.createTestTrip(Date.today().addDays(6),Date.today().addDays(20));
        Trip__c trip1 = TestDataFactory.createTestTrip(Date.today().addDays(8),Date.today().addDays(20));
        insert trip;
        insert trip1;
        Test.startTest();
        TripBatch tripBatch = new TripBatch();
        Database.executebatch(tripBatch);
        Test.stopTest();
        Trip__c updatedTrip = [SELECT Id, Status__c FROM Trip__c WHERE Id = :trip.Id];
        Trip__c updatedTrip1 = [SELECT Id, Status__c FROM Trip__c WHERE Id = :trip1.Id];
        System.assertEquals('Annulé', updatedTrip.Status__c);
        System.assertNotEquals('Annulé', updatedTrip1.Status__c);
    }
}