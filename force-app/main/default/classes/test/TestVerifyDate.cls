@isTest
private class TestVerifyDate {

    @isTest static void testCheckDatesOutside30Days(){
        Date date1 = Date.newInstance(2023, 11, 7);
        Date date2 = Date.newInstance(2024, 11, 14);
        Date expectedEndOfMonth = Date.newInstance(2023, 11, 30);
        
        Date result = VerifyDate.CheckDates(date1, date2);
        
        System.assertEquals(expectedEndOfMonth, result);
    }

    @isTest static void testCheckDatesWithin30Days() {
        Date date1 = Date.newInstance(2023, 11, 7);
        Date date2 = Date.newInstance(2023, 11, 20);
        
        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(date2, result);
    }


}