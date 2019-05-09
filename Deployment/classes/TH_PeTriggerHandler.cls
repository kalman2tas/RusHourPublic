public with sharing class TH_PeTriggerHandler {
    public static void beforeInsert(List<Pet__c> pets) {
        if(ByPassConfig.canTrigger(ByPassConfig.Pet_Allow)){
            PetAllowance.allowPet(pets);
        }
    }
}