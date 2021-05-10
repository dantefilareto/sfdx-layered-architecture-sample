public with sharing abstract class Entity {
    public String id;
    public Entity() {
        this.id = null;
    }
    public Entity(sObject myRecord) {
        this.id = myRecord.Id;
    }
}