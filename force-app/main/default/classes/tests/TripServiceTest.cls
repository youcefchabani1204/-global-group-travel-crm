@isTest
private class TripServiceTest {
    @isTest
    private static void createTripWhenOpportunityUpdatedTest() {
        // Création d'une opportunité simulant une ancienne version (avant update)
        Opportunity oldOpp = TestDataFactory.createTestOpportunity('Prospecting');
        
        Opportunity newOpp = oldOpp.clone(false, false, false, false);
        newOpp.StageName = 'Closed Won';
       newOpp.Id = oldOpp.Id;
       Map<Id, Opportunity> oldMap = new Map<Id, Opportunity>{oldOpp.Id => oldOpp};

        Test.startTest();
        TripService.createTripWhenOpportunityUpdated(new List<Opportunity>{newOpp}, oldMap);
        Test.stopTest();

        List<Trip__c> trips = [SELECT Id, Opportunity__c FROM Trip__c WHERE Opportunity__c = :oldOpp.Id];
        System.assertEquals(1, trips.size(), 'Un voyage doit être créé');
        System.assertEquals(oldOpp.Id, trips[0].Opportunity__c, 'Le voyage doit être lié à la bonne opportunité');
    }
        @isTest
    private static  void  checkIfTripDateCorrectTest(){
      Date tripStartDate=Date.today().addDays(10);
      Date tripEndDate=Date.today().addDays(20);
      Trip__c tripCorrect=TestDataFactory.createTestTrip(tripStartDate,tripEndDate);
      Trip__c tripNotCorrect=TestDataFactory.createTestTrip(tripEndDate,tripStartDate);
      List <Trip__c> tripTest=new List<Trip__c>{tripCorrect,tripNotCorrect};
              Test.startTest();
              TripService.checkIfTripDateCorrect(tripTest);
              Database.SaveResult[] result=Database.insert(tripTest,false);
              test.stopTest();
              System.assertEquals(true,result[0].isSuccess());
              System.assertEquals(false,result[1].isSuccess()); 
              System.debug(result[0].isSuccess()); // true ou false pour le 1er
              System.debug(result[1].isSuccess()); // true ou false pour le 2ème 
    }
}