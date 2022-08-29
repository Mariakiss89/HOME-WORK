public with sharing class EmailNewOffers {
   
    public static void sendMail(List<Showroom_Vehicle__c> newOffersIds) {

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[]toAddresses= new String[]{'mariakislukhina89@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('New Offer was created');
        mail.setHtmlBody(createEmailBody(newOffersIds));

        Messaging.SendEmailResult[] results = Messaging.sendEmail(
        new Messaging.SingleEmailMessage[] { mail });
    }

    private static String createEmailBody(List<Showroom_Vehicle__c> newOffersIds){
        List<Showroom_Vehicle__c> showrVehicList=
        [SELECT Name,Showroom_Vehicle__c.Vehicle__c,Showroom_Vehicle__c.Showroom__c
        FROM Showroom_Vehicle__c
        WHERE ID IN :newOffersIds];

        String body='Hi,Maria! Check a new offer. Name:  ';

        for(Showroom_Vehicle__c offer:showrVehicList){
          body+=offer.Name
        +', Vehicle Name: '+ offer.Vehicle__c 
        +', Showroom Name: '+ offer.Showroom__c 
        +'<br/>';
           
        }  
       return body;

    }       
}