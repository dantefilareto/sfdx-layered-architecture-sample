/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 10 2021
 * @description This class should be used as base class for every donmain entity.
 * It provides the common properties that all salesforce records have
 */
public with sharing abstract class Entity {
    public String id;
    public Entity() {
        System.debug(LoggingLevel.DEBUG, 'Entity');
        this.id = null;
    }
    public Entity(sObject myRecord) {
        System.debug(LoggingLevel.DEBUG, 'Entity');
        System.debug(LoggingLevel.DEBUG, 'myRecord ' + myRecord);
        this.id = myRecord.Id;
    }
}