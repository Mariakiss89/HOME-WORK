@isTest
public with sharing class checkNewPhysicalOfferTest {
    @isTest  public static void checkNewPhysicalOfferTest() {

   

    
      Test.startTest();
      Vehicle__c vehicle = new Vehicle__c();
    insert vehicle;
       Showroom__c showroom = new Showroom__c();
           insert showroom;
       Offer__c offer = new Offer__c();
        offer.MD_to_Vehicle__c = vehicle.id;
        offer.MD_to_Showroom__c = showroom.id;
        offer.Type__c = 'Physical';
        insert offer;
         offer=[SELECT MD_to_Vehicle__c, MD_to_Showroom__c, Type__c FROM Offer__c WHERE id=: offer.Id];
         Test.stopTest();   
         System.assertEquals(offer.Type__c, 'Physical'); 
}   @isTest public static void testOffer1(){
      Test.startTest();
      Vehicle__c vehicle = new Vehicle__c();
   insert vehicle;
       Showroom__c showroom = new Showroom__c();
      insert showroom;
       Offer__c offer = new Offer__c();
        offer.MD_to_Vehicle__c = vehicle.Id;
        offer.MD_to_Showroom__c = showroom.Id;
        offer.Type__c = 'Virtual';
        insert offer;
         offer=[SELECT MD_to_Vehicle__c, MD_to_Showroom__c, Type__c FROM Offer__c WHERE Id=: offer.Id];
         System.assertEquals(offer.Type__c, 'Virtual');
}
}
