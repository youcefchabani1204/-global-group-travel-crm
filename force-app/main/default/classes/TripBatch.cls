global with sharing class TripBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Date targetDate = Date.today().addDays(7);
        return Database.getQueryLocator([
            SELECT Id, Status__c, Number_of_Participants__c, Start_Date__c
            FROM Trip__c
            WHERE Start_Date__c = :targetDate
            AND Number_of_Participants__c < 10
            AND Status__c != 'Annulé'
        ]);
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Trip__c> tripsToCancel = new List<Trip__c>();
        for (SObject s : scope) {
            Trip__c trip = (Trip__c)s;
            trip.Status__c = 'Annulé';
            tripsToCancel.add(trip);
        }
        if (!tripsToCancel.isEmpty()) {
            update tripsToCancel;
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Optionnel : envoyer un email de notification ou log
    }
}