@istest
public class DailyLeadProcessorTest {

  
    static testmethod void testSchedulableJob(){
     String CRON_EXP = '0 0 1 * * ?';
     List<Lead> leads = new List<Lead>();
    
     for (Integer i = 0; i < 200; i++) { 
         Lead l = new Lead(
             FirstName = 'Pablo ' + i,
             LastName = 'LastName',
             Company = 'Monsters Inc.'
         ); 
         leads.add(l);
         
     } 
      insert leads;

      Test.startTest();

      String jobId = System.schedule('DailyLeadProcessor',CRON_EXP, new DailyLeadProcessor()); 

      Test.stopTest();

      List<Lead> checkleads = new List<Lead>();

      checkleads  = [Select Id From Lead WHERE LeadSource = 'DreamForce' AND Company = 'Monsters Inc.'];
      System.assertEquals(200, checkleads.size(), 'Leands were not created');

    }
}
