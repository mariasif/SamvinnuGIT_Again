codeunit 50100 CustomerCategoryInstall
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        archivedVersion: Text;
        CustomerCategory: Record "Customer Category";
    begin
        archivedVersion := NavApp.GetArchiveVersion;
        if archivedVersion = '1.0.0.0' then begin
            NavApp.RestoreArchiveData(Database::"Customer Category");
            NavApp.RestoreArchiveData(Database::Customer);

            NavApp.DeleteArchiveData(Database::"Customer Category");
            NavApp.DeleteArchiveData(Database::Customer);
        end;

        if CustomerCategory.IsEmpty() then
            InsertCustomerCategories();

    end;

    procedure InsertCustomerCategories();
    begin
        // Add more default customer categories here if required.
        InsertCustomerCategory('TOP', 'Top Customer');
        InsertCustomerCategory('MEDIUM', 'Standard Customer');
        InsertCustomerCategory('BAD', 'Bad Customer');
    end;

    procedure InsertCustomerCategory(ID: Code[30]; Description: Text[250]);
    var
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.Init();
        CustomerCategory.No := ID;
        CustomerCategory.Description := Description;
        CustomerCategory.Insert();
    end;
}