public with sharing class TH_ToyTrigger {

    public static void beforeInsert(List<Toy__c> toys) {
        if(ByPassConfig.canTrigger(ByPassConfig.Toy_Purchase)){
            ToyPurchase.buyToy(toys);
        }
    }
}