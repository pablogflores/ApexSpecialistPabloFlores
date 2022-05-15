@isTest
public  class TestRestrictContactByName {
    @isTest static void CreatBadContact(){

        Contact c = new Contact (FirstName = 'Pablo', LastName='INVALIDNAME');

        Test.startTest();
        Database.SaveResult resultado = Database.insert(c, false);
        Test.stopTest();
        
        System.assert(!resultado.isSuccess());
    }
  
}
