@isTest
public class LeadProcessorTest {

    @isTest
    static void testLeadProcessorBatch() {
        // Paso 1: Insertar 200 registros de clientes potenciales de prueba
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(FirstName = 'Test', LastName = 'Lead' + i, Company = 'Test Company'));
        }
        insert leads;

        // Paso 2: Ejecutar la clase Batch LeadProcessor
        Test.startTest();
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch, 200);  // Llamar al método para ejecutar el batch
        Test.stopTest();

        // Paso 3: Verificar que todos los registros se actualizaron correctamente
        // Recuperar los registros insertados y asegurarse de que todos tienen 'Dreamforce' como LeadSource
        List<Lead> updatedLeads = [SELECT LeadSource FROM Lead WHERE Id IN :leads];
        
        // Asegurarse de que todos los registros insertados hayan sido actualizados
        System.assertEquals(200, updatedLeads.size(), 'El número de registros actualizados no es el esperado.');

        // Asegurarse de que todos los registros tengan 'Dreamforce' como LeadSource
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource, 'El campo LeadSource no está correctamente actualizado.');
        }
    }
}