public with sharing class TripService {
      public static void createTripWhenOpportunityUpdated(List<Opportunity> newOpps, Map<Id, Opportunity> oldOppMap) {
                     System.debug('Old opp : ' + oldOppMap);

        List<Trip__c> tripsToInsert = new List<Trip__c>();
            for (Opportunity o : newOpps) {
            Opportunity oldOpp = oldOppMap.get(o.Id);
                       // On vérifie si le stage est passé à 'Closed Won'
            if (o.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
                Trip__c trip = new Trip__c();
                trip.Name='trip of '+o.Name;
                trip.Opportunity__c = o.Id;
                trip.Account__c = o.AccountId;
                trip.Status__c = 'A venir';
                trip.Destination__c = o.Destination__c;
                trip.Start_Date__c = o.Start_Date__c;
                trip.End_Date__c = o.End_Date__c;
                trip.Number_of_Participants__c = o.Number_of_Participants__c;
                trip.Total_Cost__c = o.Amount;
                       // Le nom est auto-généré dans Salesforce ou avec un champ formule
                tripsToInsert.add(trip);
            }
        }
        if (!tripsToInsert.isEmpty()) {
            insert tripsToInsert;
        }
    }
    public static void checkIfTripDateCorrect(List<Trip__c > newTrps){
          for (Trip__c t :  newTrps) {
              if (t.Start_Date__c >= t.End_Date__c) {
                t.addError('La date de début doit être antérieure à la date de fin du voyage.');
            }
         }
}
}
