
// before of reto, I create a new fild in the object Account, checkbox with name label Match_Billing_Address

trigger AccountAddressTrigger on Account (before insert, before update) {

    // Iteration over the new account or update account
    for (Account acco : Trigger.new) {

        // if Match_Billiing_Address is true, if it is marked
        if (acco.Match_Billing_Address__c) {

            // if Match_Billiing_Address, setting Postal code = BilliingPostalcode facturación
            // ShippingPostalCode and BillingPostalCode are standard filds of sobject account
            acco.ShippingPostalCode = acco.BillingPostalCode;
        }
    }


}