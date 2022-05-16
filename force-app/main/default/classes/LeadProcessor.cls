global class LeadProcessor implements Database.Batchable<sObject> {
     global Integer  count = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
   }
   global void execute(Database.BatchableContext bc, List<Lead> L_list){
        List<Lead> listLead = new List<Lead>();

        for (Lead lead : L_list) {
            lead.LeadSource = 'Dreamforce';
            listLead.add(lead);
            count++;
            
        }
        update listLead;
    }
    global void finish(Database.BatchableContext bc){
        System.debug(count + ' Shazam! registros procesados. ');
       
    }

}
