/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 03 2021
 * @description This interface defines common functionality for every domain entity
 *  that needs to implement trigger handling
 */
public interface TriggerHandlerInterface {
    void onBeforeInsert(List<Object> triggerNewMap);
    void onBeforeUpdate(List<Object> triggerNewMap, Map<Id, Object> triggerOldMap);
    void onBeforeDelete(Map<Id, Object> triggerOldMap);
    void onAfterInsert(List<Object> triggerNewMap);
    void onAfterUpdate(List<Object> triggerNewMap, Map<Id, Object> triggerOldMap);
    void onAfterDelete(Map<Id, Object> triggerOldMap);
    void onAfterUndelete(List<Object> triggerNewMap);
}