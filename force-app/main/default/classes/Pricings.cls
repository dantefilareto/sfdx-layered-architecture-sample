/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 03 2021
 * @description Pricing domain class
 */
public with sharing class Pricings implements TriggerHandlerInterface{
    public void setinitialDisbursedPrice(List<Pricing__c> triggerNew){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.setinitialDisbursedPrice');
        System.debug(LoggingLevel.DEBUG, 'triggerNew ' + triggerNew);
        for(Pricing__c pricing : triggerNew){
            if(!isEu2(pricing)){
                continue;
            }
            if(pricing.Disbursed_Advance_Amount__c == null){
                pricing.Disbursed_Advance_Amount__c = pricing.Advance_Amount__c;
            }
            if(pricing.Disbursed_Purchased_Amount__c == null){
                pricing.Disbursed_Purchased_Amount__c = pricing.Purchased_Amount__c;
            }
        }
    }
    public Boolean isEu2(Pricing__c obj){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.isEu2');
        System.debug(LoggingLevel.DEBUG, 'obj ' + obj);
        return obj.CurrencyIsoCode == CurrencyIsoCode.GBP;
    }
    
    public void onBeforeInsert(List<Object> triggerNew){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.onBeforeInsert');
        System.debug(LoggingLevel.DEBUG, 'triggerNew ' + triggerNew);
        // LE-498 Update the disbursed amount fields when a pricing record is created on EU2
        setinitialDisbursedPrice((List<Pricing__c>) triggerNew);
    }
    public void onBeforeUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onBeforeDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterInsert(List<Object> triggerNew){ return; }
    public void onAfterUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onAfterDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterUndelete(List<Object> triggerNew){ return; }
}