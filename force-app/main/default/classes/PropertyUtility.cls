public class PropertyUtility {
    public static void newListedProperties() {
        
        List<Property__c> newPropList = [
            // Consulta de propiedades listadas en los últimos 30 días
            SELECT Name, Broker__r.Email__c, Days_On_Market__c
            FROM Property__c
            WHERE Days_On_Market__c <= 30
            ];
        
        // Iteración sobre la lista de propiedades obtenidas
        for (Property__c property : newPropList) {
            // Concatenación del nombre de la propiedad y el email del broker
            String propEmail = 'Property Name: ' + property.Name + ', Broker Email: ' + property.Broker__r.Email__c;
            System.debug(propEmail);
        }
    }
}