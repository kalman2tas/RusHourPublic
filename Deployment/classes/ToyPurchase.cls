public with sharing class ToyPurchase {

    public static void buyToy(List<Toy__c> toys) {
        Set<Id> ownerIds = new Set<Id>();
        for(Toy__c toy : toys){
            ownerIds.add(toy.Owner__c);
        }
        List<Person__c> owners = [SELECT Id, Name, (SELECT Id, Type__c FROM Toys__r) FROM Person__c WHERE Id IN: ownerIds];
        for(Toy__c toy : toys){
            for(Person__c owner : owners){
                if(owner.Id.equals(toy.Owner__c)){
                    toy.Name = owner.Name+'_'+toy.Type__c;
                    for(Toy__c existingToy : owner.toys__r){
                        if(existingToy.Type__c == toy.Type__c){
                            toy.addError('Mother said, you have already a ' + toy.Type__c);
                        }
                    }
                }
            }
        }
    }
}
