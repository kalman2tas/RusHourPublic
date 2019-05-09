trigger PersonTrigger on Person__c (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        TH_PersonTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
}