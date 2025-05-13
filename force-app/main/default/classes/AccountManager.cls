public with sharing class AccountManager {
    public static void createAccount(String name) {
        Account acc = new Account(Name = name);
        insert acc;
    }

    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account];
    }

    public static void updateAccount(Id accountId, String newName) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId];
        acc.Name = newName;
        update acc;
    }

    public static void deleteAccount(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId];
        delete acc;
    }
}