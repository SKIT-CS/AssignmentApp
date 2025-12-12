codeunit 50203 "Assignment Upgrader"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var

    begin
        UpgradeAssignmentSetupWithNoSeries2();
    end;

    #region UpgradeAssignmentSetupWithNoSeries2
    internal procedure UpgradeAssignmentSetupWithNoSeries2()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        AssignmentSetup: Record "Assignment Setup";
    begin
        if UpgradeTag.HasUpgradeTag(ReturnAssignmentSetupWithNoSeries2UpgradeTag()) then
            exit;

        if not AssignmentSetup.Get() then begin
            AssignmentSetup.Init();
            AssignmentSetup.Insert(true);
        end;
        AssignmentSetup.Get();
        AssignmentSetup."No Series 2" := AssignmentSetup."Assignment Nos.";
        AssignmentSetup.Modify(true);


        UpgradeTag.SetUpgradeTag(ReturnAssignmentSetupWithNoSeries2UpgradeTag());
    end;

    #region ReturnAssignmentSetupWithNoSeries2UpgradeTag
    internal procedure ReturnAssignmentSetupWithNoSeries2UpgradeTag(): Text[250]
    begin
        exit('Prefix-ID-AssignmentSetupWithNoSeries2-20251210');
    end;
    #endregion ReturnAssignmentSetupWithNoSeries2UpgradeTag   
    #endregion UpgradeAssignmentSetupWithNoSeries2

}