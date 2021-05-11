/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 03 2021
 * @description This is an example service domain class. 
 * It should have all the business logic related to the customer domain
 * It should serve as an entry point from anywhere
 */
public with sharing class CustomersService {
    CustomersCrud crud = new CustomersCrud();

    /**
     * @description insertOneCustomer inserts a new customer in the database
     * @param  myCustomer the customer to create
     * @return            returns the new customer with Id
     */
    public Customer insertOneCustomer(Customer myCustomer){
        System.debug(LoggingLevel.DEBUG, 'insertOneCustomer()');
        System.debug(LoggingLevel.DEBUG, 'myCustomer ' + myCustomer);
        Customer result = crud.insertOneCustomer(myCustomer);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return result;    
    }
    /**
     * @description updateOneCustomer updates a customer in the database
     * @param  myCustomer the customer to update
     * @return            returns the same record
     */
    public Customer updateOneCustomer(Customer myCustomer){
        System.debug(LoggingLevel.DEBUG, 'updateOneCustomer()');
        System.debug(LoggingLevel.DEBUG, 'myCustomer ' + myCustomer);
        Customer result = crud.updateOneCustomer(myCustomer);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return result;    
    }
    /**
     * @description         this method returns an account based on its ID
     * @param  customerId   the id of the record
     * @return              returns the result of the query
     */
    public Customer selectById(String customerId){
        System.debug(LoggingLevel.DEBUG, 'selectById()');
        System.debug(LoggingLevel.DEBUG, 'customerId ' + customerId);
        Customer result = crud.selectOneCustomerById(customerId, new List<String>{'id', 'name'});
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return result;    
    }
}