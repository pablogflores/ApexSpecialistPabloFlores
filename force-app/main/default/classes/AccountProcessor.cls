public class AccountProcessor {
   
    @future
    public static void countContacts(List<Id> accountsIds){
        
        List<Account> listacuentaupdate = new List<Account>();

        List<Account> accounts  = [Select Id, Name, (SELECT Id  FROM Contacts) FROM Account WHERE Id in :accountsIds];

        for (Account acc : accounts) {
            List<Contact> contactolista = acc.Contacts;
            acc.Number_Of_Contacts__c = contactolista.size();
            listacuentaupdate.add(acc);
        }
        update listacuentaupdate;

    }
   
}
