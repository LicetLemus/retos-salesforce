@isTest
public class DailyLeadProcessorTest {

    // Cron Expression: 0 seconds, 0 minutes, 12 PM (noon) on November 19, 2024
    public static String CRON_EXP = '0 0 12 19 11 ? 2024'; // This is the cron for November 19, 2024, at 12:00 PM

    @isTest
    public static void testInsertAndLeadProcessor() {

         // Create a list of 200 leads for the test
        List<Lead> newLeads = new List<Lead>();

        // Insert leads to record in the test
        for(Integer i = 0; i < 200; i++) {
            newLeads.add(
                new Lead(
                    FirstName = 'Test' + i,
                    LastName = 'User' + i,
                    Email = 'test' + i + '@example.com',
                    Phone = '1234567890',
                    Company = 'TestCompany ' + i,
                    Status = 'Working - Contacted'
                )
            );
        }

        // Insert the lead records into the database
        insert newLeads;

        // Create an instance of the DailyLeadProcessor (the job to be scheduled)
        DailyLeadProcessor leadProcessor = new DailyLeadProcessor();

        // Test context
        Test.startTest();
         // Schedule the DailyLeadProcessor class to run at the specified cron time
        System.schedule('ScheduledApexTest', CRON_EXP, leadProcessor);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];

        System.assertEquals(200, updatedLeads.size(), 'Todos los leads deben haber sido actualizados con LeadSource "Dreamforce"');
    }
}
