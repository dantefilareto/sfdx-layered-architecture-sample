@isTest
public class TriggerHandlerTest {
    @TestSetup
    static void makeData(){
        Pricing__c myPricing = new Pricing__c(
            Advance_Amount__c = 1,
            Purchased_Amount__c = 1
        );
        insert myPricing;
    }
    @isTest
    static void handleTriggerLogic(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        Boolean error = false;
        Test.startTest();
        try{
            testPricing.Purchased_Amount__c = 2;
            update testPricing;
            delete testPricing;
            undelete testPricing;
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleTriggerLogic');
    }
    @isTest
    static void handleBeforeInsertTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleBeforeInsert();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleBeforeInsertTest failed');
    }
    @isTest
    static void handleBeforeUpdateTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleBeforeUpdate();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleBeforeUpdateTest failed');
    }
    @isTest
    static void handleBeforeDeleteTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleBeforeDelete();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleBeforeDeleteTest failed');
    }
    @isTest
    static void handleAfterInsertTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleAfterInsert();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleAfterInsertTest failed');
    }
    @isTest
    static void handleAfterUpdateTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleAfterUpdate();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleAfterUpdateTest failed');
    }
    @isTest
    static void handleAfterDeleteTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleAfterDelete();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleAfterDeleteTest failed');
    }
    @isTest
    static void handleAfterUndeleteTest(){
        Pricing__c testPricing = [SELECT Id, Advance_Amount__c, Purchased_Amount__c, CurrencyIsoCode,
                                    Disbursed_Advance_Amount__c, Disbursed_Purchased_Amount__c
                                    FROM Pricing__c
                                    LIMIT 1];
        TriggerHandler handler = new TriggerHandler(new List<Pricing__c>{testPricing}, new Map<Id, Object>(), Pricings.class);
        Boolean error = false;
        Test.startTest();
        try{
            handler.handleAfterUndelete();
        }
        catch(Exception e){
            error = true;
        }
        Test.stopTest();

        System.assert(!error, 'handleAfterUndeleteTest failed');
    }
}