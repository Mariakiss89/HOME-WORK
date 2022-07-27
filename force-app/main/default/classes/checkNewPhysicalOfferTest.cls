@isTest
public with sharing class checkNewPhysicalOfferTest {
    @isTest  public static void OfferTest1() {

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

        one=[SELECT Vehicle__c, Showroom__c, Status__c FROM Showroom_Vehicle__c WHERE id=: one.Id];
         Test.stopTest();  
         System.assertEquals(one.Status__c, 'physical');   

        }

        @isTest public static void OfferTest2(){

            Test.startTest();

            Vehicle__c vehicle2 = new Vehicle__c();
            vehicle2.Name='Test2 vehicle';
            insert vehicle2;

            Account account2 = new Account();
            account2.Name='Test2 account';
            insert account2;
    
            Showroom__c showroom2 = new Showroom__c();
            showroom2.Name='Test1 showroom';
            showroom2.Account__c=account2.Id;
            insert showroom2;            
   
            Showroom_Vehicle__c  one2 = new Showroom_Vehicle__c();
            one2.Vehicle__c=vehicle2.id;
            one2.Showroom__c=showroom2.id;
            one2.Status__c='virtual';
            insert one2;
    
            one2=[SELECT Vehicle__c, Showroom__c, Status__c FROM Showroom_Vehicle__c WHERE id=: one2.Id];
             Test.stopTest();  
             System.assertEquals(one2.Status__c, 'virtual');

            }

            @isTest public static void OfferTest3(){
                Test.startTest();

                Vehicle__c vehicle3 = new Vehicle__c();
                vehicle3.Name='Test3 vehicle';
                insert vehicle3;

                Account account3 = new Account();
                account3.Name='Test3 account';
                insert account3;
        
        
                Showroom__c showroom3 = new Showroom__c();
                showroom3.Name='Test3 showroom';
                showroom3.Account__c=account3.Id;
                insert showroom3;
        
                Showroom_Vehicle__c  one3 = new Showroom_Vehicle__c();
                one3.Vehicle__c=vehicle3.id;
                one3.Showroom__c=showroom3.id;
                one3.Status__c='physical';
                insert one3;
        
                one3=[SELECT Vehicle__c, Showroom__c, Status__c FROM Showroom_Vehicle__c WHERE id=: one3.Id];
                 
                Vehicle__c vehicle4 = new Vehicle__c();
                vehicle4.Name='Test4 vehicle';
                insert vehicle4;

                
                Account account4 = new Account();
                account4.Name='Test4 account';
                insert account4;
        
        
                Showroom__c showroom4 = new Showroom__c();
                showroom4.Name='Test5 showroom';
                showroom4.Account__c=account4.Id;
                insert showroom4;
        
                Showroom_Vehicle__c  one4 = new Showroom_Vehicle__c();
                one4.Vehicle__c=vehicle3.id;
                one4.Showroom__c=showroom4.id;
                one4.Status__c='physical';
                insert one4;
                
                one4=[SELECT Vehicle__c, Showroom__c, Status__c FROM Showroom_Vehicle__c WHERE id=: one4.Id];
                 
                Test.stopTest();  
                 System.assertEquals(one3.Status__c, 'physical');
                 System.assertEquals(one4.Status__c, 'physical');
    
                }
}