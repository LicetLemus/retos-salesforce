@istest
public class AddPrimaryContactTest {

    @istest
    public static void testAddPrimaryContact() {
        // insert to record test for BillingState

        List<Account> accToInsert = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accToInsert.add(
                new Account(
                    Name = 'NY Account'+ i,
                    BillingState = 'NY')
            );
        }

        for (Integer i = 0; i < 50; i++) {
            accToInsert.add(
                new Account(
                    Name = 'CA Account'+ i,
                    BillingState = 'CA')
            );
        }

        insert accToInsert;

        // insert to record test for PrimaryContact
        Contact userContact = new Contact(FirstName='userTest', LastName='Queueable');
        insert userContact;

        // Create our Queueable instance
        AddPrimaryContact addContactJob = new AddPrimaryContact(userContact, 'CA');

        Test.startTest();
        System.enqueueJob(addContactJob);
        Test.stopTest();

        List<Contact> insertedContacts = [SELECT Id, AccountId FROM Contact WHERE Account.BillingState = 'CA'];

        System.assertEquals(50, insertedContacts.size());
    }
}