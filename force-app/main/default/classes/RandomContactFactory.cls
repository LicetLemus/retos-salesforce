public class RandomContactFactory {
	
    public static List<Contact> generateRandomContacts(Integer countCont, String LastnameCont) {
        
        List<Contact> contacts = new List<Contact>();
        
        for (Integer i = 0; i < countCont; i++) {
            Contact a = new Contact(FirstName= 'Test ' + i);
            contacts.add(a);
        }  
        
        return contacts;
    }
}