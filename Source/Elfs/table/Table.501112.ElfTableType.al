// made by Nína Margrét Daðadóttir
table 50112 ElfTableType
{
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {

        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}