trigger ShowroomCaseTrigger on Showroom__c (after update) {

    if(Trigger.isUpdate && Trigger.isAfter){

    List<Showroom__c> closeShowroom = new List<Showroom__c>();
    for (Showroom__c showroom: Trigger.new){
        if (showroom.Showroom_status__c == 'Close'){
            closeShowroom.add(showroom);
        }        
    }

    CreateCaseQueueable casenew = new CreateCaseQueueable();
    casenew.setShowrooms(closeShowroom);
    ID jobID = System.enqueueJob(casenew);

    }
    
   
}