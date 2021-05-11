CustomersService service = new CustomersService();

Customer myCustomer = new Customer();
myCustomer.name = 'john';

myCustomer = service.insertOneCustomer(myCustomer);
System.debug(LoggingLevel.DEBUG, 'insert myCustomer ' + myCustomer);

myCustomer.name = 'paul';

myCustomer = service.updateOneCustomer(myCustomer);
System.debug(LoggingLevel.DEBUG, 'update myCustomer ' + myCustomer);

myCustomer = (Customer) service.selectById(myCustomer.id);
System.debug(LoggingLevel.DEBUG, 'query myCustomer ' + myCustomer);
