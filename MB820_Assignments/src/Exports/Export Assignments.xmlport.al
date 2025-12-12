xmlport 50200 "Export Assignments"
{

    schema
    {
        textelement(Root)
        {
            tableelement(Assignment; Assignment)
            {

                fieldattribute(No; Assignment."No.")
                {

                }
                fieldattribute(Title; Assignment.Title)
                {

                }
                fieldattribute(Status; Assignment.Status)
                {

                }
                fieldattribute(User; Assignment."User Id")
                {

                }
                fieldattribute(Category; Assignment."Category Code")
                {

                }
            }
        }
    }

}