public with sharing class ContractManager {
      // Créer un contrat
    public static void createContract(String status, Date startDate, Id accountId) {
        Contract con = new Contract(
            Status = status,
            StartDate = startDate,
            AccountId = accountId
        );
        insert con;
    }
    
    // Lire les contrats

     public static List<Contract> getContracts() {
        return [SELECT Id, Status, StartDate, AccountId FROM Contract];
    }

    // mettre a jour les contrats
     public static void updateContract(Id contractId, String newStatus) {
        Contract con = [SELECT Id, Status FROM Contract WHERE Id = :contractId];
        con.Status = newStatus;
        update con;
    }
    
    // supprimer les contrats
     public static void deleteContract(Id contractId) {
        Contract con = [SELECT Id FROM Contract WHERE Id = :contractId];
        delete con;
    }
}