codeunit 50207 "Assignment Setup Error Mgt."
{
    procedure OpenAssignmentSetup(NoSeriesErrorInfo: ErrorInfo)
    var
        AssignmentSetupPage: Page "Assignment Setup";
    begin
        //NoSeriesErrorInfo.RecordId
        AssignmentSetupPage.RunModal();
    end;

}