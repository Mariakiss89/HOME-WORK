trigger checkNewPhysicalOffer on Showroom_Vehicle__c (before insert,before update) {
  
    SET<String> sv = new SET <String>();
    for (Showroom_Vehicle__c c : Trigger.New) {
         if(c.Status__c == 'physical'){
        sv.add(c.Vehicle__c);
    }
     }
    
   List <Showroom_Vehicle__c> acc = [Select id , Vehicle__c FROM Showroom_Vehicle__c
                                     WHERE Vehicle__c in:sv AND Status__c = 'physical'];
    
   Map<Id,Showroom_Vehicle__c> svMap = new Map<Id,Showroom_Vehicle__c>() ;
    
   for (Showroom_Vehicle__c a : acc){
    svMap.put(a.Vehicle__c, a);
   }
    
 for (Showroom_Vehicle__c c : Trigger.new){
     
     
    if(svMap.get(c.Vehicle__c)!=null){
         
 c.addError('The vehicle is already available in this the showroom.');
        }
  
  //  }
   }
 }