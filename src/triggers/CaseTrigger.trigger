trigger CaseTrigger on Case (after insert, after update,after delete) 
{
    List<Case> lstCase = [select id, AccountId from Case where id in: trigger.newmap.keyset()];
    set<Id> sAccId = new set<Id>();
    for(Case cs: lstCase)
    {
        if(cs.AccountId != null)
        {
            sAccId.add(cs.AccountId);
        }
    }
    if(sAccId != null && sAccId.size() > 0)
    {
        List<Account> lstAccount = [select id, open_cases__c,close_cases__c , (select id from Cases where status='New') from Account where id in: sAccId];
        if(lstAccount.size() > 0){
            for(Account acc: lstAccount){
                acc.open_cases__c= acc.Cases.size();
            }
            
            update lstAccount;
        }
        
        List<Account> lstAccount2 = [select id, open_cases__c,close_cases__c    , (select id from Cases where status='Closed') from Account where id in: sAccId];
        if(lstAccount.size() > 0){
            for(Account acc: lstAccount2){
                acc.close_cases__c  = acc.Cases.size();
            }
            
            update lstAccount2;
        }

    }
}