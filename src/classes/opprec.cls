public class opprec {
    public String seyears { get; set; }
        public String months1 { get; set; }
public String months { get; set; }
public opportunity opp{get;set;}
public list<opportunity> opp1{get;set;}
public opprec()
{
opp1= new list<opportunity>();
opp= new opportunity();
}
 public List<SelectOption> getItems() 
 {
 List<SelectOption> options = new List<SelectOption>();
 options.add(new SelectOption('--','None'));
 options.add(new SelectOption('1','January'));
 options.add(new SelectOption('2','February'));
 options.add(new SelectOption('3','March'));
 options.add(new SelectOption('4','April'));
 options.add(new SelectOption('5','May'));
 options.add(new SelectOption('6','May'));
 options.add(new SelectOption('7','July'));
 options.add(new SelectOption('8','August'));
 options.add(new SelectOption('9','September'));
 options.add(new SelectOption('10','October'));
 options.add(new SelectOption('11','November'));
options.add(new SelectOption('12','December'));
        return options;
 }
 public List<SelectOption> getyears(){
 integer y=0;
 List<SelectOption> options = new List<SelectOption>();
  options.add(new SelectOption('--','None'));
   options.add(new SelectOption('2012','2012'));
    options.add(new SelectOption('2013','2013'));
     options.add(new SelectOption('2014','2014'));
      options.add(new SelectOption('2015','2015'));
      options.add(new SelectOption('2016','2016'));
 return options;
 }
 public void get() {
   string startdate='01';
   string hour='01';
   string min='00';
   string sec='00';
   string stringDate = string.valueof(seyears ) + '-' + String.valueOf(Months) + '-' + startdate + ' ' + hour + ':' + min +  ':' + sec;          
   system.debug( '666666666666666666666666666666'+stringDate);
   datetime sd=datetime.valueof(stringDate);
   string enddate='31';
   string hour1   ='00';
   string min1='00';
   string sec1='00';
   string stringDate1 = string.valueof(seyears ) + '-' + String.valueOf(Months1) + '-' + enddate + ' ' + hour1 + ':' + min1 +  ':' + sec1; 
   datetime ed=datetime.valueof(stringDate1);
   opp1=[select id, name, amount ,StageName from opportunity where createddate >= :sd And createddate <= :ed ];
   //OpList=[Select id from Opportunity where createddate >=:myDate1 And createddate <=:myDate2 And Createdbyid=:SelectedUser  order by createddate];              
  }
}