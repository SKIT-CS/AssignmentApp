report 50200 "Print Assignments"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;



    dataset
    {
        dataitem(Assignment; Assignment)
        {
            RequestFilterFields = Status;

            column(No_Assignment; "No.")
            {
            }
            column(Status_Assignment; Status)
            {
            }
            column(Title_Assignment; Title)
            {
            }
            column(UserId_Assignment; "User Id")
            {
            }
            column(CategoryCode_Assignment; "Category Code")
            {
            }

            // trigger OnPreDataItem()
            // begin
            // end;
        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Group)
                {
                    field(StatusFilter; Assignment.Status)
                    {
                        ApplicationArea = All;
                        Caption = 'Assignment Status';
                        ToolTip = 'Filter assignments by their status.';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './src/Exports/Layouts/PrintAssignments.docx';
        }
    }

    var
        StatusFilterVar: Enum "Assignment Status";
}