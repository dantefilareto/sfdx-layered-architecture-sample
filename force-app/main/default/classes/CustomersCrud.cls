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
     * @description selectOneCustomerById description
     * @param  customerId id of the customer to query for
     * @param  properties list of properties to retrieve
     * @return            returns an instance of thar customer or throws exception
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
    /**
     * @description insertOneCustomer inserts a new customer in the database
     * @param  myCustomer the customer to create
     * @return            returns the new customer with Id
     */
    public Customer insertOneCustomer(Customer myCustomer){
        System.debug(LoggingLevel.DEBUG, 'insertOneCustomer');
        System.debug(LoggingLevel.DEBUG, 'myCustomer ' + myCustomer);
        Sobject myRecord = myCustomer.toSobject();
        System.debug(LoggingLevel.DEBUG, 'myRecord ' + myRecord);
        sObject result = insertOne(myRecord);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return new Customer(result);
    }
    /**
     * @description updateOneCustomer updates a customer in the database
     * @param  myCustomer the customer to update
     * @return            returns the same record
     */
    public Customer updateOneCustomer(Customer myCustomer){
        System.debug(LoggingLevel.DEBUG, 'insertOneCustomer');
        System.debug(LoggingLevel.DEBUG, 'myCustomer ' + myCustomer);
        Sobject myRecord = myCustomer.toSobject();
        System.debug(LoggingLevel.DEBUG, 'myRecord ' + myRecord);
        sObject result = updateOne(myRecord);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return new Customer(result);
    }
}