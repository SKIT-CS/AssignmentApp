query 50200 "AssignmentCustomerQuery"
{
    QueryType = Normal;

    elements
    {
        dataitem(Assignment; Assignment)
        {
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Assignment."Customer No.";

                column(Name; Name)
                {
                }
            }

            column(No; "No.")
            {
            }
            column(Title; Title)
            {
            }
            column(UserId; "User Id")
            {
            }
            column(CategoryCode; "Category Code")
            {
            }
            column(Status; Status)
            {
            }
        }

    }

}