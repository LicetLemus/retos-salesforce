// I have a contact that I want to clone into account with a defined status
// for example: 'Luz Parra' for an account with billingState = CA

public class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String billingState;

    // Constructor to initialize contact and billingState
    public AddPrimaryContact(Contact userContact, String state ) {
        this.contact = userContact;
        this.billingState = state;
    }

    public void execute(QueueableContext context) {

    // query the contact with state of constructor
    List<Account> acc =[
    SELECT Id, Name 
    FROM Account 
    WHERE BillingState = :billingState 
    LIMIT 200];

    List<Contact> contactsToInsert = new List<Contact>();

    // add of contact base or clone for account getting
    for (Account account : acc) {
        Contact contactClone = contact.clone(false, false, false, false);
        // relate the contact clone with the account 
        contactClone.AccountId = account.Id;
        contactsToInsert.add(contactClone);
    }

    // insert the cloned contacts
    if (!contactsToInsert.isEmpty()) {
        insert contactsToInsert;
    }

    }

}