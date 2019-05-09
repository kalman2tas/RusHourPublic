//SELECT Id, (SELECT Id,Name FROM People__r) FROM Marriage__c WHERE Id IN (SELECT Marriage__c FROM Person__c WHERE Name = 'Strong Woman')
public with sharing class PeopleManagement {

    private static final String FEMALE = 'Female';

    public static void marriageChange(List<Person__c> people, Map<Id,Person__c> oldPMap) {
        Set<Id> justMarried = new Set<Id>();
        Set<Id> divorce = new Set<Id>();
        for(Person__c person : people){
            if(oldPMap.get(person.Id).Marriage__c == null && person.Marriage__c != null){
                justMarried.add(person.Marriage__c);
            }
            else if(oldPMap.get(person.Id).Marriage__c != null && person.Marriage__c == null){
                divorce.add(person.Marriage__c);
            }
        }
        if(!justMarried.isEmpty()){
            createChild(justMarried);
        }
        if(!divorce.isEmpty()){
            divorceNow(divorce);
        }
    }

    private static void createChild(Set<Id> marriageIds){
        List<Marriage__c> marriages = [SELECT Id, (SELECT Id, Name, Sex__c FROM People__r) FROM Marriage__c WHERE Id =: marriageIds];
        List<Person__c> children = new List<Person__c>();
        //TODO: if there was already a child, none will born
        for(Marriage__c marr : marriages){
            if(marr.People__r.size() != 2){
                continue;
            }
            Person__c child = new Person__c();
            child.Name = 'FirstChild_';
            child.Age__c = 0;
            child.Sex__c = (Math.mod(System.currentTimeMillis(),2) == 0) ? 'Female' : 'Male';
            for(Person__c parent : marr.People__r){
                if(FEMALE.equals(parent.Sex__c)){
                    child.Mother__c = parent.Id;
                }
                else{
                    child.Father__c = parent.Id;
                    child.Name += parent.Name;
                }
            }
            children.add(child);
        }
        try{
            Database.insert(children);
        }
        catch(DmlException de){
            System.debug(de.getMessage()+de.getCause()+de.getStackTraceString());
        }
    }

    private static void divorceNow(Set<Id> marriageIds){
        //TODO: implement the divorce, if any of the couple deletes the relationship with the marriage, the other relationship will be deleted as well
    }

}