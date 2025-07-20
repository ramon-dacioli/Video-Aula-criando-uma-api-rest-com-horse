unit Models.User;

interface

uses GBSwagger.Model.Attributes;

type
  TUser = class
  private
    Fname: String;
    FlastName: String;
    Fid: Int64;
    FlastUpdate: TDateTime;
  public
    [SwagProp('Código', '', True, False)]
    property id: Int64 read Fid write Fid;
    [SwagProp('Nome', '', True, False)]
    property name: String read Fname write Fname;
    [SwagString(100, 3)]
    [SwagProp('Sobrenome', '', True, False)]
    property lastName: String read FlastName write FlastName;
    [SwagIgnore]
    property lastUpdate: TDateTime read FlastUpdate write FlastUpdate;
  end;

implementation

end.
