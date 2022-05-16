@istest
public class AccountProcessorTest {

    @istest
    private static void TestConuntContactos(){
        Account newAccount = new Account(Name = 'Test Account'); //Creo cuenta
        insert newAccount;

        Contact newContact = new Contact(FirstName='Pablo', LastName='Flores', AccountId = newAccount.Id);
        insert newContact;
        Contact newContact1 = new Contact(FirstName='Pablo', LastName='Flores', AccountId = newAccount.Id);
        insert newContact1;

        List<Id>AccountId = new List<Id>();
        AccountId.add(newAccount.Id);

        Test.startTest();

        AccountProcessor.countContacts(AccountId);

        Test.stopTest();

    }
}
