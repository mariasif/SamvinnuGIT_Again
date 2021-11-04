// made by Nína Margrét Daðadóttir

table 50111 ElfTable
{
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Name of Elf"; Code[70])
        {
            TableRelation = ElfTableType;
            DataClassification = ToBeClassified;
        }
        field(3; "Elfs Age"; Code[30])
        {
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Toy Maker"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Partner of Elf"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}