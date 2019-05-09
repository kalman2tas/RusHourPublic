public with sharing class TH_PersonTriggerHandler {
    
    public static void afterUpdate(List<Person__c> people, Map<Id,Person__c> oldPMap) {
        if(ByPassConfig.canTrigger(ByPassConfig.Person_Marriage_Change)){
            PeopleManagement.marriageChange(people,oldPMap);
        }
    }
}
