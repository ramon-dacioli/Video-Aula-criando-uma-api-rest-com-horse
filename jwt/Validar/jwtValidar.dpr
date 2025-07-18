program jwtValidar;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse, Horse.JWT;

begin

  THorse.Use(HorseJWT('key'));

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9001);
end.
