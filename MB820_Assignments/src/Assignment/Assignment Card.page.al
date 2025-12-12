page 50201 "Assignment Card"
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = Assignment;

    Caption = 'Assignment Card';
    RefreshOnActivate = true;

    AboutTitle = 'Assignment Card Page';
    AboutText = 'This page allows you to view and edit assignment details.';


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number field.', Comment = '%';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';

                    AboutTitle = 'Title Field';
                    AboutText = 'This field contains the title of the assignment.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';

                    AboutTitle = 'Status Field';
                    AboutText = 'This field indicates the current status of the assignment.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';

                    AboutTitle = 'User Id Field';
                    AboutText = 'This field contains the identifier of the user associated with the assignment.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
            }

            group(MetaData)
            {
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
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
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
        }
    }
}