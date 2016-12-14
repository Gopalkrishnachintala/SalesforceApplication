public class leadconvertController {
 
Lead lead;
Opportunity opty;
Id optt;
Account account;
Contact contact;

public Boolean isChecked { get; set; }

public String contactName{get;set;}

public String leadName{get;set;}
public String FirstName {get; set;}
public String LastName {get; set;}
public contact lwn {get; set;}
public String Description{get;set;}

public String leadSource{get;set;}
public String leadIndustryName{get;set;}
public String leadstatus{get;set;}
public string Mobile{get;set;}
public string Phone{get;set;}
public string email{get;set;}
public string Website{get;set;}
public string leadrating{get;set;}
public string Title{get;set;}
Public String Street{get;Set;}
Public String City{get;Set;}
Public String State{get;Set;}
Public String PostalCode{get;Set;}
Public String Country{get;Set;}

public List<SelectOption> getContactList() {
Contact[] Contacts = [SELECT Id,Firstname,Lastname,name,reportstoid FROM Contact];
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('- None Selected - ','- None Selected - '));
for (Contact acc : Contacts) {
options.add(new SelectOption(acc.Name,acc.Name));
}
return options;}
public Task getTask(){
Task tsk = new Task();
return tsk;
}

public List<SelectOption> getStatus()
{
List<SelectOption> options = new List<SelectOption>();

Schema.DescribeFieldResult fieldResult = Schema.sObjectType.Lead.fields.status;
//Lead.LeadSource.getDescribe();

List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

for( Schema.PicklistEntry f : ple)
{
options.add(new SelectOption(f.getLabel(), f.getValue()));
}
return options;
}

public List<SelectOption> getLeadIndustryNames()
{
List<SelectOption> options = new List<SelectOption>();

Schema.DescribeFieldResult fieldResult = Schema.sObjectType.Lead.fields.Industry;
//Lead.LeadSource.getDescribe();

List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

for( Schema.PicklistEntry f : ple)
{
options.add(new SelectOption(f.getLabel(), f.getValue()));
}
return options;
}

public List<SelectOption> getPriority()
{
List<SelectOption> options = new List<SelectOption>();

Schema.DescribeFieldResult fieldResult = Schema.sObjectType.Account.fields.CustomerPriority__c;
//Lead.LeadSource.getDescribe();

List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

for( Schema.PicklistEntry f : ple)
{
options.add(new SelectOption(f.getLabel(), f.getValue()));
}
return options;
}

public leadconvertController(ApexPages.StandardController controller) {
}

}