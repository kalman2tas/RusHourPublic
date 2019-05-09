trigger PeTrigger on Pet__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        TH_PeTriggerHandler.beforeInsert(Trigger.new);
    }
}