@isTest
public with sharing class TelemetryDataCleaningBatchTest {
    @isTest
      static void TelemetryDataCleaningBatchTest() {
        Telemetry__c telemetries = new Telemetry__c(name = 'Test');
        insert telemetries;

        Test.startTest();
        TelemetryDataCleaningBatch bc = new TelemetryDataCleaningBatch();
        Database.executeBatch(bc);
        Test.stopTest();

        List<Telemetry__c> deletedList = [SELECT Id FROM  Telemetry__c 
        WHERE CreatedDate != LAST_N_DAYS:1];
        System.assertEquals(0, deletedList.size(), 'All records were deleted');


    }
}
