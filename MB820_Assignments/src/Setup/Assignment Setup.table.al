table 50201 "Assignment Setup"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;

        }

        field(2; "Assignment Nos."; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(3; "No Series 2"; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExists()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert()
        end;
    end;
}