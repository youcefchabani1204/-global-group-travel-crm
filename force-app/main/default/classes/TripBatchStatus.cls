global class TripBatchStatus implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, Status__c, Start_Date__c, End_Date__c
            FROM Trip__c
            WHERE Status__c != 'Annulé'
        ]);
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        List<Trip__c> tripsToUpdate = new List<Trip__c>();
        Date today = Date.today();
        
        for (SObject s : scope) {
            Trip__c trip = (Trip__c) s;

            if (today < trip.Start_Date__c) {
                trip.Status__c = 'A venir';
                tripsToUpdate.add(trip);
            } else if (today >= trip.Start_Date__c && today <= trip.End_Date__c) {
                trip.Status__c = 'En cours';
                tripsToUpdate.add(trip);
            } else if (today > trip.End_Date__c) {
                trip.Status__c = 'Terminé';
                tripsToUpdate.add(trip);
            }
        }

        if (!tripsToUpdate.isEmpty()) {
            update tripsToUpdate;
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Post-processing ou log, si besoin
    }
} 