@isTest
private class TestVerifyDate {

	@isTest static void testCheckDates1() {
		Date one = VerifyDate.CheckDates(date.parse('01/01/2022'),date.parse('10/01/2022'));
        System.assertEquals(date.parse('10/01/2022'),one);
    }
        
    @isTest static void testCheckDates2() {
		Date two = VerifyDate.CheckDates(date.parse('01/01/2022'),date.parse('10/10/2022'));
        System.assertEquals(date.parse('31/01/2022'),two);
	}
	
	@isTest static void testDateWithin30Days1() {        
        Boolean tree=VerifyDate.DateWithin30Days(date.parse('01/10/2022'),date.parse('30/09/2022'));
        System.assertEquals(false, tree);
     }
    
     @isTest static void testDateWithin30Days2() {        
        Boolean four=VerifyDate.DateWithin30Days(date.parse('10/01/2022'),date.parse('12/01/2021'));
        System.assertEquals(false, four);
     }
    
     @isTest static void testDateWithin30Days3() {        
        Boolean five=VerifyDate.DateWithin30Days(date.parse('01/10/2022'),date.parse('10/11/2021'));
        System.assertEquals(false, five);
     }
    @isTest static void testSetEndOfMonthDate(){
        Date six= VerifyDate.SetEndOfMonthDate(date.parse('01/01/2022'));
    }
}