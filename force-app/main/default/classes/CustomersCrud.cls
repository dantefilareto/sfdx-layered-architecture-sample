/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 03 2021
 * @description This is an example data access layer class. 
 * It should have all the methods to SOQL and DML records. 
 * The base class EntityCrud provides basic functionality wshich can be overwritten here.
 */
public with sharing class CustomersCrud extends EntityCrud {
    private Type domainType = Customer.class;
    /**
     * @description 
     * @return   returns the api name of the sObject
     */
    public Customer selectOneCustomerById(String customerId, List<String> properties){
        System.debug(LoggingLevel.DEBUG, 'selectOneCustomerById');
        System.debug(LoggingLevel.DEBUG, 'customerId ' + customerId);
        Map<String, String> fieldMapping = getFieldMapping(domainType);
        System.debug(LoggingLevel.DEBUG, 'fieldMapping ' + fieldMapping);
        List<String> fields = getSfieldNames(properties, fieldMapping);
        System.debug(LoggingLevel.DEBUG, 'fields ' + fields);
        String sObjectName = getSobjectName(domainType);
        System.debug(LoggingLevel.DEBUG, 'sObjectName ' + sObjectName);
        sObject result = selectOneById(fields, sObjectName, customerId);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return new Customer(result);
    }
}