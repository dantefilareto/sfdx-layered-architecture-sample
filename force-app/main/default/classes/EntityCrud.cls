/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 10 2021
 * @description Base class for Crud access layers. This class provides common functionality that 
 * can be overwritten and extended in the child classes
 */
public with sharing virtual class EntityCrud {
    private final static String SELECT_ONE_BY_ID = 'SELECT {0} FROM {1} WHERE Id = :{2} LIMIT {3}';
    private final static String SELECT_BY_ID = 'SELECT {0} FROM {1} WHERE Id IN :{2}';
    /**
     * @description         performs a SOQL returning multiple records.
     *                      This is basic functionality that can be extended
     * @param  fieldList    the list of fields to select
     * @param  tableName    the sobject to query from
     * @param  recordId    the id to match
     * @return              returns the result of the query execution
     */
    protected virtual SObject selectOneById(List<String> fieldList, String tableName, Id recordId){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.selectOneById()');
        System.debug(LoggingLevel.DEBUG, 'fieldList ' + fieldList);
        System.debug(LoggingLevel.DEBUG, 'recordId ' + recordId);
        List<String> params = new List<String> { String.join(fieldList, ', '), tableName, 'recordId', '1' };
        System.debug(LoggingLevel.DEBUG, 'params ' + params);
        String myQuery = String.format(SELECT_ONE_BY_ID, params);
        System.debug(LoggingLevel.DEBUG, 'myQuery ' + myQuery);
        SObject result =  (SObject) Database.query(myQuery);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return result;
    }
    /**
     * @description         performs a SOQL returning multiple records.
     *                      This is basic functionality that can be extended
     * @param  fieldList    the list of fields to select
     * @param  tableName    the sobject to query from
     * @param  recordIds    the ids to match
     * @return              returns the result of the query execution
     */
    protected virtual List<SObject> selectManyById(List<String> fieldList, String tableName, Set<Id> recordIds){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.selectOneById()');
        System.debug(LoggingLevel.DEBUG, 'fieldList ' + fieldList);
        System.debug(LoggingLevel.DEBUG, 'recordIds ' + recordIds);
        List<String> params = new List<String> { String.join(fieldList, ', '), tableName, 'recordIds'};
        System.debug(LoggingLevel.DEBUG, 'params ' + params);
        String myQuery = String.format(SELECT_BY_ID, params);
        System.debug(LoggingLevel.DEBUG, 'myQuery ' + myQuery);
        List<SObject> result =  (List<SObject>) Database.query(myQuery);
        System.debug(LoggingLevel.DEBUG, 'result ' + result);
        return result;
    }
    /**
     * @description       returns the sobject name for that type 
     * @param  domainType the domain type
     * @return            returns the sobject name
     */
    protected virtual String getSobjectName(Type domainType){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.getSobjectName()');
        EntityInterface entityInstance = (EntityInterface) domainType.newInstance();
        String sobjectName = entityInstance.getSobjectName();
        System.debug(LoggingLevel.DEBUG, 'sobjectName ' + sobjectName);
        return sobjectName;
    }
    /**
     * @description         transforms the member properties to sobject fields
     * @param  properties   the properties to map
     * @param  fieldMapping fieldMapping the entity's field mapping to the sobject
     * @return              returns a list of sObject fields
     */ 
    protected virtual List<String> getSfieldNames(List<String> properties, Map<String, String> fieldMapping){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.getSfieldNames()');
        System.debug(LoggingLevel.DEBUG, 'properties ' + properties);
        System.debug(LoggingLevel.DEBUG, 'fieldMapping ' + fieldMapping);
        List<String> fields = new List<String>();
        for(String prop : properties){
            fields.add(fieldMapping.get(prop));
        }
        System.debug(LoggingLevel.DEBUG, 'fields ' + fields);
        return fields;
    }
    /**
     * @description         returns the field mapping for that domain type
     * @param  domainType   the domain type
     * @return              returns the field mapping
     */
    protected virtual Map<String, String> getFieldMapping(Type domainType){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.getFieldMapping()');
        EntityInterface entityInstance = (EntityInterface) domainType.newInstance();
        Map<String, String> fieldMapping = entityInstance.getFieldMapping();
        System.debug(LoggingLevel.DEBUG, 'fieldMapping ' + fieldMapping);
        return fieldMapping;
    }
    /**
     * @description     This method provides basic creation functionality
     * @param  myRecord the record to insert in the database
     * @return          returns the same record plus the new id
     */
    protected virtual Sobject insertOne(Sobject myRecord){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.insertOne');
        System.debug(LoggingLevel.DEBUG, 'myRecord ' + myRecord);
        database.insert(myRecord);
        System.debug(LoggingLevel.DEBUG, 'myRecord.Id ' + myRecord.Id);
        return myRecord;
    }
    /**
     * @description     This method provides basic creation functionality
     * @param  myRecord the record to insert in the database
     * @return          returns the same record plus the new id
     */
    protected virtual Sobject updateOne(Sobject myRecord){
        System.debug(LoggingLevel.DEBUG, 'EntityCrud.updateOne');
        System.debug(LoggingLevel.DEBUG, 'myRecord ' + myRecord);
        database.update(myRecord);
        return myRecord;
    }
}