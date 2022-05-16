public  class AddPrimaryContact implements Queueable  {
    private Contact cont;
    private String strState;
    
    //Constructor
    public AddPrimaryContact (Contact c, String strState){
        this.cont = c;
        this.strState = strState;
    }
    
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :strState LIMIT 200];
        List<Contact> arrContNew = New List<Contact>() ;
        
        for (Account account : accounts) {
          Contact contNew = cont.clone(false, true);
          contNew.AccountId = account.Id;
          arrContNew.add(contNew);
        }
		if ( arrContNew.size() > 0 ){ insert arrContNew; }
    }
}
