public with sharing class TelemetryDataCleaningBatch  implements Database.Batchable<sObject>{

    public Database.Querylocator start (Database.BatchableContext bc){
        String SOQL  = 'SELECT Id FROM Telemetry__c WHERE CreatedDate != LAST_N_DAYS:90';
        return Database.getQueryLocator(SOQL);
    
    }

    
    public void execute (Database.BatchableContext bc, List <Telemetry__c> telemetriesList){
        
        delete telemetriesList;
       
    }


    public void finish (Database.BatchableContext bc){}
}
