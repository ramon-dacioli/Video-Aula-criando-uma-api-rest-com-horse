program sample;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  Horse,
  Horse.GBSwagger,
  System.SysUtils,
  Controller.User in 'src\controllers\Controller.User.pas',
  Models.User in 'src\models\Models.User.pas';

var
  APP: THorse;

begin

  THorse.Use(HorseSwagger);

  Controller.User.Registry;

  Swagger
    .Info
      .Title('Minha API')
      .Description('Documenta��o da minha API')
      .Contact
        .Name('Ramon Luiz')
        .Email('ramon@email.com')
        .URL('https://www.ramon.com.br')
      .&End
    .&End
    .BasePath('v1')
    .Path('users')
      .Tag('Usu�rios')
      .GET('Listar usu�rios')
        .AddParamQuery('id', 'C�digo').&End
        .AddParamQuery('name', 'Nome').&End
        .AddParamQuery('lastName', 'Sobrenome').&End
        .AddResponse(200, 'Lista de usu�rios').Schema(TUser).IsArray(True).&End
      .&End
      .POST('Criar um novo usu�rio')
        .AddParamBody('Dados do usu�rio').Required(True).Schema(TUser).&End
        .AddResponse(201).Schema(TUser).&End
        .AddResponse(400).&End
      .&End
    .&End
    .Path('users/{id}')
      .Tag('Usuarios')
      .GET('Obter os dados de um usu�rios especifico')
        .AddParamPath('id', 'C�digo').&End
        .AddResponse(200, 'Dados do usu�rio').Schema(TUser).&End
        .AddResponse(404).&End
      .&End
      .PUT('Alterar os dados de um usu�rio especifico')
        .AddParamPath('id', 'C�digo').&End
        .AddParamBody('Dados do usu�rio').Required(True).Schema(TUser).&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
      .DELETE('Excluir usu�rio')
        .AddParamPath('id', 'C�digo').&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
    .&End
  .&End;

  THorse.Listen(9000);

end.
