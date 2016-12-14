trigger accdecsmap on Opportunity (before insert,before update) {
set<id> accids = new set<id>();
map<id,string> m = new map<id,string>();

for(opportunity opp: trigger.new)
{
 accids.add(opp.accountid);

}

list<schema.account> acclist = new list<schema.account>();
acclist=[select id,description from account where id IN :accids];

for(schema.account acc : acclist)
{
m.put(acc.id,acc.description );

}
for(opportunity opp1 : trigger.new)
{
if(m.containskey(opp1.accountid))
{
opp1.description = m.get(opp1.accountid);
}
}
}