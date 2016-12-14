trigger Accountopportunity on Account (after insert,after update) {
Set<Id> accountIds = new Set<Id>();
 for(Account a:trigger.new){
   if(a.Description != null){
    accountIds.add(a.id);
   }
    List<Opportunity> oppsToUpdate = new List<Opportunity>();

     for(Opportunity opp : [select id, Description from Opportunity where AccountId in: accountIds])
     {
          opp.Description=a.Description ;
         oppsToUpdate.add(opp);
     }

    update oppsToUpdate;
}
  }