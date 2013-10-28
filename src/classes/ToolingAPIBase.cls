public virtual with sharing class ToolingAPIBase {
	
	public final static String endpoint = 'https://na15.salesforce.com/services/data/v29.0/tooling/';

     public static HttpResponse send(String action, String method, String body) {

        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());  
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setEndpoint(endpoint + action);
        httpRequest.setMethod(method);
        if(!String.isEmpty(body)) {
            Map<String, Object> bodyData = (Map<String, Object>)JSON.deserializeUntyped(body);
            Map<String, Object> bodyDataWithoutNulls = new Map<String, Object>();
            for(String s : bodyData.keySet()) {
                if(bodyData.get(s) != null) bodyDataWithoutNulls.put(s, bodyData.get(s));
            }
            body = JSON.serialize(bodyDataWithoutNulls);
            httpRequest.setBody(body);
        }
        Http http = new Http();
        return http.send(httpRequest); 
     }

     public static HttpResponse query(String soql) {
        return send('query/?q=' + EncodingUtil.urlEncode(soql, 'UTF-8'), 'GET', null);
     }

     public static HttpResponse del(String sObjectName, String id) {
        return send('sobjects/' + sObjectName + '/' + id, 'DELETE', null);
     }

     @remoteAction
     public static String describeGlobal() {
        return send('sobjects/', 'GET', null).getBody();
     }

     @remoteAction
     public static String describeSObject(String sObjectName) {
        return send('sobjects/' + sObjectName + '/describe/', 'GET', null).getBody();
     } 

     @remoteAction
     public static SaveResult createApexClass(String apexClassData) {
        return (SaveResult)JSON.deserialize(send('sobjects/ApexClass/', 'POST', apexClassData).getBody(), SaveResult.class);
     }

     public virtual class QueryResult {
        public Integer size { get; set; }
        public Integer totalSize { get; set; }
        public Boolean done { get; set; }
        public String entityTypeName { get; set; }
        public String nextRecordsUrl { get; set; }
     }

     public class SaveResult {
        public List<Error> errors { get; set; }
        public Id id { get; set; }
        public Boolean success { get; set; }
     }

     public class Error {
        public List<String> fields { get; set; }
        public String message { get; set; }
        public String statusCode { get; set; }
     }

}