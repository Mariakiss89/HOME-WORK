@isTest
public class EmailNewOffersTest {
   
    @testSetup static void setup() {        
        List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<5;i++) {
            testAccts.add(new Account(Name = 'TestAcct'+i));
        }
        insert testAccts;   
        List<Vehicle__c> testVehicle =  new List<Vehicle__c>();
        for(Integer i=0;i<5;i++) {
            testVehicle.add(new Vehicle__c(Name='TestVehicle'+i));
        } 
        insert testVehicle;

        List<Showroom__c> testShowroom = new List<Showroom__c>();                  
        for(Integer i=0; i<5;i++) {
            testShowroom.add(new Showroom__c(Name='TestVehicle'+i,
           Account__c= testAccts[i].id));
        }
        insert testShowroom;

        List<Showroom_Vehicle__c> testShowVehicle = new  List<Showroom_Vehicle__c>();
             
        for(Integer i=0; i<5; i++) {
            testShowVehicle.add(new Showroom_Vehicle__c(Name='TestShowVehicle'+i,
            Vehicle__c=testVehicle[i].id,Showroom__c=testShowroom[i].id));
        }
        insert testShowVehicle;
    }
   

   // Hello

    @isTest
      static void testSendEmail() {
       Test.startTest();
        
        
        Vehicle__c vehicle = new Vehicle__c();
        vehicle.Name='Test1 vehicle';
        insert vehicle;

        Account account = new Account();
        account.Name='Test1 account';
        insert account;

        Showroom__c showroom = new Showroom__c();
        showroom.Name='Test1 showroom';
        showroom.Account__c=account.Id;
        insert showroom;

        Showroom_Vehicle__c  one = new Showroom_Vehicle__c();
        one.Vehicle__c=vehicle.id;
        one.Showroom__c=showroom.id;
        one.Status__c='physical';
        insert one;

        List<Showroom_Vehicle__c> testShowVehicle =new List<Showroom_Vehicle__c>();
        testShowVehicle.add(one);

        System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');

        EmailNewOffers.sendMail(testShowVehicle);

       System.assertEquals(2, Limits.getEmailInvocations(), 'Emails should be sent');
       Test.stopTest();
        
    }
}

