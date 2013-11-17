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
// ToDo       :
// è„èëÇ´ï€ë∂ÇÃé¿ëï
// äJÇ≠ÇÃé¿ëï
// ==============================================================================
unit FormUnit ;

interface

  uses
    Winapi.Windows ,
    Winapi.Messages ,
    System.SysUtils ,
    System.Variants ,
    System.Classes ,
    System.Math ,
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
      iconList : TImageList ;
      menuBarPanel : TPanel ;
      Memo : TRichEdit ;
      OpenDialog : TOpenDialog ;
      SaveDialog : TSaveDialog ;
      closeImage : TImage ;
      newImage : TImage ;
      OpenImage : TImage ;
      SaveImage : TImage ;
      minWindowImage : TImage ;
      maxWindowImage : TImage ;

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
      procedure menuBarPanelDblClick( Sender : TObject ) ;
      procedure statusBarPanelMouseLeave( Sender : TObject ) ;
      procedure OpenImageClick( Sender : TObject ) ;
      procedure SaveImageClick( Sender : TObject ) ;
      procedure statusBarPanelMouseMove( Sender : TObject ; Shift : TShiftState ; X , Y : Integer ) ;
      procedure newImageClick( Sender : TObject ) ;

      private
        lengthShowMenuBar       : Integer ;
        posFormBeforeMaxSize    : TPoint ;
        PosFirstMouseDownInForm : TPoint ;
        isShowMenu              : Boolean ;

        procedure changeMaxWindow ;
        function getPosForm : TPoint ;
        procedure SetPosForm( pos : TPoint ) ;
        procedure SetShowImage( isEnable : Boolean ) ;
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
    solarized               := TSolarised.Create ;
    PosFirstMouseDownInForm := Point( 0 , 0 ) ;
    // //---------------------------------------------------------
    // Set Size
    closeImage.Width     := floor( closeImage.Height * 0.75 ) ;
    minWindowImage.Width := floor( minWindowImage.Height * 0.75 ) ;
    maxWindowImage.Width := floor( maxWindowImage.Height * 0.75 ) ;
    newImage.Width       := floor( newImage.Height * 0.75 ) ;
    SaveImage.Width      := floor( SaveImage.Height * 0.75 ) ;
    OpenImage.Width      := floor( OpenImage.Height * 0.75 ) ;

    // //---------------------------------------------------------
    // Set Color
    Self.Color           := solarized.base03 ;
    Memo.Color           := Self.Color ;
    Memo.Font.Color      := solarized.base1 ;
    statusBarPanel.Color := solarized.base03 ;
    menuBarPanel.Color   := solarized.base03 ;

    // //-------------------------------------------------------
    // Set icon
    iconList.GetBitmap( 0 , closeImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 1 , maxWindowImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 2 , minWindowImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 4 , newImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 5 , SaveImage.Picture.Bitmap ) ;
    iconList.GetBitmap( 6 , OpenImage.Picture.Bitmap ) ;

    // Dont worry , iconList 3 is normal-size icon , when it show maximum window .
    // if You Create Form maximum size , set maxWindowImage num 3 .

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelDblClick( Sender : TObject ) ;
  begin
    changeMaxWindow ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseDown( Sender : TObject ; Button : TMouseButton ;
    Shift : TShiftState ; X , Y : Integer ) ;
  begin
    if not( Self.WindowState = wsMaximized )then begin
      // Catch Mouse axis for transrate window
      if PosFirstMouseDownInForm = Point( 0 , 0 ) then begin
        PosFirstMouseDownInForm.X := X ;
        PosFirstMouseDownInForm.Y := Y ;
      end ;
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

    if not( PosFirstMouseDownInForm = Point( 0 , 0 )) then begin
      diffPoint := Point( X - PosFirstMouseDownInForm.X , Y - PosFirstMouseDownInForm.Y ) ;

      if not ( diffPoint.X = posFormBeforeMaxSize.X * ( - 1 ) )
        and not ( diffPoint.X = posFormBeforeMaxSize.X * ( - 1 ) ) then begin

        Self.Left := Self.Left + diffPoint.X ;
        Self.Top  := Self.Top + diffPoint.Y ;
      end ;

    end ;

    // Focus Menu Bar
    if Y < lengthShowMenuBar * 2 then
      menuBarPanel.Color := solarized.base02
    else
      menuBarPanel.Color := solarized.base03 ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseLeave( Sender : TObject ) ;
  begin
    // No focus Menu Bar
    menuBarPanel.Color := solarized.base03 ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.menuBarPanelMouseUp( Sender : TObject ; Button : TMouseButton ;
    Shift : TShiftState ; X , Y : Integer ) ;
  begin
    // Reset Mouse Axis
    PosFirstMouseDownInForm := Point( 0 , 0 ) ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.maxWindowImageClick( Sender : TObject ) ;
  begin
    changeMaxWindow ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.minWindowImageClick( Sender : TObject ) ;
  begin
    Self.WindowState := wsMinimized ;
  end ;

  procedure TMainForm.newImageClick( Sender : TObject ) ;
  begin
    Memo.Clear ;
  end ;

  procedure TMainForm.OpenImageClick( Sender : TObject ) ;
  begin
    if OpenDialog.Execute then
      Memo.Lines.LoadFromFile( OpenDialog.FileName ) ;
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
  procedure TMainForm.changeMaxWindow ;
  begin
    if Self.WindowState = wsMaximized then begin
      SetPosForm( posFormBeforeMaxSize ) ;
      Self.WindowState := wsNormal ;
      iconList.GetBitmap( 1 , maxWindowImage.Picture.Bitmap ) ;

    end
    else begin
      posFormBeforeMaxSize := getPosForm ;
      Self.WindowState     := wsMaximized ;
      SetPosForm( Point( 0 , 0 )) ;
      iconList.GetBitmap( 3 , maxWindowImage.Picture.Bitmap ) ;
    end ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  function TMainForm.getPosForm : TPoint ;
  begin
    Result.X := Self.Left ;
    Result.Y := Self.Top ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.SaveImageClick( Sender : TObject ) ;
  begin
    if SaveDialog.Execute then
      Memo.Lines.SaveToFile( SaveDialog.FileName ) ;
  end ;

  procedure TMainForm.SetPosForm( pos : TPoint ) ;
  begin
    Self.Left := pos.X ;
    Self.Top  := pos.Y ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================

  procedure TMainForm.statusBarPanelMouseLeave( Sender : TObject ) ;
  begin

    // StatusBarItemPanel.Visible := False ;
    SetShowImage( False ) ;
  end ;

  procedure TMainForm.statusBarPanelMouseMove( Sender : TObject ; Shift : TShiftState ; X , Y : Integer ) ;
  begin
    SetShowImage( True ) ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TMainForm.SetShowImage( isEnable : Boolean ) ;
  begin
    if not( isEnable = isShowMenu ) then begin
      closeImage.Visible     := isEnable ;
      minWindowImage.Visible := isEnable ;
      maxWindowImage.Visible := isEnable ;

      OpenImage.Visible := isEnable ;
      SaveImage.Visible := isEnable ;
      newImage.Visible  := isEnable ;

      isShowMenu := isEnable ;
    end ;
  end ;

end.
