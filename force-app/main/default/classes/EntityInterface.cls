/**
 * @author DF dante.filareto@parserdigital.com
 * @date may 10 2021
 * @description This interface should be implemented by every domain entity
 * It provides the guidelines of common behaviour across all domains
 */
public interface EntityInterface {
    /**
     * @description this method creates an instance of the sObject type
     *              and populates the fields based on the field mapping
     * @return   returns an instance of the sObject
     */
    sObject toSobject();
    /**
     * @return   returns the name of the sObject mapped to the entity
     */
    String getSobjectName();
    /**
     * @return   returns the type of the sObject mapped to the entity
     */
    Type getSobjectType();
    /**
     * @return   returns the field mapping between the sObject and the entity
     */
    Map<String, String> getFieldMapping();
}