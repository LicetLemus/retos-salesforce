public with sharing class ContactUtility {
    public static void viewContacts() {
        List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact LIMIT 3];

        for (Contact cont : listOfContacts) {
            String fullName = 'First Name: '+ cont.FirstName +', Last Name: ' + cont.LastName;
            System.debug(fullName);
        }
    }
}