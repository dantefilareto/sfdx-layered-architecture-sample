@isTest
public class PricingsTest {
    @TestSetup
    static void makeData(){
        Pricing__c myPricing = new Pricing__c(
            Advance_Amount__c = 1,
            Purchased_Amount__c = 1,
            CurrencyIsoCode = CurrencyIsoCode.GBP
        );
        insert myPricing;
    }
    @isTest
    static void setinitialDisbursedPriceTest(){
        Pricings domainClass = new Pricings();
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        domainClass.setinitialDisbursedPrice(new List<Pricing__c> {testPricing});
        Test.stopTest();

        testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];

        System.assertEquals(testPricing.Disbursed_Advance_Amount__c, testPricing.Advance_Amount__c, 'Disbursed advance amount different than advance amount');
        System.assertEquals(testPricing.Disbursed_Purchased_Amount__c, testPricing.Purchased_Amount__c, 'Disbursed purchased amount different than purchased amount');
    }
    @isTest
    static void setinitialDisbursedPriceTest2(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        testPricing.Disbursed_Advance_Amount__c = 10;
        testPricing.Disbursed_Purchased_Amount__c = 10;
        testPricing.CurrencyIsoCode = CurrencyIsoCode.EUR;
        Test.startTest();
        try{
            domainClass.setinitialDisbursedPrice(new List<Pricing__c> {testPricing});
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'setinitialDisbursedPrice failed');
    }
    @isTest
    static void isEu2Test(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.isEu2(testPricing);
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'isEu2 failed');
    }
    @isTest
    static void onBeforeInsertTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onBeforeInsert(new List<Pricing__c> {testPricing});
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onBeforeInsert failed');
    }
    @isTest
    static void onBeforeUpdateTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onBeforeUpdate(new List<Object> {testPricing}, new Map<Id, Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onBeforeUpdate failed');
    }
    @isTest
    static void onBeforeDeleteTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onBeforeDelete(new Map<Id, Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onBeforeDelete failed');
    }
    @isTest
    static void onAfterInsertTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onAfterInsert(new List<Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onAfterInsert failed');
    }
    @isTest
    static void onAfterUpdateTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onAfterUpdate(new List<Object>(), new Map<Id, Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onAfterUpdate failed');
    }
    @isTest
    static void onAfterDeleteTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onAfterDelete(new Map<Id, Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onAfterDelete failed');
    }
    @isTest
    static void onAfterUndeleteTest(){
        Pricings domainClass = new Pricings();
        Boolean error = false;
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Test.startTest();
        try{
            domainClass.onAfterUndelete(new List<Object>());
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'onAfterUndelete failed');
    }
}