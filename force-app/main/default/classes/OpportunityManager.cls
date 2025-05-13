public with sharing class OpportunityManager {
    public static void createOpportunity(String name, String stageName, Date closeDate) {
        Opportunity opp = new Opportunity(
            Name = name,
            StageName = stageName,
            CloseDate = closeDate
        );
        insert opp;
       }

    public static List<Opportunity>  getOpportunities() {
        return [SELECT Id, Name, StageName, CloseDate FROM Opportunity];
    }

    public static void updateOpportunity(Id opportunityId, String stageName) {
        Opportunity opp = [SELECT Id, StageName FROM Opportunity WHERE Id = :opportunityId];
        opp.StageName = stageName;
        update opp;
    }

    public static void deleteOpportunity(Id opportunityId) {
        Opportunity opp = [SELECT Id FROM Account WHERE Id = :opportunityId];
        delete opp;
    }
}