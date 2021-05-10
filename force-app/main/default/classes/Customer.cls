public with sharing class Customer extends Entity implements EntityInterface, TriggerHandlerInterface {
    public String name;
    public final static Type SOBJECT_TYPE = Account.class;

    public Customer() {
        // iterate over all properties
        super();
        this.name = null;
    }
    public Customer(Account myAccount) {
        super(myAccount);
        // iterate over all properties
        this.name = myAccount.Name;
    }
    public sObject toSobject(){
        Account myAccount = new Account();
        // mapeo campo por campo a mis propiedades
        myAccount.Id = this.id;
        return (sObject) myAccount;
    }

    public void onBeforeInsert(List<Object> triggerNew){ return; }
    public void onBeforeUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onBeforeDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterInsert(List<Object> triggerNew){ return; }
    public void onAfterUpdate(List<Object> triggerNew, Map<Id, Object> triggerOldMap){ return; }
    public void onAfterDelete(Map<Id, Object> triggerOldMap){ return; }
    public void onAfterUndelete(List<Object> triggerNew){ return; }
}