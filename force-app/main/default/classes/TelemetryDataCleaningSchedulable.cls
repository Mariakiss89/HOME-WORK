public with sharing class TelemetryDataCleaningSchedulable implements Schedulable {
                  
    public static String  CRON_EXP = '0  5 * * * ?';

    public static String scheduleTel(){
        TelemetryDataCleaningSchedulable schedule  = new TelemetryDataCleaningSchedulable();
        return System.Schedule('Telemetry to delete', CRON_EXP, schedule );
    }

    public void execute (SchedulableContext sc){
        TelemetryDataCleaningBatch batch = new TelemetryDataCleaningBatch();
        ID batchprocessid = Database.executeBatch(batch);
    }



    
}
