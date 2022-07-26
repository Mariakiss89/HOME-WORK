trigger vehicleIsRemoved on Vehicle__c (before delete,after delete) {
 
     if(Trigger.isBefore&& Trigger.isDelete){
      List<Telemetry__c> childList = new List<Telemetry__c>();
       For(Telemetry__c c: [select Id,Vehicle__c from Telemetry__c 
                    where Vehicle__c IN: trigger.oldMap.KeySet()])
        {
               childList.add(c);
      } 
   Delete childList;   
    
    }
    if(Trigger.isAfter && Trigger.isDelete){
     List <Case> cases = new List<Case>();
   for(Vehicle__c record:  trigger.old){
        
       cases.add(new Case(Status='Delete',Subject='Check impact '+record.Name));
             
           }
  insert cases;
          }
   }
   