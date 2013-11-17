// NOTE =========================================================================
// Title      :
// ==============================================================================
// License    : MIT
// Author     : Penguin-Works
// Make       : 2013/0
// Finish     : 2013/0
// LastSave   : 2013/0
// ==============================================================================
// Abstruct   :
//
// ==============================================================================
unit FormUnit ;

interface

  uses
    Winapi.Windows ,
    Winapi.Messages ,
    System.SysUtils ,
    System.Variants ,
    System.Classes ,
    Vcl.Graphics ,
    Vcl.Controls ,
    Vcl.Forms ,
    Vcl.Dialogs ,
    Vcl.ExtCtrls ,
    Vcl.ComCtrls ,
    Vcl.GraphUtil ,
    Vcl.StdCtrls ,
    Vcl.ImgList ,
    Vcl.Imaging.pngimage ,
    SolarizedColorUnit ,
    MenuBarPanelUnit ;

  type
    TMainForm = class( TForm )
      statusBarPanel : TPanel ;
      closeImage : TImage ;
      minWindowImage : TImage ;
      maxWindowImage : TImage ;
      iconList : TImageList ;
      menuBarPanel : TPanel ;
      Memo : TRichEdit ;

      procedure FormCreate( Sender : TObject ) ;
      procedure closeImageClick( Sender : TObject ) ;
      procedure minWindowImageClick( Sender : TObject ) ;
      procedure maxWindowImageClick( Sender : TObject ) ;
      procedure menuBarPanelMouseDown( Sender : TObject ; Button : TMouseButton ;
        Shift : TShiftState ; X , Y : Integer ) ;
      procedure menuBarPanelMouseMove( Sender : TObject ; Shift : TShiftState ; X ,
        Y : Integer ) ;
      procedure menuBarPanelMouseUp( Sender : TObject ; Button : TMouseButton ;
        Shift : TShiftState ; X , Y : Integer ) ;
      procedure menuBarPanelMouseLeave( Sender : TObject ) ;

      private
        lengthShowMenuBar : Integer ;
        startPosInForm    : TPoint ;
      public

    end ;

  var
    MainForm : TMainForm ;

implementation

{$R *.dfm}

  // ===========================================================================
  //
  // ===========================================================================

  procedure TMainForm.FormCreate( Sender : TObject ) ;
  begin
    // //---------------------------------------------------------
    // Set num

    lengthShowMenuBar := menuBarPanel.Height * 2 ;
    // //---------------------------------------------------------
    // Create
    solarized      := TSolarised.Create ;
    startPosInForm := Point( - 1 , - 1 ) ;
    // //---------------------------------------------------------
    // Set Size
    closeImage.Width := closeImage.Height ;

    // //---------------------------------------------------------
    // Set Color
    Self.Color           := solarized.base02 ;
    Memo.Color           := Self.Color ;
    Memo.Font.Color      := solarized.base1 ;
    statusBarPanel.Color := solarized.base03 ;
    menuBarPanel.Color   := solarized.base02 ;

    // //-------------------------------------------------------
    // Set icon
    iconList.GetBitmap( 0 , closeImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 1 , maxWindowImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 2 , minWindowImage.Picture.Bitmap ) ;

    // Dont worry , iconList 3 is normal-size icon , when it show maximum window .
    // if You Create Form maximum size , set maxWindowImage num 3 .

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseDown( Sender : TObject ; Button : TMouseButton ;
    Shift : TShiftState ; X , Y : Integer ) ;
  begin

    // Catch Mouse axis for transrate window
    if startPosInForm = Point( - 1 , - 1 ) then begin
      startPosInForm.X := X ;
      startPosInForm.Y := Y ;
    end ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseMove( Sender : TObject ; Shift : TShiftState ;
    X , Y : Integer ) ;
  var
    diffPoint : TPoint ;
  begin
    // Move Window
    if not( startPosInForm = Point( - 1 , - 1 )) then begin
      diffPoint := Point( X - startPosInForm.X , Y - startPosInForm.Y ) ;

      Self.Left := Self.Left + diffPoint.X ;
      Self.Top  := Self.Top + diffPoint.Y ;
    end ;

    // Focus Menu Bar
    if Y < lengthShowMenuBar * 2 then
      menuBarPanel.Color := solarized.base01
    else
      menuBarPanel.Color := solarized.base02 ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseLeave( Sender : TObject ) ;
  begin
    // No focus Menu Bar
    menuBarPanel.Color := solarized.base02 ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseUp( Sender : TObject ; Button : TMouseButton ;
    Shift : TShiftState ; X , Y : Integer ) ;
  begin
    // Reset Mouse Axis
    startPosInForm := Point( - 1 , - 1 ) ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.maxWindowImageClick( Sender : TObject ) ;
  begin
    if Self.WindowState = wsMaximized then begin
      Self.WindowState := wsNormal ;
      iconList.GetBitmap( 1 , maxWindowImage.Picture.Bitmap ) ;
    end
    else begin
      Self.WindowState := wsMaximized ;
      iconList.GetBitmap( 3 , maxWindowImage.Picture.Bitmap ) ;
    end ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.minWindowImageClick( Sender : TObject ) ;
  begin
    Self.WindowState := wsMinimized ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.closeImageClick( Sender : TObject ) ;
  begin
    Self.Close ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
end.
