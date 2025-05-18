public class TestDataFactory {
    public static Opportunity createTestOpportunity(String stageName) {
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = stageName,
            CloseDate = Date.today().addDays(30)
        );
        insert opp;
        return opp;
    }
    public static Trip__c createTestTrip(Opportunity o){
        Trip__c trip = new Trip__c(
    Opportunity__c = o.Id,
    Account__c = o.AccountId,
    Status__c = 'A venir',
    Destination__c = 'Paris',
    Start_Date__c = Date.today().addDays(10),
    End_Date__c = Date.today().addDays(15),
    Number_of_Participants__c = 5,
    Total_Cost__c = 10000
);
return trip;
    }
}