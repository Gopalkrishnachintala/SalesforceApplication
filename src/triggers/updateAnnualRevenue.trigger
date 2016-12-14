trigger updateAnnualRevenue on Opportunity (after insert, after update) {

    List<Id> toUpdate = new List<Id>();
    List <Account> toUpdateDML = new List<Account>();
    Map<Account,List<Opportunity>> accToOpp = new map <Account,List<Opportunity>>();
    public Decimal annualrevenue;

    for(Opportunity o : trigger.new) {
      
        toUpdate.add(o.AccountId);
       
    }
    for(Account a : [SELECT Id,AnnualRevenue,(SELECT ID,Amount,StageName FROM Opportunities) from Account WHERE Id IN : toUpdate]) {
        accToOpp.put (a, a.Opportunities);
        annualrevenue=0;
        for(Opportunity ooo : accToOpp.get(a)) {
          
            annualrevenue= annualrevenue + ooo.Amount;
            
        }
        a.AnnualRevenue = annualrevenue;
        toUpdateDML.add(a);
    }       
    update toUpdateDML; 
}