page 50200 "Assignment List"
{
    Caption = 'Assignments';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Assignment;

    CardPageId = "Assignment Card";
    Editable = false;
    QueryCategory = 'Assignment List';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Number field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(StatusGroup)
            {
                caption = 'Status Actions';

                action(SetInProgressAction)
                {
                    Caption = 'Set In Progress';
                    ToolTip = 'Sets the assignment status to In Progress.';
                    Image = WorkCenterLoad;

                    trigger OnAction()
                    begin
                        Rec.SetInProgress();
                        CurrPage.Update();
                    end;
                }

                action(SetCompletedAction)
                {
                    Caption = 'Set Completed';
                    ToolTip = 'Sets the assignment status to Completed.';
                    Image = Approve;

                    trigger OnAction()
                    begin
                        Rec.SetCompleted();
                        CurrPage.Update();
                    end;
                }
            }

            action(GetTodosFromAPI)
            {
                Caption = 'Get Todos from API';
                ToolTip = 'Gets todos from JSONPlaceholder API.';
                ApplicationArea = All;
                Image = Refresh;

                trigger OnAction()
                var
                    JsonPlaceholderMgt: Codeunit "JsonPlaceholder Mgt.";
                begin
                    JsonPlaceholderMgt.GetTodos();
                end;

            }
        }

        area(Reporting)
        {
            action(ExportAssignmentsXML)
            {
                Caption = 'Export Assignments to XML';
                ToolTip = 'Exports the assignments to an XML file.';
                ApplicationArea = All;
                Image = Export;

                RunObject = xmlport "Export Assignments";

            }
            action(ExportAssignmentsAzure)

            {
                Caption = 'Export Assignments to Azure';
                ToolTip = 'Exports the assignments to an XML file.';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    AssignmentMgtCodeunit: Codeunit "Assignment Mgt.";
                begin
                    AssignmentMgtCodeunit.ExportAssignmentsToAzure();
                end;


            }

            action(PrintAssignmentsReport)
            {
                Caption = 'Print Assignments Report';
                ToolTip = 'Prints the assignments report.';
                ApplicationArea = All;
                Image = Print;

                RunObject = report "Print Assignments";

            }

            action(QueryAction)
            {
                Caption = 'Run Assignment-Customer Query';
                ToolTip = 'Runs the Assignment-Customer query.';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                var
                    AssignmentMgtCodeunit: Codeunit "Assignment Mgt.";
                begin
                    AssignmentMgtCodeunit.QueryReadFunction();
                end;
            }

        }
    }
}