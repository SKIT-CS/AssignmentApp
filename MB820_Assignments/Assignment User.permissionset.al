namespace AssignmentPerms;

permissionset 50200 "Assignment User"
{
    Assignable = true;
    Permissions = tabledata Assignment = RIMD,
        tabledata "Assignment Act. Cue" = RIMD,
        tabledata "Assignment Setup" = R,
        table Assignment = X,
        table "Assignment Act. Cue" = X,
        table "Assignment Setup" = X,
        page "Assignment Activities" = X,
        page "Assignment Card" = X,
        page "Assignment List" = X,
        page "Assignment RC" = X,
        report "Print Assignments" = X,
        codeunit "Assignment Installer" = X,
        codeunit "Assignment Mgt." = X,
        codeunit "Assignment Upgrader" = X,
        xmlport "Export Assignments" = X,
        query AssignmentCustomerQuery = X;
}