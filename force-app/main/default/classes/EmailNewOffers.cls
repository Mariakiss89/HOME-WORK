public with sharing class EmailNewOffers {
    public void sendMail(List<Showroom_Vehicle__c> triggerNewList) {
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
        List<String> sendTo = new List<String>();

        List<Showroom_Vehicle__c> showrVehicList = [SELECT Name, Showroom_Vehicle__c.Vehicle__c, Showroom_Vehicle__c.Showroom__c
        FROM Showroom_Vehicle__c];
        sendTo.add('mariakislukhina89@gmail.com');

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(sendTo);
        mail.setSubject('New Offer was created');
        for(Showroom_Vehicle__c svOffer : triggerNewList){
            String body = 'Hi,Maria! Check a new offer. Name:  '+ svOffer.Name +', Vehicle Name: '
            + svOffer.Vehicle__c + ', Showroom Name: ' + svOffer.Showroom__c ;
            mail.setHtmlBody(body);
            mails.add(mail);
            Messaging.sendEmail(mails);
    }
}
}