public class LeadProcessor implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        	'SELECT Id, Name, Email, LeadSource FROM Lead'
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        
        for(Lead lea : leads){
            lea.LeadSource = 'Dreamforce';
        }
       update leads;
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Se han actualizado todos los registros de clientes potenciales.');
    }

}