trigger ShowroomVehicleTrigger on Showroom_Vehicle__c (before insert,before update,after insert) {

  if ( Trigger.isAfter && Trigger.isInsert){
    EmailNewOffers offemail = new EmailNewOffers();
    offemail.sendMail(Trigger.new);
  }

  if(Trigger.isBefore && Trigger.isInsert || Trigger.isBefore && Trigger.isUpdate){
    Set<String> physicalOffer = new Set <String>();
    for (Showroom_Vehicle__c c : Trigger.New){
      if(c.Status__c == 'physical'){
        physicalOffer.add(c.Vehicle__c);
      }

    }
    List <Showroom_Vehicle__c> listOffer = [Select id , Vehicle__c FROM Showroom_Vehicle__c 
    WHERE Vehicle__c in:physicalOffer ];
    Map<Id,Showroom_Vehicle__c> physicalOfferMap = new Map<Id,Showroom_Vehicle__c>();
    for (Showroom_Vehicle__c a : listOffer){
      physicalOfferMap.put(a.Vehicle__c, a);      
    }
    for (Showroom_Vehicle__c c : Trigger.new){
      if(physicalOfferMap.get(c.Vehicle__c)!=null){
        c.addError('The vehicle is already available in this the showroom.');        
      }      
    }

  }
 
}