codeunit 50105 "JPO Bind Interface"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    internal procedure BindByEnum(Customer: Record Customer; BindEnum: Enum "JPO Bind Enum")
    var
        IBinding: Interface "JPO Bind Interface";
    begin
        IBinding := BindEnum;
        IBinding.SetBinding();
        Customer.Validate("Country/Region Code", 'BE');
    end;
}