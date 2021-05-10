/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 03 2021
 * @description This generic class invokes domain specific logic for trigger processes 
 */
public with sharing class TriggerHandler {
    @TestVisible private List<Object> triggerNew;
    @TestVisible private Map<Id, Object> triggerOldMap;
    @TestVisible private Type domainType;
    
    public TriggerHandler(List<Object> triggerNew, Map<Id, Object> triggerOldMap, Type domainType){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.handleTrigger');
        System.debug(LoggingLevel.DEBUG, 'triggerNew ' + triggerNew);
        System.debug(LoggingLevel.DEBUG, 'triggerOldMap ' + triggerOldMap);
        System.debug(LoggingLevel.DEBUG, 'domainType ' + domainType);
        this.triggerNew = triggerNew;
        this.triggerOldMap = triggerOldMap;
        this.domainType = domainType;
    }
    public void handleTriggerLogic() {
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.handleTrigger');
        if(Trigger.isBefore){
            handleBeforeTrigger();
        }
        else if(Trigger.isAfter){
            handleAfterTrigger();
        }
    }
    @TestVisible
    private void handleBeforeTrigger(){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.handleBeforeTrigger');
        if(Trigger.isInsert){
            System.debug(LoggingLevel.DEBUG, 'Before Insert');
            handleBeforeInsert();
        }
        else if(Trigger.isUpdate) {
            System.debug(LoggingLevel.DEBUG, 'Before Update');
            handleBeforeUpdate();
        }
        else if(Trigger.isDelete) {
            System.debug(LoggingLevel.DEBUG, 'Before Delete');
            handleBeforeDelete();
        }
    }
    @TestVisible
    private void handleAfterTrigger(){
        System.debug(LoggingLevel.DEBUG, 'TriggerHandler.handleAfterTrigger');
        if(Trigger.isInsert){
            System.debug(LoggingLevel.DEBUG, 'After Insert');
            handleAfterInsert();
        }
        else if(Trigger.isUpdate) {
            System.debug(LoggingLevel.DEBUG, 'After Update');
            handleAfterUpdate();
        }
        else if(Trigger.isDelete) {
            System.debug(LoggingLevel.DEBUG, 'After Delete');
            handleAfterDelete();
        }
        else if(Trigger.isUndelete) {
            System.debug(LoggingLevel.DEBUG, 'After Undelete');
            handleAfterUndelete();
        }
    }
    @TestVisible
    private void handleBeforeInsert(){
        System.debug(LoggingLevel.DEBUG, 'handleBeforeInsert');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onBeforeInsert(this.triggerNew);
    }
    @TestVisible
    private void handleBeforeUpdate(){
        System.debug(LoggingLevel.DEBUG, 'handleBeforeUpdate');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onBeforeUpdate(this.triggerNew, this.triggerOldMap);
    }
    @TestVisible
    private void handleBeforeDelete(){
        System.debug(LoggingLevel.DEBUG, 'handleBeforeDelete');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onBeforeDelete(this.triggerOldMap);
    }
    @TestVisible
    private void handleAfterInsert(){
        System.debug(LoggingLevel.DEBUG, 'handleAfterInsert');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onAfterInsert(this.triggerNew);
    }
    @TestVisible
    private void handleAfterUpdate(){
        System.debug(LoggingLevel.DEBUG, 'handleAfterUpdate');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onAfterUpdate(this.triggerNew, this.triggerOldMap);
    }
    @TestVisible
    private void handleAfterDelete(){
        System.debug(LoggingLevel.DEBUG, 'handleAfterDelete');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onAfterDelete(this.triggerOldMap);
    }
    @TestVisible
    private void handleAfterUndelete(){
        System.debug(LoggingLevel.DEBUG, 'handleAfterUndelete');
        TriggerHandlerInterface domainInterface = (TriggerHandlerInterface) domainType.newInstance();
        domainInterface.onAfterUndelete(this.triggerNew);
    }
}