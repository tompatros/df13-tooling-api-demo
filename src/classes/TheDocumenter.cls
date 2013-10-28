public with sharing class TheDocumenter {
	
	//public List<ToolingAPIObjects.ApexClass> classes { get; set; }

	public ToolingAPI.ContainerAsyncRequest containerAsyncRequest { get; set; }
	public List<ToolingAPI.ApexClassMember> apexClassMembers { get; set; }

	public String apexClassMembersJSON {
		get {
			return JSON.serialize(apexClassMembers);
		}
	}

	public void init() {
		
		if(ApexPages.currentPage().getParameters().get('id') != null) {
			// get the apexpagemembers
			ToolingAPI.ApexClassMemberQueryResult result = ToolingAPI.queryApexClassMember('select Id, Body, ContentEntityId, SymbolTable from ApexClassMember where MetaDataContainerId = \'' + ApexPages.currentPage().getParameters().get('id') + '\'');
			apexClassMembers = result.records;
			system.debug(apexClassMembers);
		}
		else {
			// init the container
			initContainerAsyncRequest();
		}
		

	}

	private void initContainerAsyncRequest() {
		
		// select the classes
		ToolingAPI.ApexClassQueryResult result = ToolingAPI.queryApexClass('select Id, Body, Name from ApexClass where Name LIKE \'Demo%\'');
		List<ToolingAPI.ApexClass> apexClasses = result.records;

		// create a metadatacontainer
		ToolingAPI.MetadataContainer metadataContainer = new ToolingAPI.MetadataContainer();
		metadataContainer.Name = String.valueOf(Crypto.getRandomInteger());
		ToolingAPIBase.SaveResult saveResult = ToolingAPI.createMetadataContainer(metadataContainer);
		metadataContainer.Id = saveResult.Id;

		// create apex class members
		List<ToolingAPI.ApexClassMember> apexClassMembers = new List<ToolingAPI.ApexClassMember>();

		// TODO: retool to JS to avoid 10-callout limit
		for(ToolingAPI.ApexClass apexClass : apexClasses) {
			ToolingAPI.ApexClassMember apexClassMember = new ToolingAPI.ApexClassMember();
			apexClassMember.Body = apexClass.Body;
			apexClassMember.ContentEntityId = apexClass.Id;  
			apexClassMember.MetadataContainerId = metadataContainer.Id;
			ToolingAPIBase.SaveResult createApexClassMemberSaveResult = ToolingAPI.createApexClassMember(apexClassMember);
		}

		containerAsyncRequest = new ToolingAPI.ContainerAsyncRequest();
		containerAsyncRequest.MetadataContainerId = metadataContainer.Id;
		containerAsyncRequest.IsCheckOnly = true;
		ToolingAPIBase.SaveResult createContainerAsyncRequestSaveResult = ToolingAPI.createContainerAsyncRequest(containerAsyncRequest);
		containerAsyncRequest.Id = createContainerAsyncRequestSaveResult.Id;

	}

	@remoteAction
	public static ToolingAPI.ContainerAsyncRequestQueryResult queryContainerAsyncRequest(String containerAsyncRequestId) {
		return ToolingAPI.queryContainerAsyncRequest('select Id, MetadataContainerId, State from ContainerAsyncRequest where Id = \'' + containerAsyncRequestId + '\'');
	}

	
	public static ToolingAPI.ApexClassMemberQueryResult queryApexClassMember(String containerAsyncRequestId) {
		return ToolingAPI.queryApexClassMember('select Id, Body, ContentEntityId, SymbolTable from ApexPageMember where MetadataContainerId = \'' + containerAsyncRequestId + '\' order by ContentEntity.Name');
	}

}