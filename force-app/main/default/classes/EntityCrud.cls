public with sharing virtual class EntityCrud {
    protected virtual sObject selectOne(){
        String myQuery = 'SELECT Id From Account LIMIT 1';
        sObject result = database.query(myQuery);
        return result;
    }
    protected virtual List<sObject> selectMany(){
        String myQuery = 'SELECT Id From Account LIMIT 1000';
        List<sObject> results = database.query(myQuery);
        return results;
    }
}

// SELECT
// deep level
// list of fields

// WHERE
// soql builder
// map