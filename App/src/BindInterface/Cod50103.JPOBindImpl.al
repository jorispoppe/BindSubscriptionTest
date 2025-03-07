codeunit 50103 "JPO Bind Impl" implements "JPO Bind Interface"
{
    Access = Internal;
    EventSubscriberInstance = Manual;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure SetBinding()
    begin
        BindSubscription(this);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Post Code", OnBeforeCheckClearPostCodeCityCounty, '', false, false)]
    local procedure "Post Code_OnBeforeCheckClearPostCodeCityCounty"(var Sender: Record "Post Code"; var CityTxt: Text; var PostCode: Code[20]; var CountyTxt: Text; var CountryCode: Code[10]; xCountryCode: Code[10]; var IsHandled: Boolean)
    begin
        Message('Bind Enum');
        IsHandled := true;
    end;
}