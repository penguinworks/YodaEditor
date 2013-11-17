// NOTE =========================================================================
// Title      : SolarizedColorUnit
// ==============================================================================
// License    : MIT
// Author     : Penguin-Works
// Make       : 2013/11/09
// Finish     : 2013/11/09
// LastSave   : 2013/11/09
// ==============================================================================
// Abstruct   :
// Solarized Color for Delphi
//
// Original Color Code By
// http://ethanschoonover.com/solarized
// ==============================================================================
unit SolarizedColorUnit ;

interface

  uses
    Winapi.Windows ,
    System.SysUtils ,
    System.Classes ,
    System.UITypes ;

  type
    TSolarised = class

      private
        fBase03  : TColor ;
        fBase02  : TColor ;
        fBase01  : TColor ;
        fBase00  : TColor ;
        fBase0   : TColor ;
        fBase1   : TColor ;
        fBase2   : TColor ;
        fBase3   : TColor ;
        fYellow  : TColor ;
        fOrange  : TColor ;
        fRed     : TColor ;
        fMagenta : TColor ;
        fViolet  : TColor ;
        fBlue    : TColor ;
        fCyan    : TColor ;
        fGreen   : TColor ;

      public
        property base03  : TColor read fBase03 ;  // $00362B00 // 背景
        property base02  : TColor read fBase02 ;  // $00423607 // 背景（ハイライト）
        property base01  : TColor read fBase01 ;  // $00756E58 // コメント
        property base00  : TColor read fBase00 ;  // $00837B65
        property base0   : TColor read fBase0 ;   // $00969483 // デフォルトテキスト
        property base1   : TColor read fBase1 ;   // $00A1A193 // 強調
        property base2   : TColor read fBase2 ;   // $00D5E8EE
        property base3   : TColor read fBase3 ;   // $00E3F6FD
        property yellow  : TColor read fYellow ;  // $000089B5
        property orange  : TColor read fOrange ;  // $00164BCB
        property red     : TColor read fRed ;     // $002F32DC
        property magenta : TColor read fMagenta ; // $008236D3
        property violet  : TColor read fViolet ;  // $00C4716C
        property blue    : TColor read fBlue ;    // $00D28B26
        property cyan    : TColor read fCyan ;    // $0098A12A
        property green   : TColor read fGreen ;   // $00009985

        constructor Create ;

    end ;

  var
    solarized : TSolarised ;

implementation

  { TSolarised }

  constructor TSolarised.Create ;
  begin
    fBase03  := RGB( 0 , 43 , 54 ) ;
    fBase02  := RGB( 7 , 54 , 66 ) ;
    fBase01  := RGB( 88 , 110 , 117 ) ;
    fBase00  := RGB( 101 , 123 , 131 ) ;
    fBase0   := RGB( 131 , 148 , 150 ) ;
    fBase1   := RGB( 147 , 161 , 161 ) ;
    fBase2   := RGB( 238 , 232 , 213 ) ;
    fBase3   := RGB( 253 , 246 , 227 ) ;
    fYellow  := RGB( 181 , 137 , 0 ) ;
    fOrange  := RGB( 203 , 75 , 22 ) ;
    fRed     := RGB( 220 , 50 , 47 ) ;
    fMagenta := RGB( 211 , 54 , 130 ) ;
    fViolet  := RGB( 108 , 113 , 196 ) ;
    fBlue    := RGB( 38 , 139 , 210 ) ;
    fCyan    := RGB( 42 , 161 , 152 ) ;
    fGreen   := RGB( 133 , 153 , 0 ) ;
  end ;

end.
