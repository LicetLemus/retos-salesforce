Account testAccount = new Account(
            Name = 'Test Account',
            BillingPostalCode = '12345',
            ShippingPostalCode = '00000',
            Match_Billing_Address__c = true
        );

insert testAccount;