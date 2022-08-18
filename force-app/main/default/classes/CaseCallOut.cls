public with sharing class CaseCallOut implements Queueable {

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
                update cases;
            }
            else{
                System.debug(LoggingLevel.ERROR, 'Connection error.');
            }
    }

    
}
}