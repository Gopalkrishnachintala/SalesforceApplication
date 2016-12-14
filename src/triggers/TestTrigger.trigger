trigger  TestTrigger on Case (Before Insert,After Insert,Before Update ,After Update ,Before Delete ,After Delete,After Undelete) {
    System.debug('*********testExecution*************'+Trigger.isExecuting);
    System.debug('****************size of trigger***************'+Trigger.size);
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            for(Case cs:Trigger.new){
                System.debug('********beforeInsertNew************'+Trigger.new);
            }
        }
        if(Trigger.isUpdate){
            for(Case cs:Trigger.new){
                System.debug('********beforeUpdateNew************'+Trigger.new);
                System.debug('**********beforeUpdateOld**********'+Trigger.old);
                System.debug('********beforeMapUpdateNewMap************'+Trigger.newMap);
                System.debug('**********beforeMapUpdateOldMap**********'+Trigger.oldMap);
            }
       }
        if(Trigger.isDelete){
            for(Case cs:Trigger.old){
              
                System.debug('**********beforeDeleteOld**********'+Trigger.old);
                System.debug('**********beforeMapDeleteOldMap**********'+Trigger.oldMap);
            }
      }
  }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
             for(Case cs:Trigger.new){
                System.debug('**********afterInsertNew**********'+Trigger.new);
                System.debug('**********afterInsertNewMap**********'+Trigger.newMap);
             }
         }
        if(Trigger.isUpdate){
             for(Case cs:Trigger.new){
                System.debug('**********afterUpdateNew**********'+Trigger.new);
                System.debug('*************afterUpdateOld*******'+Trigger.Old);
                System.debug('**********afterUpdateNewMap**********'+Trigger.newMap);
                System.debug('*************afterUpdateOldMap*******'+Trigger.oldMap);
            }
        }
       if(Trigger.isDelete){
            for(Case cs:Trigger.old){
                System.debug('*************afterDeleteold*******'+Trigger.Old);
                System.debug('*************afterDeleteoldMap*******'+Trigger.oldMap);
            }
       }
       if(Trigger.isUnDelete){
            for(Case cs:Trigger.new){
                System.debug('**********afterunUndeleteNew**********'+Trigger.new);
                System.debug('**********afterunUndeleteNewMap**********'+Trigger.newMap);
              
           }
       }
    }
}