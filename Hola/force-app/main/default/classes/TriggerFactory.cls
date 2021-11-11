/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-11-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TriggerFactory {
    public static void createHandler(Schema.sObjectType soType) {
     ITrigger handler = getHandler(soType);
     if(handler == null) {
      throw new TriggerException('No Trigger Handler registered for Object Type: ' + soType);
     }

     // Execute the handler to fulfil the trigger
     execute(handler);
    }
    private static void execute(ITrigger handler) {
     // Before Trigger
     if(Trigger.isBefore) {
      handler.bulkBefore();
     }
     else {
      handler.bulkAfter();
     }
    }
    private static ITrigger getHandler(Schema.sObjectType soType) {
     if(soType == Opportunity.sObjectType) {
      return new OpportunityTriggerHandler();
     }
     return null;
    }
   }