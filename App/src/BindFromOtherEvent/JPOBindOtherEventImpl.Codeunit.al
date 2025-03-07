codeunit 50102 "JPO Bind Other Event Impl"
{
    Access = Internal;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    internal procedure ToBindOrNotToBind(Customer: Record Customer)
    begin
        if Customer.Blocked = Customer.Blocked::All then
            BindSubscription(this);
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidateVATRegistrationNo, '', false, false)]
    local procedure Customer_OnBeforeValidateVATRegistrationNo(var Customer: Record Customer; xCustomer: Record Customer; FieldNumber: Integer; var IsHandled: Boolean)
    begin
        Message('Bind from other event');
        IsHandled := true;
    end;
}