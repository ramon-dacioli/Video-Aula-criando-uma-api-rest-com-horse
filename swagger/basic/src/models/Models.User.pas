unit Models.User;

interface

type
  TUser = class
  private
    Fid: Double;
    Fname: String;
    FlastName: String;
    FlastUpdate: TDateTime;
  published
    property id: Double read Fid write Fid;
    property name: String read Fname write Fname;
    property lastName: String read FlastName write FlastName;
    property lastUpdate: TDateTime read FlastUpdate write FlastUpdate;
  end;

implementation

end.
