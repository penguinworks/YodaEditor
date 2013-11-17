unit NinjaPanelUnit ;

interface

  uses
    Vcl.ExtCtrls ,
    Vcl.Controls ,
    System.Types ,
    System.Classes ,
    Vcl.Graphics ;

  type
    TNinjaPanel = class( TPanel )
      public
        constructor Create( aOwner : TComponent ) ;

      protected
        procedure fOnMouseDown( Sender : TObject ; Button : TMouseButton ; Shift : TShiftState ; X , Y : Integer ) ;
        procedure fOnMouseMove( Sender : TObject ; Shift : TShiftState ; X , Y : Integer ) ;
        procedure fOnMouseLeave( Sender : TObject ) ;
        procedure fOnMouseUp( Sender : TObject ; Button : TMouseButton ; Shift : TShiftState ; X , Y : Integer ) ;

      private

        startPosInOwner : TPoint ;
        fFocusColor     : TColor ;
        fColor          : TColor ;
        fPointMoved     : TPoint ;
        procedure setFocusColor( aFocusColor : TColor ) ;
        function getFocusColor : TColor ;

      published
        property focusColor    : TColor read getFocusColor write setFocusColor ;
        property distancePoint : TPoint read fPointMoved ;
    end ;

implementation

  uses
    System.SysUtils ,
    Vcl.Forms ;

  { TNinjaPanel }
  // ===========================================================================
  //
  // ===========================================================================
  constructor TNinjaPanel.Create( aOwner : TComponent ) ;
  begin

    inherited Create( aOwner ) ;

    focusColor := Self.Color ;

    startPosInOwner   := Point( 0 , 0 ) ;
    Self.OnMouseDown  := fOnMouseDown ;
    Self.OnMouseMove  := fOnMouseMove ;
    Self.OnMouseLeave := fOnMouseLeave ;
    Self.OnMouseUp    := fOnMouseUp ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TNinjaPanel.fOnMouseDown( Sender : TObject ; Button : TMouseButton ; Shift : TShiftState ; X , Y : Integer ) ;
  begin
    if startPosInOwner = Point( 0 , 0 ) then begin
      startPosInOwner.X := X ;
      startPosInOwner.Y := Y ;
    end ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TNinjaPanel.fOnMouseMove( Sender : TObject ; Shift : TShiftState ; X , Y : Integer ) ;
  begin

    if not( startPosInOwner = Point( 0 , 0 )) then begin
      fPointMoved := Point( X - startPosInOwner.X , Y - startPosInOwner.Y ) ;
    end ;

    fColor     := Self.Color ;
    Self.Color := focusColor ;

  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TNinjaPanel.fOnMouseLeave( Sender : TObject ) ;
  begin
    Self.Color := fColor ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TNinjaPanel.fOnMouseUp( Sender : TObject ; Button : TMouseButton ; Shift : TShiftState ; X , Y : Integer ) ;
  begin
    startPosInOwner := Point( 0 , 0 ) ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  function TNinjaPanel.getFocusColor : TColor ;
  begin
    Result := fFocusColor ;
  end ;

  // ===========================================================================
  //
  // ===========================================================================
  procedure TNinjaPanel.setFocusColor( aFocusColor : TColor ) ;
  begin
    fFocusColor := aFocusColor ;
  end ;

end.
