codeunit 50200 "Assignment Mgt."
{
    trigger OnRun()
    begin

    end;

    procedure Complete(var Assignment: Record "Assignment")
    begin
        // TODO lots of functionality
        Sleep(200);

        Assignment.Status := Assignment.Status::Completed;
        Assignment.Modify();
    end;

    procedure InProgress(var Assignment: Record "Assignment")
    begin
        // TODO lots of functionality
        Sleep(200);

        Assignment.Status := Assignment.Status::"In Progress";
        Assignment.Modify();
    end;

    procedure InsertAssignment(UserId: Integer; Title: Text[100]; Description: Text)
    var
        Assignment: Record "Assignment";
    begin
        Assignment.Init();
        Assignment.Validate("User Id", UserId);
        Assignment.Validate(Title, Title);
        Assignment.Validate(Description, CopyStr(Description, 1, MaxStrLen(Assignment.Description)));
        //Assignment.Status := Assignment.Status::New;
        Assignment.Insert(true);
    end;

    procedure InsertAssignment(UserId: Integer; Title: Text[100]; Description: Text; APIId: Integer; Completed: Boolean)
    var
        Assignment: Record "Assignment";
    begin
        Assignment.SetRange("API Id", APIId);
        if not Assignment.IsEmpty() then
            exit; // already exists

        Assignment.Init();
        Assignment.Validate("User Id", UserId);
        Assignment.Validate(Title, Title);
        Assignment.Validate(Description, CopyStr(Description, 1, MaxStrLen(Assignment.Description)));
        //Assignment.Status := Assignment.Status::New;

        Assignment.Validate("API Id", APIId);
        If Completed then
            Assignment.Status := Assignment.Status::Completed
        else
            Assignment.Status := Assignment.Status::Incomplete;

        Assignment.Insert(true);
    end;

    procedure ExportAssignmentsToAzure()
    var
        ExportAssignmentsXMLPort: XmlPort "Export Assignments";
        OStream: OutStream;
        IStream: InStream;
        TempBlob: Codeunit "Temp Blob";
        ExternalFileStorage: Codeunit "External File Storage";
    begin
        TempBlob.CreateOutStream(OStream);
        ExportAssignmentsXMLPort.SetDestination(OStream);
        ExportAssignmentsXMLPort.Export();

        TempBlob.CreateInStream(IStream);
        ExternalFileStorage.Initialize(Enum::"File Scenario"::Default);
        ExternalFileStorage.CreateFile('assignments.xml', IStream);

    end;

    procedure QueryReadFunction()
    var
        // Assignment: Record "Assignment";
        // Customer: Record Customer;
        AssignmentCustomerQuery: Query AssignmentCustomerQuery;
        CustomerList: List of [Text];
    begin
        // if Assignment.FindSet() then
        //     repeat
        //         if Customer.Get(Assignment."User Id") then begin
        //             // Do something with Customer data
        //         end;
        //     until Assignment.Next() = 0;

        if AssignmentCustomerQuery.Open() then
            while AssignmentCustomerQuery.Read() do begin
                if not CustomerList.Contains(AssignmentCustomerQuery.Name) then
                    CustomerList.Add(AssignmentCustomerQuery.Name);
            end;
    end;

    procedure VerifyAssignmentSetup()
    var
        AssignmentSetup: Record "Assignment Setup";
        NoSeries: Record "No. Series";
        NoSeriesErrorInfo: ErrorInfo;
    begin
        AssignmentSetup.InsertIfNotExists();
        if not NoSeries.Get(AssignmentSetup."Assignment Nos.") then begin
            NoSeriesErrorInfo.Title := 'No. Series Not Found';
            NoSeriesErrorInfo.Message := StrSubstNo('No. Series %1 for Assignments does not exist. Please set up Assignment Nos. in Assignment Setup.', AssignmentSetup."Assignment Nos.");
            NoSeriesErrorInfo.RecordId := AssignmentSetup.RecordId();

            NoSeriesErrorInfo.AddAction('Open No. Series Setup', Codeunit::"Assignment Setup Error Mgt.", 'OpenAssignmentSetup');
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnAfterReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var LinesWereModified: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        InsertAssignment(0, StrSubstNo('Post Sales Doc %1', SalesHeader."No."), StrSubstNo('Remember to post the %2 %1', SalesHeader."No.", SalesHeader."Document Type"));

    end;


}