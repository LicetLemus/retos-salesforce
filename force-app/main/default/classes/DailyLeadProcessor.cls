public class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [
            SELECT Id, Name, Email, LeadSource
            FROM Lead
            WHERE LeadSource = ''
            LIMIT 200
        ];

        for (Lead lead : leads) {
            System.debug('Processing lead: %s');
            lead.LeadSource = 'Dreamforce';
        }

        update leads;
    }
}