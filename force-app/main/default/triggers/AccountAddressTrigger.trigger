trigger AccountAddressTrigger on Account (before insert,before update) {
    
   for( Account ac:Trigger.New){
        if(ac.Match_Billing_Address__c == True){
            ac.ShippingPostalCode=ac.BillingPostalCode;
       }
   }

}