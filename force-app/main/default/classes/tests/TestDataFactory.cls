@isTest
public class TestDataFactory {
    @isTest
    public static Opportunity createTestOpportunity(String stageName) {
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = stageName,
            Start_Date__c = Date.today().addDays(10),
            End_Date__c = Date.today().addDays(30),
              CloseDate = Date.today().addDays(31)
        );
        insert opp;
        return opp;
    }
    @isTest
    public static Trip__c createTestTrip(Date startDate,Date endDate){
        Trip__c trip = new Trip__c(
            Name = 'Test Trip',
    Status__c = 'A venir',
    Destination__c = 'Paris',
    Start_Date__c =startDate,
    End_Date__c =endDate,
    Number_of_Participants__c = 5,
    Total_Cost__c = 10000
 );
return trip;
    }
}