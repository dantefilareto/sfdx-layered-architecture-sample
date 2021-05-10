String customerId = '0011w00000eMv47AAC';
CustomersService service = new CustomersService();
Customer result = (Customer) service.selectById(customerId);

System.debug(LoggingLevel.DEBUG, result);