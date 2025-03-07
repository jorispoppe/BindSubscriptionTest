codeunit 50101 "JPO Bind Other Event"
{
    Access = Internal;
    // EventSubscriberInstance = StaticAutomatic;
    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidatePostCode, '', false, false)]
    local procedure Customer_OnBeforeValidatePostCode(var Customer: Record Customer; var PostCodeRec: Record "Post Code"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    var
        JPOBindOtherEventImpl: Codeunit "JPO Bind Other Event Impl";
    begin
        JPOBindOtherEventImpl.ToBindOrNotToBind(Customer);
        Customer.Validate("VAT Registration No.", 'BE0123456789');
    end;
}