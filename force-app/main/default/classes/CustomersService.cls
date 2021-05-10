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