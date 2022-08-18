trigger ShowroomCaseTrigger on Showroom__c (after update) {
    
    if(Trigger.isUpdate && Trigger.isAfter){

        List<Case> closedShowrooms = new List<Case>();

        for (Showroom__c showroom: Trigger.new){
            if (showroom.Showroom_status__c == 'Close'){
                closedShowrooms.add(new Case(subject='Renovation Case '+showroom.Name,status = 'new',
                priority = 'Medium',Showroom__c= showroom.Id));
            } 
            insert closedShowrooms;         
    }

   
    }
}