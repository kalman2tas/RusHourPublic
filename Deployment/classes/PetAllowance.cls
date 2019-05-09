public with sharing class PetAllowance {

    public static void allowPet(List<Pet__c> pets) {
        Set<Id> ownerIds = new Set<Id>();
        for(Pet__c pet : pets){
            ownerIds.add(pet.Owner__c);
        }
        List<Person__c> owners = [SELECT Id, Name, (SELECT Id, Type__c FROM Pets__r) FROM Person__c WHERE Id IN: ownerIds];
        for(Pet__c pet : pets){
            for(Person__c owner : owners){
                if(owner.Id.equals(pet.Owner__c)){
                    for(Pet__c existingPet : owner.Pets__r){
                        if(existingPet.Type__c == pet.Type__c){
                            pet.addError('Mother said, you have already a ' + pet.Type__c);
                        }
                    }
                }
            }
        }
    }
}