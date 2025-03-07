pageextension 50100 "JPO Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(processing)
        {
            action(BindYourOwn)
            {
                ApplicationArea = All;
                Caption = 'Bind Your Own';
                Image = CreateXMLFile;
                ToolTip = 'Bind Your Own.';

                trigger OnAction()
                var
                    JPOBindYourOwn: Codeunit "JPO Bind Your Own";
                begin
                    JPOBindYourOwn.BindYourOwn(Rec, true);
                end;
            }
            action(DontBindYourOwn)
            {
                ApplicationArea = All;
                Caption = 'Don''t Bind Your Own';
                Image = CreateXMLFile;
                ToolTip = 'Don''t Bind Your Own.';

                trigger OnAction()
                var
                    JPOBindYourOwn: Codeunit "JPO Bind Your Own";
                begin
                    JPOBindYourOwn.BindYourOwn(Rec, false);
                end;
            }
            action(BindOtherEvent)
            {
                ApplicationArea = All;
                Caption = 'Bind Other Event';
                Image = CreateXMLFile;
                ToolTip = 'Bind Other Event.';

                trigger OnAction()
                begin
                    Rec.Validate(Blocked, Rec.Blocked::All);
                    Rec.Validate("Post Code", '9200');
                end;
            }
            action(DontBindOtherEvent)
            {
                ApplicationArea = All;
                Caption = 'Don''t Bind Other Event';
                Image = CreateXMLFile;
                ToolTip = 'Don''t Bind Other Event.';

                trigger OnAction()
                begin
                    Rec.Validate(Blocked, Rec.Blocked::" ");
                    Rec.Validate("Post Code", '9200');
                end;
            }
            action(BindEnum)
            {
                ApplicationArea = All;
                Caption = 'Bind Interface by Enum';
                Image = CreateXMLFile;
                ToolTip = 'Bind Interface by Enum.';

                trigger OnAction()
                var
                    JPOBindInterface: Codeunit "JPO Bind Interface";
                begin
                    JPOBindInterface.BindByEnum(Rec, Enum::"JPO Bind Enum"::Bind);
                end;
            }
            action(DontBindEnum)
            {
                ApplicationArea = All;
                Caption = 'Don''t Bind Interface by Enum';
                Image = CreateXMLFile;
                ToolTip = 'Don''t Bind Interface by Enum.';

                trigger OnAction()
                var
                    JPOBindInterface: Codeunit "JPO Bind Interface";
                begin
                    JPOBindInterface.BindByEnum(Rec, Enum::"JPO Bind Enum"::DontBind);
                end;
            }
        }
        addlast(Promoted)
        {
            group(Category_Bind)
            {
                Caption = 'BindSubscription Test';

                actionref(BindYourOwn_Promoted; BindYourOwn) { }
                actionref(DontBindYourOwn_Promoted; DontBindYourOwn) { }
                actionref(BindOtherEvent_Promoted; BindOtherEvent) { }
                actionref(DontBindOtherEvent_Promoted; DontBindOtherEvent) { }
                actionref(BindEnum_Promoted; BindEnum) { }
                actionref(DontBindEnum_Promoted; DontBindEnum) { }
            }
        }
    }
}