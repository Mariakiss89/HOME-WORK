public with sharing class CreateCaseQueueable implements Queueable {
    private List<Showroom__c> showrooms;

    public void setShowrooms(List<Showroom__c> showrooms){
        this.showrooms = showrooms;
    }

    public void execute(QueueableContext context){
        if(this.showrooms != null){
            List<Case> cases = new List<Case>();
            for(Showroom__c showroom : showrooms){
                Case caseObj = new Case(subject='Renovation Case'+showroom.Name,status = 'new',
                priority = 'Medium',Showroom__c=showroom.id);
                cases.add(caseObj);
            }
            
            insert cases;

            ID jobID = System.enqueueJob(cases);
        }
    }
}
