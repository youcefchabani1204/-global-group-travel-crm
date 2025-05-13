public with sharing class TripManager {

    // Créer un voyage
    public static void createTrip(String name, Date startDate) {
        Trip__c trip = new Trip__c(
            Name = name,
            Start_Date__c = startDate
        );
        insert trip;
    }

    // Lire les voyages
    public static List<Trip__c> getTrips() {
        return [SELECT Id, Name, Start_Date__c FROM Trip__c];
    }

    // Mettre à jour une date de départ
    public static void updateTrip(Id tripId, Date newStartDate) {
        Trip__c trip = [SELECT Id, Start_Date__c FROM Trip__c WHERE Id = :tripId];
        trip.Start_Date__c = newStartDate;
        update trip;
    }

    // Supprimer un voyage
    public static void deleteTrip(Id tripId) {
        Trip__c trip = [SELECT Id FROM Trip__c WHERE Id = :tripId];
        delete trip;
    }
}