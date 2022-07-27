@isTest
public with sharing class vehicleIsRemovedTest {
    @isTest public static void OfferTest1() {
        Test.startTest();

        Vehicle__c vehicle = new Vehicle__c();
        vehicle.Name='Test1 vehicle';
        insert vehicle;
        
        Telemetry__c telemetry = new Telemetry__c();
        telemetry.Name='Test1 telemetry';
        telemetry.Vehicle__c =vehicle.id;
        insert telemetry;

        delete vehicle;

        Test.stopTest();  
        System.assertEquals(vehicle.Name,'Test1 vehicle');
        System.assertEquals( telemetry.Name,'Test1 telemetry');    
    }
}


