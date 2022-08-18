public with sharing class TelemetryDataCleaningSchedulable implements Schedulable {
                  
    public String  CRON_EXP = '0 0 2 1 * ? *'; // Every first day of the month at 2 am

    public String scheduleTel(){
        TelemetryDataCleaningSchedulable schedule  = new TelemetryDataCleaningSchedulable();
        return System.Schedule('Telemetry to delete', CRON_EXP, schedule );
    }

    public void execute (SchedulableContext schedule){
        TelemetryDataCleaningBatch bc = new TelemetryDataCleaningBatch();
        ID batchId = Database.executeBatch(bc);
    }



    
}
