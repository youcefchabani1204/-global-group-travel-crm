@isTest
private class TripServiceTest {
    @isTest
  private  static void createTripWhenOpportunityUpdatedTest () {

  Opportunity opp = TestDataFactory.createTestOpportunity('Prospecting');
  opp.StageName='Closed Won';
  update opp;
  



 
            Test.startTest();
            List<Trip__c> tripsCreated = [SELECT Id, End_Date__c, Opportunity__c FROM Trip__c WHERE Opportunity__c = :opp.Id];

            Test.stopTest();
            System.Assert.areEqual(1, tripsCreated.size());
            System.Assert.areEqual(opp.Id, tripsCreated[0].Opportunity__c);
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