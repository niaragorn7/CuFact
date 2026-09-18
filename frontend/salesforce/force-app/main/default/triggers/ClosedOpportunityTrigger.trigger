trigger ClosedOpportunityTrigger on Opportunity (after insert, after update){
    List<Task> taskList = new List<task>();
    for(Opportunity opp : Trigger.new){
        if(opp.StageName == 'Closed Won'){
            Task newTask = new Task(
                Subject = 'Follow Up Test Task',
                whatId = opp.Id
            );
            taskList.add(newTask);
            
        }
    }
    insert taskList;
}