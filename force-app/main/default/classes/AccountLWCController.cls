public class AccountLWCController {
    @AuraEnabled(cacheable=true scope='global')
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account];
    }

    @AuraEnabled(cacheable=true scope='global')
    public static List<Showroom__c> getShowroom(String accountId) {
        return [
            SELECT Id,Name FROM Showroom__c
            WHERE Account__c =: accountId];
    }

    @AuraEnabled(cacheable=true scope='global')
    public static List<Vehicle__c> getVehicle(String showroomId) {
        
       return [SELECT Id,Name,photos__c,price__c,brand__c FROM Vehicle__c 
       WHERE  Showroom__c = :showroomId];      
    } 

    @AuraEnabled(cacheable=true scope='global')
    public static List<Vehicle__c> getVehicleData(String vehicleId) {       
       return [SELECT Id,Name,photos__c,price__c,brand__c, I_Like_It__c FROM Vehicle__c 
       ];      
    }

}