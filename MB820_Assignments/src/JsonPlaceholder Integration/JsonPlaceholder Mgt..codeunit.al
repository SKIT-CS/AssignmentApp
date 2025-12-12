codeunit 50206 "JsonPlaceholder Mgt."
{
    procedure GetTodos()
    var
        AssignmentMgt: Codeunit "Assignment Mgt.";
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        JsonText: Text;
        JArray: JsonArray;
        JToken: JsonToken;
        JObject: JsonObject;
        TestString: Text;
        ResultToken: JsonToken;
        Id: Integer;
        UserId: Integer;
        Title: Text;
        Completed: Boolean;
    begin
        // Request from https://jsonplaceholder.typicode.com/todos

        HttpClient.Get('https://jsonplaceholder.typicode.com/todos', ResponseMessage);
        if ResponseMessage.IsSuccessStatusCode() then begin
            ResponseMessage.Content().ReadAs(JsonText);
            //Message('Response JSON: %1', JsonText);
        end else
            Error('HTTP request failed with status code %1', ResponseMessage.HttpStatusCode());

        // Parse JSON array
        JArray.ReadFrom(JsonText);
        foreach JToken in JArray do begin
            JObject := JToken.AsObject();

            // if JObject.SelectToken('userId', ResultToken) then
            //     UserId := ResultToken.AsValue().AsInteger()
            // else
            //     UserId := 0;

            // if JObject.SelectToken('id', ResultToken) then
            //     Id := ResultToken.AsValue().AsInteger()
            // else
            //     Id := 0;

            // if JObject.SelectToken('title', ResultToken) then
            //     Title := ResultToken.AsValue().AsText()
            // else
            //     Title := '';

            // if JObject.SelectToken('completed', ResultToken) then
            //     Completed := ResultToken.AsValue().AsBoolean()
            // else
            //     Completed := false;

            UserId := JObject.SelectToken('userId', ResultToken) ? ResultToken.AsValue().AsInteger() : 0;
            Id := JObject.SelectToken('id', ResultToken) ? ResultToken.AsValue().AsInteger() : 0;
            Title := JObject.SelectToken('title', ResultToken) ? ResultToken.AsValue().AsText() : '';
            Completed := JObject.SelectToken('completed', ResultToken) ? ResultToken.AsValue().AsBoolean() : false;

            AssignmentMgt.InsertAssignment(UserId, Title, StrSubstNo('%1 created by %2, at %3', Title, UserId, Today()), Id, Completed);

        end;



    end;

}