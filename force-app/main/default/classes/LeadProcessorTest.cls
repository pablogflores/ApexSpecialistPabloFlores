@istest
public  class LeadProcessorTest {
    @istest
    public static void testit(){
        List<Lead> listlead = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.LastName = 'name'+ i;
            lead.Company = 'CompanyPablo';
            lead.Status = 'Random Status';
            listlead.add(lead);
        }
        insert listlead;

       Test.startTest();
       LeadProcessor lp = new LeadProcessor();
       Id batchId = Database.executeBatch(lp);

       Test.stopTest();

    }
    

  
}
