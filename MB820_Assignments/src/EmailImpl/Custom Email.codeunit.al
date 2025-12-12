codeunit 50204 "Custom Email" implements "Email Connector"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure Send(EmailMessage: Codeunit "Email Message"; AccountId: Guid)
    begin

    end;

    procedure GetAccounts(var Accounts: Record "Email Account")
    begin

    end;

    procedure ShowAccountInformation(AccountId: Guid)
    begin

    end;

    procedure RegisterAccount(var EmailAccount: Record "Email Account"): Boolean
    begin

    end;

    procedure DeleteAccount(AccountId: Guid): Boolean
    begin

    end;

    procedure GetLogoAsBase64(): Text
    begin

    end;

    procedure GetDescription(): Text[250]
    begin

    end;
}