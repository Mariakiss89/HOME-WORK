public with sharing class TelemetryDataCleaningBatch  implements Database.Batchable<SObject>{

    public Database.Querylocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([
            SELECT Id
            FROM Telemetry__c
            WHERE CreatedDate != LAST_N_DAYS:90]);       
    }
    
    public void execute (Database.BatchableContext bc, List <Telemetry__c> telemetriesList){
        
        delete telemetriesList;       
    }

    public void finish (Database.BatchableContext bc){}
}
