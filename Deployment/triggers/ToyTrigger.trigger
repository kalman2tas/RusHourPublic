trigger ToyTrigger on Toy__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        TH_ToyTrigger.beforeInsert(Trigger.new);
    }
}