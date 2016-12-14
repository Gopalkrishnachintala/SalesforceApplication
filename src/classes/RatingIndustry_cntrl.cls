public with sharing class RatingIndustry_cntrl {
public List<Account> AccList{set;get;}
public List<Account> AccList1{set;get;}
public List<Account> AccList2{set;get;}
public Account Acc{set;get;}
public RatingIndustry_cntrl(Apexpages.standardController controller){
AccList = new List<Account>();
AccList1 = new List<Account>();
AccLIst2 = new List<Account>();
}
public void change(){
Acc.clear();
AccList1.clear();
AccList2.clear();
system.debug('-----Test1-----');
system.debug('-----Test2-----;'+acc.rating);
system.debug('-----test3-----:'+Acc.industry);
if(Acc.rating <> null && Acc.industry == null){
system.debug('-----test4-----:'+Acc.rating);
AccList=[select id,rating from Account where rating !=null];
system.debug('----Test5----:'+AccList);
}
if(Acc.rating == null && Acc.industry !=null)
{
system.debug('----Test6----:'+Acc.rating);
system.debug('----Test7----:'+Acc.industry);
AccList1=[select id,rating,industry from Account where industry !=null];
system.debug('----Tets8----:'+AccList1);
}
if(Acc.rating <> null && Acc.industry <> null)
{
AccLIst2=[select id,rating,industry from Account where industry != null AND rating !=null];
}
}
}