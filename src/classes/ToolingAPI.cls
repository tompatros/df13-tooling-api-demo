public class ToolingAPI extends ToolingAPIBase {
    public class ApexClass {
        public id Id    { get; set; }
        public string NamespacePrefix   { get; set; }
        public string Name  { get; set; }
        public double ApiVersion    { get; set; }
        public string Status    { get; set; }
        public boolean IsValid  { get; set; }
        public double BodyCrc   { get; set; }
        public string Body  { get; set; }
        public integer LengthWithoutComments    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
        public SymbolTable SymbolTable  { get; set; }
        public string FullName  { get; set; }
    }

    public class ApexClassQueryResult extends QueryResult {
         public ApexClass[] records { get; set; }
    }

    public static ApexClassQueryResult queryApexClass(String soql) {
         return (ApexClassQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), ApexClassQueryResult.class);
    }

    public class ApexTrigger {
        public id Id    { get; set; }
        public string NamespacePrefix   { get; set; }
        public string Name  { get; set; }
        public string TableEnumOrId { get; set; }
        public boolean UsageBeforeInsert    { get; set; }
        public boolean UsageAfterInsert { get; set; }
        public boolean UsageBeforeUpdate    { get; set; }
        public boolean UsageAfterUpdate { get; set; }
        public boolean UsageBeforeDelete    { get; set; }
        public boolean UsageAfterDelete { get; set; }
        public boolean UsageIsBulk  { get; set; }
        public boolean UsageAfterUndelete   { get; set; }
        public double ApiVersion    { get; set; }
        public string Status    { get; set; }
        public boolean IsValid  { get; set; }
        public double BodyCrc   { get; set; }
        public string Body  { get; set; }
        public integer LengthWithoutComments    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
    }

    public class ApexTriggerQueryResult extends QueryResult {
         public ApexTrigger[] records { get; set; }
    }

    public static ApexTriggerQueryResult queryApexTrigger(String soql) {
         return (ApexTriggerQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), ApexTriggerQueryResult.class);
    }

    @remoteAction
    public static SaveResult createApexTrigger(ApexTrigger data) {
        return (SaveResult)JSON.deserialize(ToolingAPIBase.send('sobjects/ApexTrigger/', 'POST', JSON.serialize(data)).getBody(), SaveResult.class);
    }

    public class ApexTriggerMember {
        public id Id    { get; set; }
        public boolean IsDeleted    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
        public Id MetadataContainerId   { get; set; }
        public Id ContentEntityId   { get; set; }
        public string Content   { get; set; }
        public datetime LastSyncDate    { get; set; }
        public string Body  { get; set; }
        public SymbolTable SymbolTable  { get; set; }
    }

    public class ApexTriggerMemberQueryResult extends QueryResult {
         public ApexTriggerMember[] records { get; set; }
    }

    public static ApexTriggerMemberQueryResult queryApexTriggerMember(String soql) {
         return (ApexTriggerMemberQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), ApexTriggerMemberQueryResult.class);
    }

    @remoteAction
    public static SaveResult createApexTriggerMember(ApexTriggerMember data) {
        return (SaveResult)JSON.deserialize(ToolingAPIBase.send('sobjects/ApexTriggerMember/', 'POST', JSON.serialize(data)).getBody(), SaveResult.class);
    }

    public class MetadataContainer {
        public id Id    { get; set; }
        public boolean IsDeleted    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
        public string Name  { get; set; }
    }

    public class MetadataContainerQueryResult extends QueryResult {
         public MetadataContainer[] records { get; set; }
    }

    public static MetadataContainerQueryResult queryMetadataContainer(String soql) {
         return (MetadataContainerQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), MetadataContainerQueryResult.class);
    }

    @remoteAction
    public static SaveResult createMetadataContainer(MetadataContainer data) {
        return (SaveResult)JSON.deserialize(ToolingAPIBase.send('sobjects/MetadataContainer/', 'POST', JSON.serialize(data)).getBody(), SaveResult.class);
    }

    public class ApexClassMember {
        public id Id    { get; set; }
        public boolean IsDeleted    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
        public Id MetadataContainerId    { get; set; }
        public Id ContentEntityId    { get; set; }
        public string Content   { get; set; }
        public datetime LastSyncDate    { get; set; }
        public string Body  { get; set; }
        public SymbolTable SymbolTable  { get; set; }
    }

    public class ApexClassMemberQueryResult extends QueryResult {
         public ApexClassMember[] records { get; set; }
    }

    public static ApexClassMemberQueryResult queryApexClassMember(String soql) {
         return (ApexClassMemberQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), ApexClassMemberQueryResult.class);
    }

    @remoteAction
    public static SaveResult createApexClassMember(ApexClassMember data) {
        return (SaveResult)JSON.deserialize(ToolingAPIBase.send('sobjects/ApexClassMember/', 'POST', JSON.serialize(data)).getBody(), SaveResult.class);
    }

    public class ContainerAsyncRequest {
        public id Id    { get; set; }
        public boolean IsDeleted    { get; set; }
        public datetime CreatedDate { get; set; }
        public datetime LastModifiedDate    { get; set; }
        public datetime SystemModstamp  { get; set; }
        public Id MetadataContainerId    { get; set; }
        public string ErrorMsg  { get; set; }
        public string CompilerErrors    { get; set; }
        public boolean IsRunTests   { get; set; }
        public string State { get; set; }
        public boolean IsCheckOnly  { get; set; }
    }

    public class ContainerAsyncRequestQueryResult extends QueryResult {
         public ContainerAsyncRequest[] records { get; set; }
    }

    public static ContainerAsyncRequestQueryResult queryContainerAsyncRequest(String soql) {
         return (ContainerAsyncRequestQueryResult)JSON.deserialize(ToolingAPIBase.query(soql).getBody(), ContainerAsyncRequestQueryResult.class);
    }

    @remoteAction
    public static SaveResult createContainerAsyncRequest(ContainerAsyncRequest data) {
        return (SaveResult)JSON.deserialize(ToolingAPIBase.send('sobjects/ContainerAsyncRequest/', 'POST', JSON.serialize(data)).getBody(), SaveResult.class);
    }

}