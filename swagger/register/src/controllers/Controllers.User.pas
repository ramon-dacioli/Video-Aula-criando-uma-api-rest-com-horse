unit Controllers.User;

interface

uses Horse, GBSwagger.Path.Attributes, Models.User, GBSwagger.Validator.Interfaces;

type
  [SwagPath('users', 'Usu�rios')]
  TUserController = class
    private
      FRequest: THorseRequest;
      FResponse: THorseResponse;
    public
      [SwagGET('Listar usu�rios')]
      [SwagParamQuery('id', 'C�digo', False, True)]
      [SwagParamQuery('name', 'Nome')]
      [SwagParamQuery('lastName', 'Sobrenome')]
      [SwagResponse(200, TUser, 'Lista de usu�rios', True)]
      procedure GetUsers;

      [SwagGET('{id}', 'Obter os dados de um usu�rio especifico')]
      [SwagParamPath('id', 'C�digo', True)]
      [SwagResponse(200, TUser, 'Dados do usu�rios')]
      [SwagResponse(400)]
      procedure FindUser;

      [SwagPOST('Criar um novo usu�rio')]
      [SwagParamBody('Dados do usu�rios', TUser)]
      [SwagResponse(201, TUser)]
      [SwagResponse(400)]
      procedure InsertUser;

      [SwagPUT('{id}', 'Alterar os dados de um usu�rio especifico')]
      [SwagParamPath('id', 'C�digo', True)]
      [SwagParamBody('Dados do usu�rios', TUser)]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      procedure UpdateUser;

      [SwagDELETE('{id}', 'Excluir usu�rio')]
      [SwagParamPath('id', 'C�digo', True)]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      procedure DeleteUser;

      constructor Create(Req: THorseRequest; Res: THorseResponse);
      destructor Destroy; override;
  end;

implementation

{ TUserController }

constructor TUserController.Create(Req: THorseRequest; Res: THorseResponse);
begin
  FRequest := Req;
  FResponse := Res;
  FResponse.ContentType('application/json');
end;

procedure TUserController.DeleteUser;
begin
  FResponse.Status(THTTPStatus.NoContent);
end;

destructor TUserController.Destroy;
begin

  inherited;
end;

procedure TUserController.FindUser;
begin
  FResponse.Send('{"id": 1, "name": "ramon", "lastName": "luiz"}');
end;

procedure TUserController.GetUsers;
begin
  FResponse.Send('[{"id": 1, "name": "ramon", "lastName": "luiz"}]');
end;

procedure TUserController.InsertUser;
begin
  FResponse.Send(FRequest.Body).Status(THTTPStatus.Created);
end;

procedure TUserController.UpdateUser;
begin
  FResponse.Status(THTTPStatus.NoContent);
end;

end.
