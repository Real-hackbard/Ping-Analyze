object Form1: TForm1
  Left = 1570
  Top = 159
  Width = 943
  Height = 734
  Caption = 'Ping Analyze'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 927
    Height = 654
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Multi Pinger'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 216
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel4: TPanel
          Left = 247
          Top = 0
          Width = 672
          Height = 216
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object ListView1: TListView
            Left = 0
            Top = 0
            Width = 672
            Height = 176
            Align = alClient
            Columns = <
              item
                Caption = 'Host:'
                Width = 113
              end
              item
                Alignment = taCenter
                Caption = 'Status:'
                Width = 47
              end
              item
                Alignment = taCenter
                Caption = 'DNS:'
                Width = 153
              end
              item
                Alignment = taCenter
                Caption = 'IP:'
                Width = 90
              end
              item
                Alignment = taRightJustify
                Caption = 'Time Response (ms)'
                Width = 111
              end
              item
                Caption = 'TTL :'
              end
              item
                Caption = 'Error :'
              end
              item
                Caption = 'Flags :'
              end
              item
                Caption = 'NBS :'
              end
              item
                Caption = 'Buffer :'
              end
              item
                Caption = 'Domain :'
                Width = 90
              end>
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            PopupMenu = PopupMenu1
            SmallImages = ImageList1
            TabOrder = 0
            TabStop = False
            ViewStyle = vsReport
            OnCustomDrawItem = ListView1CustomDrawItem
            OnCustomDrawSubItem = ListView1CustomDrawSubItem
          end
          object Panel5: TPanel
            Left = 0
            Top = 176
            Width = 672
            Height = 40
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              672
              40)
            object Label2: TLabel
              Left = 12
              Top = 12
              Width = 66
              Height = 13
              Caption = 'Timeout (ms) :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 135
              Top = 12
              Width = 100
              Height = 13
              Caption = 'Packet Buffer (byte) :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Left = 296
              Top = 12
              Width = 26
              Height = 13
              Caption = 'NBS :'
            end
            object Label4: TLabel
              Left = 400
              Top = 12
              Width = 24
              Height = 13
              Caption = 'TTL :'
            end
            object Edit1: TEdit
              Left = 80
              Top = 9
              Width = 41
              Height = 19
              TabStop = False
              MaxLength = 4
              TabOrder = 0
              Text = '300'
              OnKeyPress = Edit1KeyPress
            end
            object Edit2: TEdit
              Left = 240
              Top = 9
              Width = 41
              Height = 19
              TabStop = False
              MaxLength = 4
              TabOrder = 1
              Text = '32'
              OnKeyPress = Edit2KeyPress
            end
            object SpinEdit3: TSpinEdit
              Left = 328
              Top = 9
              Width = 57
              Height = 22
              TabStop = False
              Ctl3D = True
              MaxLength = 2
              MaxValue = 90
              MinValue = 0
              ParentCtl3D = False
              TabOrder = 2
              Value = 30
            end
            object SpinEdit4: TSpinEdit
              Left = 432
              Top = 9
              Width = 57
              Height = 22
              TabStop = False
              Ctl3D = True
              MaxLength = 3
              MaxValue = 256
              MinValue = 0
              ParentCtl3D = False
              TabOrder = 3
              Value = 64
            end
            object BitBtn2: TBitBtn
              Left = 504
              Top = 7
              Width = 75
              Height = 27
              Anchors = [akTop, akRight]
              Caption = '  Stop'
              TabOrder = 4
              OnClick = BitBtn2Click
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000330B0000330B000000010000000000000021A5000021
                D6000029E700526BF7005284F700638CF700FF00FF00739CFF0094ADFF009CB5
                FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060000000000000000000000
                0000000000000000060606060001010101010101010101010101010101010101
                00060606000202020202020202020202020202020202020200060606000B0B0A
                0A0A09090707050505040404030303030006060600080B0B0B0B0A0A09090707
                0705050504040404000606060600000000000000000000000000000000000000
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606060606060606
                0606060606060606060606060606060606060606060606060606}
            end
            object BitBtn3: TBitBtn
              Left = 584
              Top = 7
              Width = 75
              Height = 27
              Anchors = [akTop, akRight]
              Caption = '  Ping'
              TabOrder = 5
              OnClick = BitBtn3Click
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000008080
                80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
                00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
                000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
                80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
                000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
                80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
                000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
                00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
                80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
                C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
                00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
                00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
                00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
                00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
                0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
                0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
                000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
                0000000000000000000000000000808080FF000000FF000000FF000000FF0000
                00FF000000FF000000FF00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 247
          Height = 216
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 247
            Height = 157
            TabStop = False
            Align = alClient
            HideSelection = False
            PopupMenu = PopupMenu3
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
            OnChange = Memo1Change
          end
          object Panel11: TPanel
            Left = 0
            Top = 157
            Width = 247
            Height = 59
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label15: TLabel
              Left = 198
              Top = 11
              Width = 6
              Height = 13
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 172
              Top = 11
              Width = 22
              Height = 13
              Caption = 'IPs :'
            end
            object Edit8: TEdit
              Left = 8
              Top = 9
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 0
              Text = '192'
              OnKeyPress = Edit8KeyPress
            end
            object Edit9: TEdit
              Left = 48
              Top = 9
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 1
              Text = '168'
              OnKeyPress = Edit9KeyPress
            end
            object Edit10: TEdit
              Left = 88
              Top = 8
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 2
              Text = '0'
              OnKeyPress = Edit10KeyPress
            end
            object Edit15: TEdit
              Left = 128
              Top = 8
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 3
              Text = '1'
              OnKeyPress = Edit15KeyPress
            end
            object Edit16: TEdit
              Left = 8
              Top = 32
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 4
              Text = '192'
              OnKeyPress = Edit16KeyPress
            end
            object Edit17: TEdit
              Left = 48
              Top = 32
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 5
              Text = '168'
              OnKeyPress = Edit17KeyPress
            end
            object Edit18: TEdit
              Left = 88
              Top = 32
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 6
              Text = '0'
              OnKeyPress = Edit18KeyPress
            end
            object Edit19: TEdit
              Left = 128
              Top = 32
              Width = 33
              Height = 19
              TabStop = False
              MaxLength = 3
              TabOrder = 7
              Text = '10'
              OnKeyPress = Edit19KeyPress
            end
            object BitBtn1: TBitBtn
              Left = 168
              Top = 32
              Width = 65
              Height = 22
              Caption = 'Range'
              TabOrder = 8
              OnClick = BitBtn1Click
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 216
        Width = 919
        Height = 185
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 455
          Height = 185
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            Left = 23
            Top = 13
            Width = 68
            Height = 13
            Caption = 'Start Thread :'
          end
          object Label7: TLabel
            Left = 24
            Top = 37
            Width = 66
            Height = 13
            Caption = 'Stop Thread :'
          end
          object Label5: TLabel
            Left = 37
            Top = 61
            Width = 53
            Height = 13
            Caption = 'Time (ms) :'
          end
          object Label8: TLabel
            Left = 31
            Top = 85
            Width = 59
            Height = 13
            Caption = 'Thread Nr. :'
          end
          object Edit11: TEdit
            Left = 95
            Top = 8
            Width = 90
            Height = 20
            TabStop = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '192.168.1.0'
            OnKeyPress = Edit11KeyPress
          end
          object Edit12: TEdit
            Left = 95
            Top = 32
            Width = 90
            Height = 20
            TabStop = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '192.168.1.10'
            OnKeyPress = Edit12KeyPress
          end
          object Edit13: TEdit
            Left = 95
            Top = 56
            Width = 90
            Height = 20
            TabStop = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '100'
            OnKeyPress = Edit13KeyPress
          end
          object Edit14: TEdit
            Left = 95
            Top = 80
            Width = 90
            Height = 20
            TabStop = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = '2'
            OnKeyPress = Edit14KeyPress
          end
          object Memo2: TMemo
            Left = 192
            Top = 8
            Width = 249
            Height = 161
            TabStop = False
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object BitBtn4: TBitBtn
            Left = 96
            Top = 144
            Width = 89
            Height = 25
            Caption = '   Ping'
            TabOrder = 5
            OnClick = BitBtn4Click
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008080
              80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
              00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
              000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
              80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
              000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
              80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
              000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
              00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
              80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
              C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
              00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
              00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
              00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
              00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
              0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
              0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
              000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
              0000000000000000000000000000808080FF000000FF000000FF000000FF0000
              00FF000000FF000000FF00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
          end
        end
        object Panel9: TPanel
          Left = 455
          Top = 0
          Width = 464
          Height = 185
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            464
            185)
          object Label33: TLabel
            Left = 8
            Top = 152
            Width = 46
            Height = 13
            Caption = 'IP / URL :'
          end
          object Label34: TLabel
            Left = 248
            Top = 152
            Width = 41
            Height = 13
            Caption = 'Counts :'
          end
          object Edit6: TEdit
            Left = 64
            Top = 148
            Width = 169
            Height = 19
            TabStop = False
            TabOrder = 0
            Text = 'www.google.com'
          end
          object SpinEdit1: TSpinEdit
            Left = 296
            Top = 148
            Width = 57
            Height = 22
            TabStop = False
            Ctl3D = True
            MaxValue = 255
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 1
            Value = 15
          end
          object Memo5: TMemo
            Left = 8
            Top = 8
            Width = 447
            Height = 129
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 2
          end
          object BitBtn5: TBitBtn
            Left = 364
            Top = 145
            Width = 89
            Height = 27
            Anchors = [akTop, akRight]
            Caption = '  Tracert'
            TabOrder = 3
            OnClick = BitBtn5Click
            Glyph.Data = {
              76060000424D7606000000000000360400002800000018000000180000000100
              08000000000040020000C30E0000C30E000000010000000000005A737B006384
              9400738C940039739C001084AD00398CAD003194AD005294AD00297BB500188C
              B500398CB500319CB500429CB5004A9CB500087BBD00188CBD00218CBD00299C
              BD00319CBD00399CBD00429CBD00639CBD0039A5BD0042A5BD0084B5BD00ADB5
              BD00087BC600217BC6000884C6002184C6004294C600299CC600319CC60029A5
              C60039A5C6005AA5C60042ADC6006BADC60094BDC600A5BDC600ADBDC6000884
              CE00108CCE00089CCE00189CCE00319CCE0018A5CE0021A5CE0031ADCE0039AD
              CE0042ADCE0052B5CE006BB5CE0073B5CE007BB5CE0084C6CE0094C6CE001073
              D6000884D6001884D600108CD600188CD600298CD600109CD60000A5D60029AD
              D60031B5D60042B5D60052B5D6006BB5D6005ABDD60063BDD60073BDD6007BBD
              D60084BDD60073C6D6007BC6D600107BDE001084DE001884DE0018ADDE0021AD
              DE0018B5DE0021B5DE0029B5DE0039BDDE0063BDDE005AC6DE006BC6DE008CC6
              DE0094C6DE0094CEDE00009CE700089CE70000ADE70008B5E70018BDE70031BD
              E70042BDE70042C6E70073CEE7008CCEE70063D6E700A5D6E700187BEF000894
              EF001094EF0000BDEF0008BDEF0010C6EF0018C6EF0031C6EF0039CEEF0042CE
              EF004ACEEF005AD6EF007BD6EF008CD6EF007BE7EF0084E7EF0094E7EF001873
              F700187BF7001084F7001884F700108CF7001094F7004294F700109CF70008A5
              F70039A5F70021B5F70031B5F70000BDF70000C6F70008C6F70010C6F70021C6
              F70018CEF70021CEF70031CEF70029D6F70042D6F7005ADEF7005AE7F7006BE7
              F70073E7F70084E7F70094E7F700A5E7F70073EFF70084EFF7008CEFF700FF00
              FF001094FF00089CFF00109CFF00189CFF0008A5FF0008ADFF0021ADFF0000B5
              FF0010B5FF0018B5FF0031B5FF0000BDFF0008BDFF0010BDFF0021BDFF0000C6
              FF0010C6FF0031C6FF0000CEFF0008CEFF005ACEFF0010D6FF0021D6FF0031D6
              FF0039D6FF0042D6FF0031DEFF0039DEFF0042DEFF004ADEFF0052DEFF005ADE
              FF006BDEFF004AE7FF0052E7FF0052EFFF0063EFFF0073EFFF007BEFFF0094EF
              FF009CEFFF0073F7FF007BF7FF0084F7FF008CF7FF0094F7FF00A5F7FF00BDF7
              FF008CFFFF0094FFFF009CFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00999999999999
              9999999999999999999999999999999999999999999999999999999999999999
              9999999999999999999999999999999999999999999999999999999999999999
              9999999999999999999999991E081D240D999999999999999999999999999999
              9999991E1B687FCB761E239999999999999999999999999999991E4F686882C5
              CBCB771E239999999999999999999999991E6A7D7C68A7B4BCC5CBCC771E2399
              99999999999999991E80807D7C8085405FB0BBC4CBCB971E239999999999991E
              9F817E7C7DA50B02228687ADB5C4CBCB1E99999999991E859F807E7DA1866265
              7121072EA9878DBEC51E9999991E6BA681807E816C05126B6B575B8B50135086
              6E1E9999992D5D5D818080A65049585222416D860C26626B109999153E4F4D39
              6A80833017416E5318462F1631705F099999993F8181817E3AA0733727620613
              558A3327436B10999999995EA9B3BAAA2984C598938F283842111F6F6D099999
              9999992BAFB1B7871A9DAEC6C6C4C0914B19488B04999999999999228EB6B589
              2A1C4142327697C5BF92B83D03009999999999364478C998B87063843B0E1066
              928EA37E3B0099999999999936346478C8C6BFB9AB832C556088B0A22A019999
              9999999999993649477478C7C6C0738F8DB1B25F059999999999999999999999
              365934477595C294937241149999999999999999999999999999365A67363435
              3525369999999999999999999999999999999999999999999999999999999999
              9999999999999999999999999999999999999999999999999999}
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 401
        Width = 919
        Height = 225
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object Memo6: TMemo
          Left = 0
          Top = 0
          Width = 265
          Height = 162
          TabStop = False
          Align = alLeft
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Chart1: TChart
          Left = 265
          Top = 0
          Width = 654
          Height = 162
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clMoneyGreen
          Gradient.Visible = True
          Title.Text.Strings = (
            'Ping Statistics')
          BottomAxis.Title.Caption = 'DateTime'
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Maximum = 260.000000000000000000
          LeftAxis.Minimum = -10.000000000000000000
          LeftAxis.Title.Caption = 'TTL'
          LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
          LeftAxis.Title.Font.Color = clBlue
          LeftAxis.Title.Font.Height = -11
          LeftAxis.Title.Font.Name = 'Arial'
          LeftAxis.Title.Font.Style = []
          Legend.Alignment = laLeft
          Legend.ColorWidth = 40
          Legend.TopPos = 4
          Legend.Visible = False
          RightAxis.Automatic = False
          RightAxis.AutomaticMinimum = False
          RightAxis.ExactDateTime = False
          RightAxis.Increment = 10.000000000000000000
          RightAxis.Minimum = -2.000000000000000000
          RightAxis.Title.Caption = 'Trip Time'
          RightAxis.Title.Font.Charset = DEFAULT_CHARSET
          RightAxis.Title.Font.Color = clRed
          RightAxis.Title.Font.Height = -11
          RightAxis.Title.Font.Name = 'Arial'
          RightAxis.Title.Font.Style = []
          Align = alClient
          BorderStyle = bsSingle
          PopupMenu = PopupMenu2
          TabOrder = 1
          object Series2: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clBlue
            Title = 'TTL'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X '
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y '
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series3: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Title = 'Trip Time'
            VertAxis = aRightAxis
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X '
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y '
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 162
          Width = 919
          Height = 63
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            919
            63)
          object Label36: TLabel
            Left = 9
            Top = 38
            Width = 46
            Height = 13
            Caption = 'IP / URL :'
          end
          object Label37: TLabel
            Left = 526
            Top = 10
            Width = 69
            Height = 13
            Caption = 'Interval (ms) :'
          end
          object Label38: TLabel
            Left = 664
            Top = 10
            Width = 36
            Height = 13
            Caption = 'Count :'
          end
          object Label10: TLabel
            Left = 416
            Top = 10
            Width = 27
            Height = 13
            Caption = 'Port :'
          end
          object Label11: TLabel
            Left = 286
            Top = 10
            Width = 46
            Height = 13
            Caption = 'Protocol :'
          end
          object Label13: TLabel
            Left = 19
            Top = 10
            Width = 37
            Height = 13
            Caption = 'Buffer :'
          end
          object Label14: TLabel
            Left = 140
            Top = 10
            Width = 69
            Height = 13
            Caption = 'Receive (ms) :'
          end
          object Edit7: TEdit
            Left = 64
            Top = 34
            Width = 689
            Height = 19
            TabStop = False
            TabOrder = 0
            Text = 'www.google.de'
          end
          object ComboBox1: TComboBox
            Left = 600
            Top = 7
            Width = 49
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            DropDownCount = 14
            ItemHeight = 13
            ItemIndex = 11
            ParentCtl3D = False
            TabOrder = 1
            TabStop = False
            Text = '120'
            OnChange = ComboBox1Change
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '10'
              '15'
              '20'
              '30'
              '45'
              '60'
              '120'
              '500'
              '1000')
          end
          object SpinEdit2: TSpinEdit
            Left = 704
            Top = 6
            Width = 49
            Height = 22
            TabStop = False
            Ctl3D = True
            MaxValue = 255
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 2
            Value = 10
          end
          object SpinEdit5: TSpinEdit
            Left = 448
            Top = 6
            Width = 65
            Height = 22
            TabStop = False
            Ctl3D = True
            MaxValue = 65353
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 3
            Value = 20
          end
          object ComboBox2: TComboBox
            Left = 336
            Top = 6
            Width = 65
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            ItemHeight = 13
            ItemIndex = 1
            ParentCtl3D = False
            TabOrder = 4
            TabStop = False
            Text = 'UDP'
            OnChange = ComboBox2Change
            Items.Strings = (
              'TCP'
              'UDP'
              'IPX'
              'NetBEUi'
              'BACNet')
          end
          object SpinEdit7: TSpinEdit
            Left = 64
            Top = 6
            Width = 57
            Height = 22
            TabStop = False
            Ctl3D = True
            MaxValue = 8192
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 5
            Value = 8192
          end
          object SpinEdit8: TSpinEdit
            Left = 216
            Top = 6
            Width = 57
            Height = 22
            TabStop = False
            Ctl3D = True
            MaxValue = 5000
            MinValue = 1
            ParentCtl3D = False
            TabOrder = 6
            Value = 500
          end
          object BitBtn6: TBitBtn
            Left = 764
            Top = 31
            Width = 75
            Height = 27
            Anchors = [akTop, akRight]
            Caption = 'Stop'
            TabOrder = 7
            OnClick = BitBtn6Click
            Glyph.Data = {
              76060000424D7606000000000000360400002800000018000000180000000100
              08000000000040020000330B0000330B000000010000000000000021A5000021
              D6000029E700526BF7005284F700638CF700FF00FF00739CFF0094ADFF009CB5
              FF009CBDFF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060000000000000000000000
              0000000000000000060606060001010101010101010101010101010101010101
              00060606000202020202020202020202020202020202020200060606000B0B0A
              0A0A09090707050505040404030303030006060600080B0B0B0B0A0A09090707
              0705050504040404000606060600000000000000000000000000000000000000
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606060606060606
              0606060606060606060606060606060606060606060606060606}
          end
          object BitBtn7: TBitBtn
            Left = 844
            Top = 31
            Width = 67
            Height = 27
            Anchors = [akTop, akRight]
            Caption = '  Ping'
            TabOrder = 8
            OnClick = BitBtn7Click
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000008080
              80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
              00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
              000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
              80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
              000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
              80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
              000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
              00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
              80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
              C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
              00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
              00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
              00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
              00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
              00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
              0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
              0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
              000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
              00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
              0000000000000000000000000000808080FF000000FF000000FF000000FF0000
              00FF000000FF000000FF00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
          end
          object CheckBox9: TCheckBox
            Left = 768
            Top = 8
            Width = 73
            Height = 17
            TabStop = False
            Caption = 'Export CSV'
            TabOrder = 9
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Options'
      ImageIndex = 4
      DesignSize = (
        919
        626)
      object Bevel1: TBevel
        Left = 8
        Top = 8
        Width = 899
        Height = 610
        Anchors = [akLeft, akTop, akRight, akBottom]
        Shape = bsFrame
      end
      object CheckBox5: TCheckBox
        Left = 32
        Top = 64
        Width = 105
        Height = 17
        TabStop = False
        Caption = 'Stay Window Top'
        TabOrder = 0
        OnClick = CheckBox5Click
      end
      object CheckBox6: TCheckBox
        Left = 32
        Top = 88
        Width = 81
        Height = 17
        TabStop = False
        Caption = 'Tranzparent'
        TabOrder = 1
        OnClick = CheckBox6Click
      end
      object CheckBox7: TCheckBox
        Left = 32
        Top = 112
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Hide on Taskbar'
        TabOrder = 2
        OnClick = CheckBox7Click
      end
      object CheckBox10: TCheckBox
        Left = 32
        Top = 40
        Width = 113
        Height = 17
        TabStop = False
        Caption = 'Use Admin Privilegs'
        TabOrder = 3
        OnClick = CheckBox10Click
      end
      object GroupBox2: TGroupBox
        Left = 24
        Top = 408
        Width = 867
        Height = 202
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Test Ping '
        TabOrder = 4
        DesignSize = (
          867
          202)
        object Label27: TLabel
          Left = 37
          Top = 37
          Width = 31
          Height = 13
          Caption = 'Local :'
        end
        object Label28: TLabel
          Left = 18
          Top = 60
          Width = 50
          Height = 13
          Caption = 'Gateway :'
        end
        object Label29: TLabel
          Left = 8
          Top = 84
          Width = 60
          Height = 13
          Caption = 'External IP :'
        end
        object SpeedButton4: TSpeedButton
          Left = 184
          Top = 31
          Width = 27
          Height = 24
          Hint = 'Ping Test'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
            00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
            000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
            80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
            C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
            00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
            00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
            00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
            0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
            0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
            000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
            0000000000000000000000000000808080FF000000FF000000FF000000FF0000
            00FF000000FF000000FF00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton4Click
        end
        object SpeedButton6: TSpeedButton
          Left = 184
          Top = 79
          Width = 27
          Height = 24
          Hint = 'Ping Test'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
            00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
            000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
            80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
            C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
            00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
            00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
            00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
            0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
            0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
            000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
            0000000000000000000000000000808080FF000000FF000000FF000000FF0000
            00FF000000FF000000FF00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton6Click
        end
        object SpeedButton7: TSpeedButton
          Left = 184
          Top = 55
          Width = 27
          Height = 24
          Hint = 'Ping Test'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008080
            80FF0000000000000000C0C0C0FF000000FF0000000000000000000000000000
            00000000000000000000C0C0C0FF000000FF0000000000000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000000000FF0000
            000000000000C0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0FF8080
            80FF00000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000000000FF0000
            000000000000808080FFFFFFFFFFC0C0C0FFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FF000000FFFFFFFFFF000000FF0000000000000000C0C0C0FF8080
            80FF0000000000000000808080FFFFFFFFFF000000FFC0C0C0FF000000FFC0C0
            C0FF000000FFC0C0C0FFFFFFFFFF000000FF0000000000000000000000FF0000
            00000000000000000000808080FFFFFFFFFFC0C0C0FF000000FFC0C0C0FF0000
            00FFC0C0C0FFFFFFFFFF000000FF000000000000000000000000000000000000
            00FF000000FF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FF000000000000
            00FFC0C0C0FFC0C0C0FF000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FFC0C0C0FF000000FF808080FF808080FF000000FF000000000000
            0000000000FFFFFFFFFF000000FF000000FFC0C0C0FF00000000000000000000
            0000000000FF000000FF000000FFC0C0C0FF808080FF000000FF000000000000
            000000000000000000FFFFFFFFFF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FFFFFFFFFF000000FF000000FF00000000000000000000
            0000000000000000000000000000808080FF000000FF000000FF000000FF0000
            00FF000000FF000000FF00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton7Click
        end
        object Label30: TLabel
          Left = 216
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Test Report :'
        end
        object Label31: TLabel
          Left = 72
          Top = 16
          Width = 45
          Height = 13
          Caption = 'IP Infos :'
        end
        object Label12: TLabel
          Left = 41
          Top = 124
          Width = 27
          Height = 13
          Caption = 'Port :'
        end
        object Label18: TLabel
          Left = 8
          Top = 176
          Width = 16
          Height = 13
          Caption = 'n/a'
        end
        object Edit3: TEdit
          Left = 72
          Top = 33
          Width = 105
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 72
          Top = 57
          Width = 105
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object Edit5: TEdit
          Left = 72
          Top = 81
          Width = 105
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object ListBox1: TListBox
          Left = 216
          Top = 32
          Width = 635
          Height = 162
          TabStop = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          ItemHeight = 13
          TabOrder = 3
        end
        object SpinEdit6: TSpinEdit
          Left = 72
          Top = 120
          Width = 105
          Height = 22
          TabStop = False
          MaxValue = 65353
          MinValue = 1
          TabOrder = 4
          Value = 20
        end
      end
      object CheckBox11: TCheckBox
        Left = 32
        Top = 152
        Width = 129
        Height = 17
        TabStop = False
        Caption = 'Load Host List by start'
        TabOrder = 5
        OnClick = CheckBox11Click
      end
      object CheckBox2: TCheckBox
        Left = 464
        Top = 112
        Width = 41
        Height = 17
        TabStop = False
        Caption = 'Skin'
        TabOrder = 6
      end
      object CheckBox3: TCheckBox
        Left = 32
        Top = 192
        Width = 85
        Height = 17
        TabStop = False
        Caption = 'Save Host list'
        TabOrder = 7
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 464
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Show Ping Statistic'
        TabOrder = 8
        OnClick = CheckBox4Click
      end
      object CheckBox8: TCheckBox
        Left = 464
        Top = 64
        Width = 137
        Height = 17
        Caption = 'Show Ping Range Thread'
        TabOrder = 9
        OnClick = CheckBox8Click
      end
      object RadioGroup1: TRadioGroup
        Left = 464
        Top = 152
        Width = 305
        Height = 65
        Caption = ' Host Range List '
        Columns = 2
        Items.Strings = (
          'Add'
          'Create New')
        TabOrder = 10
        OnClick = RadioGroup1Click
      end
      object CheckBox1: TCheckBox
        Left = 32
        Top = 218
        Width = 118
        Height = 13
        TabStop = False
        Caption = 'Save Thread Report'
        TabOrder = 11
        OnClick = CheckBox1Click
      end
      object CheckBox12: TCheckBox
        Left = 32
        Top = 240
        Width = 121
        Height = 17
        TabStop = False
        Caption = 'Save Tracert Report'
        TabOrder = 12
        OnClick = CheckBox12Click
      end
      object CheckBox13: TCheckBox
        Left = 32
        Top = 264
        Width = 121
        Height = 17
        TabStop = False
        Caption = 'Save Statistic Report'
        TabOrder = 13
        OnClick = CheckBox13Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'About'
      ImageIndex = 5
      object Label9: TLabel
        Left = 40
        Top = 296
        Width = 31
        Height = 13
        Caption = 'Label9'
        Visible = False
      end
      object Label17: TLabel
        Left = 40
        Top = 312
        Width = 8
        Height = 13
        Caption = '..'
        Visible = False
      end
      object Memo3: TMemo
        Left = 40
        Top = 152
        Width = 65
        Height = 33
        TabStop = False
        Lines.Strings = (
          'Memo3')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        Visible = False
      end
      object Memo4: TMemo
        Left = 40
        Top = 192
        Width = 65
        Height = 41
        TabStop = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
      end
      object ListBox2: TListBox
        Left = 40
        Top = 328
        Width = 81
        Height = 33
        TabStop = False
        ItemHeight = 13
        TabOrder = 2
        Visible = False
      end
      object StringGrid1: TStringGrid
        Left = 40
        Top = 89
        Width = 121
        Height = 56
        TabStop = False
        ColCount = 3
        DefaultColWidth = 37
        DefaultRowHeight = 16
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 3
        Visible = False
      end
      object Button1: TButton
        Left = 40
        Top = 240
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 4
        Visible = False
        OnClick = Button1Click
      end
      object WebBrowser1: TWebBrowser
        Left = 41
        Top = 376
        Width = 56
        Height = 25
        TabOrder = 5
        OnDocumentComplete = WebBrowser1DocumentComplete
        ControlData = {
          4C00000022040000950200000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 676
    Width = 927
    Height = 19
    Panels = <
      item
        Style = psOwnerDraw
        Text = ' Total Scanned : 0'
        Width = 130
      end
      item
        Style = psOwnerDraw
        Text = ' Ready'
        Width = 100
      end
      item
        Style = psOwnerDraw
        Text = ' Thread Max : 0'
        Width = 130
      end
      item
        Style = psOwnerDraw
        Text = ' Hosts found : 0'
        Width = 130
      end
      item
        Style = psOwnerDraw
        Text = ' Host Errors : 0'
        Width = 130
      end
      item
        Style = psOwnerDraw
        Width = 160
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object Panel7: TPanel
    Left = 0
    Top = 654
    Width = 927
    Height = 22
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ProgressBar1: TProgressBar
      Left = 0
      Top = 0
      Width = 927
      Height = 22
      Align = alClient
      TabOrder = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 636
    Top = 64
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object DeleteSelected1: TMenuItem
      Caption = 'Delete Selected'
      OnClick = DeleteSelected1Click
    end
    object C2: TMenuItem
      Caption = 'Copy DNS'
      OnClick = C2Click
    end
    object C3: TMenuItem
      Caption = 'Copy IP'
      OnClick = C3Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExportList1: TMenuItem
      Caption = 'Export List'
      OnClick = ExportList1Click
    end
    object ExportSelected1: TMenuItem
      Caption = 'Export Selected'
      OnClick = ExportSelected1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object G1: TMenuItem
      AutoCheck = True
      Caption = 'Grid'
      OnClick = G1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Texdocument (*.TXT)|*.txt'
    Left = 444
    Top = 64
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Textdocument (*.TXT)|*.txt|All files (*.*)|*.*'
    Left = 412
    Top = 64
  end
  object IdIcmpClient1: TIdIcmpClient
    ReceiveTimeout = 300
    OnReply = IdIcmpClient1Reply
    Left = 476
    Top = 64
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 552
    Top = 64
  end
  object IdIcmpClient2: TIdIcmpClient
    OnReply = IdIcmpClient2Reply
    Left = 512
    Top = 64
  end
  object PopupMenu2: TPopupMenu
    Left = 636
    Top = 96
    object View1: TMenuItem
      Caption = 'View'
      object N3D1: TMenuItem
        Caption = '3D'
        Checked = True
        OnClick = N3D1Click
      end
      object N2D1: TMenuItem
        Caption = '2D'
        OnClick = N2D1Click
      end
    end
    object Walls1: TMenuItem
      Caption = 'Walls'
      object N3D2: TMenuItem
        Caption = '3D'
        OnClick = N3D2Click
      end
      object N2D2: TMenuItem
        Caption = '2D'
        OnClick = N2D2Click
      end
    end
    object Monochrome1: TMenuItem
      Caption = 'Monochrome'
      OnClick = Monochrome1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 636
    Top = 128
    object L1: TMenuItem
      Caption = 'Import List'
      OnClick = L1Click
    end
    object C1: TMenuItem
      Caption = 'Clear'
      OnClick = C1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object R1: TMenuItem
      Caption = 'Remove Duplicates'
      OnClick = R1Click
    end
    object R2: TMenuItem
      Caption = 'Remove Empty Lines'
      OnClick = R2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object C4: TMenuItem
      Caption = 'Computers in Network'
      OnClick = C4Click
    end
    object S1: TMenuItem
      Caption = 'Select Network Adapter'
      OnClick = S1Click
    end
  end
  object ImageList1: TImageList
    Left = 594
    Top = 64
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007978770078777600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007D7B7A00EDEDED00F2F2F200DADADA00C1C1C100797978006D6D6C000000
      00000000000000000000000000000000000000000000C7862800E5941E00C396
      5700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000297BB5002184C6004A9CB500000000000000
      0000000000000000000000000000000000000000000000000000000000007F7E
      7D0093939200FFFFFF00F4F4F400E0E0E000D9D9D900936D69007D5551006E65
      630068686700000000000000000000000000E5941E004D4D4D00000000000000
      0000B08F6300B46C1E00BB5F2200B75B2500B3552B00A33C0D004D4D4D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004294C6001884DE00187BEF0039A5F70094FFFF0094FFFF004294
      C6005AA5C600000000000000000000000000000000000000000082818000FFFF
      FF00FFFFFF00FFFFFF00FAFAFA00EAEAEA00E5E5E500966F6B0080504B008050
      4B00B1A4A300BDBDBD00B1B1B10000000000FBA016004D4D4D0000000000C586
      2A00BC583000B64F2A0091634300AF482000B64F2A00C55F4200D36D57007F2B
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001094EF00108CF700187BEF0010BDFF0052E7FF0084F7FF009CFF
      FF0084E7EF005AA5C60000000000000000000000000083838200CECECE00FFFF
      FF00FFFFFF00FFFFFF00FCFCFC00EFEFEF00EAEAEA0097706C0080504B008050
      4B00B5A7A600BFBFBF00BDBDBD0000000000FFB03300B17E3B00C97F1700A33C
      0D00993300009933000037661B00983602009933000099330000AF482000BE58
      39007F2B0A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004294
      C60008ADFF001094F7001884F70000BDFF00319CB50039A5C60000C6F70008CE
      FF0039DEFF0094FFFF0094FFFF000000000000000000C0BFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F4F4F40099736F0080504B008050
      4B00BDB0AF00C9C9C900C4C4C4000000000000000000FFB43C0099330000A43E
      0000B04A0000B44D0100415D030000670000B44D0100AA4300009C3600009C36
      0500AE655500622F190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BD
      F70008ADFF001094F700108CF70000C6F70042BDE70042CEEF0029A5C60018A5
      CE0000C6FF0029D6F70063EFFF004294C60000000000C0BFBF00FFFFFF00FFFF
      FF00F0EFEF00C7C0C000FFFFFF00FEFEFE00FAFAFA009A74700080504B008050
      4B00C1B4B200CECECE00C9C9C9000000000000000000FFBD4C00D06F1C00BA54
      0000C5600000CC660000007B00000176000045760000C25B0000B44D0100A43E
      000071663800A1501C004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000319CCE00089C
      E70008A5F700109CF70008BDFF007BBDD6006BC6DE0039A5C60029ADD60000C6
      F700429CB50042BDE70000BDEF000000000000000000C0BFBF00F0EFEF004128
      280077484800764646004B2D2D00FEFEFE00FEFEFE00FAFAFA00E5DEDD00AC8F
      8B00CFC5C400D8D8D800D3D3D3000000000000000000E4923000FDC26B00CC66
      0000D8720000E07A0000008600002E840000D8720000D16A0000376C00002462
      010037661B00716638004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000298CD6001884DE001073
      D6001094EF0021B5F70031ADCE0029ADD60018C6EF0084B5BD005ABDD60039A5
      BD0039ADCE0008B5E700188CB5000000000000000000C0BFBF004E393900A066
      6600EA979700AC6767007646460079696900FEFEFE00FEFEFE00FAFAFA00EEEE
      EE00E9E9E900DEDEDE00D8D8D8005541410000000000C25B0000FFCB7E00F6B8
      64003B9401007498050074980500F48F0000EC860000B07F0000007B0000016F
      000008660400635719004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000C6FF0042D6FF0010C6
      FF000884CE0084F7FF008CEFF7005ADEF700ADBDC60031B5D600299CBD0031C6
      EF0010C6EF0000000000000000000000000000000000A6707000F7ADAD00EE9E
      9E00EA979700E1888800DD8081007646460044292900FEFEFE00FEFEFE00FAFA
      FA00F3F3F300554141003E2626000000000000000000D16A0000E08B1B00FDD5
      960028B134001DB33400FFAA2600FFA41800FF990100F48F0000748900002C78
      000085630000236309004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010D6FF0031D6FF0008C6
      F700087BC6005ACEFF008CF7FF007BF7FF007BEFFF0073C6D600ADB5BD0021CE
      F7001084AD0000000000000000000000000000000000FBB6B600F7ADAD00EE9E
      9E00EA979700E1888800DD808100A55A5A007646460079696900FEFEFE00FEFE
      FE00DDD9D900412828007A4D4D000000000000000000EC860000E7810000ADCF
      8000FFE0B20058CE690039CD6900FED87E00FFB43C00FF990100EC8600001081
      0000016F0000246201004D4D4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052B5D60094E7EF008CEF
      F70052DEFF0042C6E70031B5F700087BBD00218CBD0073E7F70042D6F7001094
      F7001884D600000000000000000000000000000000007A4D4D00D7939500EE9E
      9E00EA979700E1888800DD808100D5727300D06B6B0076464600442929003723
      23004E2E2E0000000000000000000000000000000000E19624005BA31D002BC3
      5300EFE5BC00FFEED50063DA8200FFFDC800FFCB7400FBA01600F48F00004A85
      0000826C00008F6C110000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BB5CE006BB5CE0094E7
      EF00A5F7FF0073EFFF005ADEFF0021B5F700189CCE0018BDE70010C6F70010B5
      FF00108CCE0000000000000000000000000000000000000000007A4D4D00EE9E
      9E00EA979700E1888800DD808100E2818200D36C6C009E4E4E0076464600502F
      2F007A4D4D00000000000000000000000000000000000000000063B8410033CB
      640063DA8200ECF5DC00FCFBEE00FFFDC80039CD6900ADAD2700D6960500E07A
      0000108100004D4D4D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007BB5CE006BB5CE0063BDD600A5E7F7009CEFFF0084E7F7004ACEEF00429C
      BD00000000000000000000000000000000000000000000000000000000007A4D
      4D00E0909000E1888800DD808100FFADAF00FF818200B45959007A4D4D000000
      000000000000000000000000000000000000000000000000000000000000E29C
      0800A5C55800FED87E00EAF1BF00FFFCF90039CD69001EB73C00EC860000E07A
      0000B8925D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007BB5CE0094C6DE007BB5CE006BB5CE0073B5CE006BADC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007A4D4D00E1888800DD808100FFADAF00FF8182007A4D4D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBA01600E4B33300AECE6A0058CE6900EDE0AE007BBC4B00FBA01600B08F
      63000000000000000000C3A77E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A4D4D007A4D4D007A4D4D007A4D4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0A85400E2A23F00DBAC6600DBAC660000000000C4A4
      8000B9AFA500C2AA8C00C3A77E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD8C
      8C00B5949400AD949400A5848400AD8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEADAD00DEDEDE00BD9C
      9C00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00A584
      84009C7B7B003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C6C600DEDEDE00DED6
      D600DED6D600CEB5B500D6C6C600BD9C9C00BD9494009C6B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEADAD00CEAD
      AD00C6A5A500C6A5A500C69C9C00C69C9C00BD9C9C00BD9C9C00B59494009C7B
      84008C637300000000000000000000000000000000006B84EF001831B5001029
      AD001031AD001029AD001031AD000831AD000029B5000829AD000829B5000021
      AD000831AD00000000000000000000000000B5847300E7E7E700E7E7E700DEDE
      DE00DED6D600D6BDBD00D6C6C600C6B5B500BD9494008C5A5A00000000000000
      0000000000000000000000000000000000000000000052ADFF00006BCE000063
      BD000063BD000063BD000063BD000063B5000063B5000063B5000063BD00005A
      AD000063B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000831D6002142DE003152
      E7003152E7003152E7003152E7002952E7002152EF00104AEF001042EF000031
      E7000029DE0000000000000000000000000000000000EFEFEF00F7F7F700E7E7
      E700DEDEDE00D6ADAD00CE949400C68C8C00BD8C8C00A5736B00AD7B7300C6A5
      A500A59494008C5A5200000000000000000000000000007BDE00008CFF001894
      FF001894FF001894FF001894FF001094FF001094FF00008CFF00008CFF00007B
      E700007BDE00000000000000000000000000CEADAD00CEADAD00CEADAD00CEAD
      AD00CEADAD00B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B584840000000000000000001039DE00294ADE00395A
      EF00395AEF00395AEF00395AEF00295AE700295AE7001852EF00104AEF000839
      EF000031DE0000000000000000000000000000000000B5847300DEBDBD00E7E7
      E700DEDEDE00CEA5A500CE7B7B00CE7B7B00BD8C8400B5848C00CEADAD00CEAD
      AD00ADA5A5009C8484007B4A520000000000000000000084EF00088CFF00299C
      FF00ADDEFF00ADDEFF00ADDEFF00ADDEFF00ADDEFF00088CFF00008CFF000084
      F700007BDE00000000000000000000000000CEADAD008C6363008C6363008C63
      63008C6363008C6363008C6363008C6363008C6363008C6363008C6363008C63
      63008C636300DEDEDE00B584840000000000000000002142DE00395AE7004A63
      E7004A63E7004A63E7004263E7003163E7002963E7002152E700184AE7001042
      EF000839DE00000000000000000000000000000000009C949400CE8C7B00FFB5
      3900F7BD8400C6737300C65A5A00B55A5A00CEADAD00D6BDBD00CEA5A500C694
      94009C737300AD9494009CBD9C00A5737300000000000084EF00219CFF0031A5
      FF00FFFFFF00FFFFFF00ADDEFF001894FF00FFFFFF00ADDEFF00008CFF00008C
      FF00007BE700000000000000000000000000CEADAD00FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE6300FFCE
      6300FFCE6300FFCE6300B58484000000000000000000214ADE003963EF00526B
      E700526BE7004A6BE7004A6BE7003163E700315AE7002152E700184AE700104A
      EF001042DE00000000000000000000000000000000009C949400D6946B00FFB5
      3900FFB53900F7B56300DEA58400B5636300CEA5A500CEA5A500D6ADAD00CEAD
      AD00AD8C8C009C737300A57B7B00A5737300000000001894FF00299CFF0039A5
      FF00FFFFFF00ADDEFF0031A5FF001894FF001894FF00ADDEFF00008CFF00008C
      FF000084EF00000000000000000000000000CEADAD00FFCE6300FFCE6B00FFD6
      6B00FFD67300FFD67300FFD67300FFD67300FFD67300FFD67300FFD67300FFCE
      6B00FFCE6B00FFCE6300B584840000000000000000003152E700526BEF00526B
      E7008494EF008494EF008494EF008494EF008494EF008494EF008494EF00214A
      EF00184ADE00000000000000000000000000000000009C949400E7A55200FFC6
      5A00FFC65A00FFBD4A00FFBD4A00FFC65200FFC65200D6847B00D6B5B500CEA5
      A500AD7B7B00C6949400B5848400A57B7300000000001894FF0042ADFF0042AD
      FF00FFFFFF00FFFFFF00FFFFFF001894FF001094FF00088CFF0031A5FF001094
      FF000084F700000000000000000000000000CEADAD00FFCE6300FFD67300FFD6
      7B00FFD67B00FFDE8400FFDE8400FFDE8400FFDE8400FFD67B00FFD67B00FFD6
      7300FFD67300FFCE6300CEADAD000000000000000000425AEF005273E7008494
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00214A
      E700214ADE00000000000000000000000000000000009C949400F7B55200FFC6
      5200FFC65A00FFC65A00FFC65A00FFC65200FFC65200D68C7B00D6B5B500CEA5
      A500AD7B7B00CE949400BD8C8C00A57B73000000000031A5FF0039A5FF0042AD
      FF0042ADFF0031A5FF0031A5FF001894FF001894FF001094FF001094FF00088C
      FF00008CFF00000000000000000000000000CEADAD00FFDE8400FFDE8400FFDE
      8400FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE8C00FFDE
      8C00FFDE8400FFCE6300CEADAD0000000000000000004A63E7006B7BE700637B
      E7005A73E7004A63E700425AEF003152E7002952E700214AE700214AE7002952
      E700294ADE0000000000000000000000000000000000CEA58C00FFCE6300FFD6
      7300FFD67B00FFD67B00FFD67B00FFCE6B00FFCE6300CE949400D6BDBD00CE9C
      9C00AD7B7B00AD7B7B00B5848400A57373000000000031A5FF0052ADFF004AAD
      FF00FFFFFF0031A5FF0031A5FF00ADDEFF00FFFFFF00FFFFFF00088CFF001094
      FF00088CFF00000000000000000000000000CEADAD00FFDE8400FFDE8400FFDE
      8C00FFE79400FFE79400FFE79400FFE79C00FFE79400FFE79400FFDE8C00FFDE
      8400FFDE8C00FFDE8400CEADAD0000000000000000004A63E7006B84EF00637B
      EF006373E7004A63E7004A63EF00395AE7003152E7002952DE00294AE7002952
      E700294AD60000000000000000000000000000000000D6AD7B00FFCE6B00FFDE
      8400FFDE8C00FFDE8C00FFDE8C00FFD67B00FFD67300CE9C9C00D6BDBD00CE94
      9400AD737300CE949400BD8C8C00A57373000000000031A5FF005AB5FF0052AD
      FF00ADDEFF0031A5FF0039A5FF00219CFF00ADDEFF00FFFFFF001094FF001094
      FF00008CFF00000000000000000000000000CEADAD00FFDE8400FFDE8C00FFE7
      9C00FFE79C00FFEFA500FFEFA500FFEFA500FFEFA500FFE79C00FFE79C00FFE7
      9400FFDE8C00FFDE8400CEADAD0000000000000000005A73E7008C9CEF00738C
      EF006B84EF006373E7005A73E7004A6BE7004A63E7004263EF00425ADE003152
      E700294AD60000000000000000000000000000000000EFCE7B00FFDE8400FFE7
      9C00FFEFA500FFEFAD00FFEFA500FFE79400FFDE8400D6ADAD00D6BDBD00D6A5
      A500C6737300C6737300BD6B6B00A57373000000000042ADFF007BC6FF0063B5
      FF005AB5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00219CFF001894
      FF00008CFF00000000000000000000000000CEADAD00FFDE8400FFDE8C00FFEF
      A500FFEFA500FFEFAD00FFEFAD00FFEFAD00FFEFAD00FFEFA500FFEFA500FFE7
      9C00FFE79400FFDE8400CEADAD000000000000000000637BE7009CADEF008494
      EF00738CEF006B7BEF006B7BE700637BE7006373E700526BE7004A6BE7003952
      E700294ADE0000000000000000000000000000000000EFCE8400FFDE8C00FFEF
      A500FFF7B500FFF7BD00FFF7B500FFE79C00FFDE8C00DEC6C600EFE7E700F7EF
      EF00EFE7E700D6949400CE737300A57B7300000000004AADFF008CCEFF0073C6
      FF0063B5FF00ADDEFF00ADDEFF00ADDEFF00ADDEFF00ADDEFF0031A5FF00219C
      FF00088CFF00000000000000000000000000CEADAD00FFD67B00FFEFA500FFEF
      AD00FFF7B500FFF7BD00FFF7BD00FFF7BD00FFF7BD00FFF7B500FFEFAD00FFEF
      A500FFE79C00FFD67B00CEADAD0000000000000000006B84EF006B84EF00526B
      E7004A6BE700425AE7004263E700425AEF00395AE7003152E7003152E7002142
      DE00214ACE00000000000000000000000000000000000000000000000000AD8C
      8C00A58C8C00B59C9400CEB59C00EFDEA500F7D69400B5847300B5847300B584
      7300B5847300B58473000000000000000000000000005AB5FF005AB5FF0039A5
      FF0031A5FF00299CFF00299CFF0031A5FF00219CFF001894FF001894FF000084
      EF000084EF00000000000000000000000000CEADAD00FFEFA500FFF7BD00FFF7
      BD00FFF7BD00FFFFC600FFFFC600FFFFC600FFFFC600FFF7BD00FFF7BD00FFF7
      B500FFF7B500FFEFA500CEADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD8C8C00AD8C8C00AD848400AD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEADAD00CEADAD00CEAD
      AD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEADAD00CEAD
      AD00CEADAD00CEADAD00CEADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF9FFFFFF0000FFFFF01F87FF0000
      FE3FE007301F0000F807C001200F0000F803800100070000E001800180030000
      E000800180010000C00180018001000080018000800100008007800180010000
      800780018001000080078007800300008007C007C0030000F00FE01FE0070000
      F81FF03FF00D0000FFFFF87FFC210000FFFFFFFFE0FFFFFF8003FFFF803FFFFF
      C0078007003F8007800180078003800700018007800180070001800780008007
      0001800780008007000180078000800700018007800080070001800780008007
      00018007800080070001800780008007000180078000800700018007E0038007
      0001FFFFF87FFFFF8001FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
