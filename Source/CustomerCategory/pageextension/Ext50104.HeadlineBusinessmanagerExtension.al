// Bjarki Már Friðriksson - bjarkif18
pageextension 50104 MyNewBCHeadline extends "Headline RC Business Manager"
{
    layout
    {
        addafter(Control4)
        {
            field(newHeadlineText; newHeadlineText)
            {
                ApplicationArea = all;
                trigger OnDrillDown()
                var
                    Customer: Record Customer;
                    CustomerList: Page "Customer List";
                begin
                    //Show the customers without category assigned
                    Customer.SetRange("Customer Category", '');
                    CustomerList.SetTableView(Customer);
                    CustomerList.Run();
                end;
            }
        }
    }

    var
        newHeadlineText: Text;

    trigger OnOpenPage()
    var
        HeadlineMgt: Codeunit "Headline Management";
        CustomerManagement: Codeunit "Customer Management";
    begin
        //Set Headline text           
        newHeadlineText := 'Number of Customers without assigned Category: ' + HeadlineMgt.Emphasize(Format(CustomerManagement.GetTotalCustomersWithoutCategory()));
    end;

}