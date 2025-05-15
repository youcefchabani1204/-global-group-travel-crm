trigger tripCreationVerification on Trip__c (before insert,before update) {
     if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
      TripService.checkIfTripDateCorrect(Trigger.new);
     }
}