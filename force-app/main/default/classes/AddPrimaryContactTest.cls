@istest
public class AddPrimaryContactTest {
    @istest static void Testcontact(){
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++){accounts.add(new Account(name = 'acc' + i, BillingState = 'NY')); }
        for (Integer i = 50; i < 100; i++){accounts.add(new Account(name = 'acc' + i, BillingState = 'CA')); }
        insert accounts;

       
       String strState = 'CA';
        Contact cont = new Contact(LastName = 'TstsName');

        AddPrimaryContact updater = new AddPrimaryContact(cont, strState);
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
          System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :strState)]); 

    }
  
}
