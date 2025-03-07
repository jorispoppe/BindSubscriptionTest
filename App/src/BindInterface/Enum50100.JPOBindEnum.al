enum 50100 "JPO Bind Enum" implements "JPO Bind Interface"
{
    Access = Internal;
    Extensible = false;

    value(0; Bind)
    {
        Caption = 'Bind';
        Implementation = "JPO Bind Interface" = "JPO Bind Impl";
    }
    value(1; DontBind)
    {
        Caption = 'DontBind';
        Implementation = "JPO Bind Interface" = "JPO DontBind Impl";
    }
}