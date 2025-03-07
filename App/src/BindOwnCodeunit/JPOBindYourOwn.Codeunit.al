codeunit 50100 "JPO Bind Your Own"
{
    Access = Internal;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    internal procedure BindYourOwn(Customer: Record Customer; DoBinding: Boolean)
    begin
        if DoBinding then
            BindSubscription(this);
        Customer.Validate(City, 'Dendermonde');
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidateCity, '', false, false)]
    local procedure Customer_OnBeforeValidateCity(var Customer: Record Customer; var PostCodeRec: Record "Post Code"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    begin
        Message('Bind your own');
        IsHandled := true;
    end;
}