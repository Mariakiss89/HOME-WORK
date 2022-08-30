@isTest
private  class TelemetryDataCleaningSchedulableTest {

   public static String  CRON_EXP = '0 0 2 1 * ? *';
   static testmethod void SchedulableTest() {
    
        Telemetry__c telemetry = new Telemetry__c();
        telemetry.name='test';
        insert telemetry;

        String  CRON_EXP = '0 0 2 1 * ? *';
        TelemetryDataCleaningSchedulable schedule  = new TelemetryDataCleaningSchedulable();
      
        test.startTest();
        System.Schedule('Telemetry to delete', CRON_EXP, schedule );
        
        
       
         test.stopTest();

    }
}
