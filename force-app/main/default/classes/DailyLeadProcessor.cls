public  class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
       List<Lead> listLeadupdate = new List<Lead>();
       List<Lead> leads = [SELECT id FROM Lead WHERE LeadSource = NULL LIMIT 200 ];
      
       for (Lead l : leads) {
           l.LeadSource = 'DreamForce';
           listLeadupdate.add(l);
       }
       update listLeadupdate;
    }
}
