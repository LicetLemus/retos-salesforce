public with sharing class AccountUtility {

    public static void viewAnnualRevenue() {

        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];

        for (Account acco : accountsList) {
            String acctRev = 'Account Name: ' + acco.Name + ', Annual Revenue: ' + acco.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}