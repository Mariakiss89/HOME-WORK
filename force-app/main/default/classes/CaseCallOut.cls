public with sharing class CaseCallOut implements Queueable,Database.AllowsCallouts {
///HELLO
    private List <Case> cases;

    public void setCases(List<Case> cases) {
        this.cases = cases;
    }
    public void execute(QueueableContext context){
        if(this.cases != null){
            Http server = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
            req.setMethod('POST');
            req.setBody(JSON.serialize(cases));
            HttpResponse resp = server.send(req);
            if(resp.getStatusCode() == 201){
                for( Case caseObj:cases){
                    caseObj.Status='Close';
                }   
            }             
                else {
                System.debug(LoggingLevel.ERROR, 'Connection error.');
                for( Case caseObj:cases){
                    caseObj.Status='Failed';
                }
            }
            update cases;
        }

    }

    
}