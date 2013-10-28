public with sharing class TriggerMaker {

	// okay, okay... maybe not ALL the objects. Picking a view to avoid the 10-callout limit.
	// if we wanted to do all of them, we'd have to use the SOAP API, which is bulk-friendly, or write a loop in JS or use a batch job
	public static final String[] sObjectNames = new String[] {'Account', 'Contact', 'Opportunity'};

	public static void createTriggers() {
		
		String template = 'trigger {0}Trigger on {0} (before insert) {\n// UPDATEME\n}';

		for(String n : sObjectNames) {
			ToolingAPI.ApexTrigger apexTrigger = new ToolingAPI.ApexTrigger();
			apexTrigger.Body = template.replace('{0}', n);
			apexTrigger.TableEnumOrId = n;
			ToolingAPIBase.SaveResult saveResult = ToolingAPI.createApexTrigger(apexTrigger);
		}
		
	}

	// let's perform an update to demonstrate the differences
	public static void updateTriggers() {

		// create a metadatacontainer
		ToolingAPI.MetadataContainer metadataContainer = new ToolingAPI.MetadataContainer();

		// metadata containers need a unique name
		metadataContainer.Name = String.valueOf(Crypto.getRandomInteger());

		// save the metadata container - aka "declare the package"
		ToolingAPIBase.SaveResult saveResult = ToolingAPI.createMetadataContainer(metadataContainer);
		// set the metadataContainer SFID
		metadataContainer.Id = saveResult.Id;

		// query our existing apex triggers
		ToolingAPI.ApexTriggerQueryResult apexTriggerQueryResult = ToolingAPI.queryApexTrigger('select Id, Body from ApexTrigger where Name = \'AccountTrigger\' or Name = \'ContactTrigger\' or Name = \'OpportunityTrigger\'');

		// get the apex trigger records
		List<ToolingAPI.ApexTrigger> apexTriggers = apexTriggerQueryResult.records;

		// loop over the triggers
		// NOTE: we're working with an implementation of the REST API in Apex, so these calls are less efficient than their SOAP counterparts.
		// REST API commands are not bulk-enabled - we must send each update individually
		for(ToolingAPI.ApexTrigger apexTrigger : apexTriggers) {

			// for each trigger, create a trigger member
			ToolingAPI.ApexTriggerMember apexTriggerMember = new ToolingAPI.ApexTriggerMember();

			// assign the apex trigger SFID to the trigger member
			// this is how the system knows what you're trying to update
			apexTriggerMember.ContentEntityId = apexTrigger.Id;  

			// assign the metadata container id to the trigger
			// aka "add it to the package" 
			apexTriggerMember.MetadataContainerId = metadataContainer.Id;

			// get the existing trigger's body and update it
			String body = apexTrigger.Body;
			body = body.replace('// UPDATEME', 'GenericTriggerHandler.handle(Trigger.new);');

			// set the trigger member's body
			apexTriggerMember.Body = body;

			// save the trigger member
			// aka "delcare the update"
			ToolingAPIBase.SaveResult createApexTriggerMemberSaveResult = ToolingAPI.createApexTriggerMember(apexTriggerMember);
		}

		// create container request - aka "get in the compiler queue"
		ToolingAPI.ContainerAsyncRequest containerAsyncRequest = new ToolingAPI.ContainerAsyncRequest();

		// tell the container what metadata container id to reference, which in turn tells it all of our trigger members to update
		containerAsyncRequest.MetadataContainerId = metadataContainer.Id;

		// ischeckonly tells it to compile (false) or compile and save (true)
		containerAsyncRequest.IsCheckOnly = false;

		// save the container request
		// as its name implies, this is async. If this were a UI we'd need to ping 
		ToolingAPIBase.SaveResult createContainerAsyncRequestSaveResult = ToolingAPI.createContainerAsyncRequest(containerAsyncRequest);

	}

}