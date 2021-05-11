/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 10 2021
 * @description This is an example domain entity. It has some specific properties such as name,
 * and can contain business logic related to building instances
 */
public with sharing class Customer extends Entity implements EntityInterface, TriggerHandlerInterface {
    
    public String name;

    private final Type SOBJECT_TYPE = Account.class;
    
    private final Map<String, String> FIELD_MAP = new Map<String, String>{
        'id'=>'Id',
        'name'=>'Name'
    };
    /**
     * @description default constructor. null initialization
     * @return   return description
     */
    public Customer() {
        super();
        System.debug(LoggingLevel.DEBUG, 'Customer');
        // iterate over all properties or manually map
        this.name = null;
    }
    /**
     * @description Customer constructor with an account initiaizator
     * @param  mySobject the account that will be used to populate the member properties
     */
    public Customer(sObject mySobject) {
        super(mySobject);
        Account myAccount;
        try{
            myAccount = (Account) mySobject;
        }
        catch(Exception e){
            System.debug(LoggingLevel.ERROR, 'Type couldn\'t be casted');
            throw e;
        }
        System.debug(LoggingLevel.DEBUG, 'Customer');
        System.debug(LoggingLevel.DEBUG, 'myAccount ' + mySobject);
        // iterate over all properties or manually map
        this.name = myAccount.Name;
    }
    /**
     * @description this method creates an instance of the sObject type
     *              and populates the fields based on the field mapping
     * @return   returns an instance of the sObject
     */
    public sObject toSobject(){
        System.debug(LoggingLevel.DEBUG, 'toSobject');
        Account myAccount = new Account();
        // iterate over all properties or manually map
        myAccount.Id = this.id;
        System.debug(LoggingLevel.DEBUG, 'myAccount ' + myAccount);
        return (sObject) myAccount;
    }
    /**
     * @return   returns the name of the sObject mapped to the entity
     */
    public String getSobjectName(){
        return this.SOBJECT_TYPE.getName();
    }
    /**
     * @return   returns the type of the sObject mapped to the entity
     */
    public Type getSobjectType(){
        return this.SOBJECT_TYPE;
    }
    /**
     * @return   returns the field mapping between the sObject and the entity
     */
    public Map<String, String> getFieldMapping(){
        return this.FIELD_MAP;
    }
    
    

    public void onBeforeInsert(List<Object> triggerNew){ return; }
    public void onBeforeUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onBeforeDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterInsert(List<Object> triggerNew){ return; }
    public void onAfterUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onAfterDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterUndelete(List<Object> triggerNew){ return; }
}