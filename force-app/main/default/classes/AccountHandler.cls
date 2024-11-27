public class AccountHandler {

    public static void insertAccount(Integer numberAccountNew ) {
        
        List<Account> addAccounts = new List<Account>();
      
        Integer count = 1;
        
        while(count <= numberAccountNew){
            System.debug('counter value before incrementing ' + count);
                
                
            Account store = new Account();
            store.Name = 'Acme Inc N ' + count;
            store.AccountNumber = 'A000n '+ count;
            
			addAccounts.add(store);   
            System.debug(addAccounts);
            count++;
           
        }
        
        insert addAccounts;
    }
}