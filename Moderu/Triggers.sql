go
create trigger valAreaEsport on Area_Esportiva
for insert, update
as
	declare @id int
	declare @nome varchar(100)
	declare @descricao varchar(500)
	select @id = id, @descricao = descricao, @nome = nome from inserted
	
	set @nome = ltrim(@nome)
	set @descricao = Ltrim(@descricao)

	set @nome = (select stuff((
       select ' '+upper(left(T3.V, 1))+lower(stuff(T3.V, 1, 1, ''))
       from (select cast(replace((select @nome as '*' for xml path('')), ' ', '<X/>') as xml).query('.')) as T1(X)
         cross apply T1.X.nodes('text()') as T2(X)
         cross apply (select T2.X.value('.', 'varchar(100)')) as T3(V)
       for xml path(''), type
       ).value('text()[1]', 'varchar(100)'), 1, 1, '') as [Capitalize first letter only])

	update Area_Esportiva set descricao = @descricao where id = @id
	update Area_Esportiva set nome = @nome where id = @id

	select @descricao = descricao, @nome = nome from Area_Esportiva where @id=id

	if(@nome='' or @nome = ' ' or @nome = null)
	begin
		rollback transaction
		raiserror('Campo de nome vazio, por favor preenche-lo',0,0)
	end

	if  ((select COUNT(*) from Area_Esportiva where nome = @nome and id <> @id)>0)
	begin
		rollback transaction
		raiserror('Área já existente',0,0)
	end
go
create trigger valAtividadeEsportiva atividadeEsportiva
for insert, update
as
	declare @id int
	declare @nome varchar(75)

	select @id = id, @nome = nome from inserted

	set @nome = LTRIM(@nome)
	
	set @nome = (select stuff((
       select ' '+upper(left(T3.V, 1))+lower(stuff(T3.V, 1, 1, ''))
       from (select cast(replace((select @nome as '*' for xml path('')), ' ', '<X/>') as xml).query('.')) as T1(X)
         cross apply T1.X.nodes('text()') as T2(X)
         cross apply (select T2.X.value('.', 'varchar(75)')) as T3(V)
       for xml path(''), type
       ).value('text()[1]', 'varchar(75)'), 1, 1, '') as [Capitalize first letter only])
	
	update atividadeEsportiva set nome = @nome where id = @id
	
	select @nome = nome from atividadeEsportiva where @id=id
	
	if(@nome='' or @nome = ' ' or @nome = null)
	begin
		rollback transaction
		raiserror('Campo de nome vazio, por favor preenche-lo',0,0)
	end

	if  ((select COUNT(*) from atividadeEsportiva where nome = @nome and id <> @id)>0)
	begin
		rollback transaction
		raiserror('Atividade já existente',0,0)
	end
go
create trigger valUsuario Usuario
for insert, update
as
	declare @id int
	declare @senha varchar(30)
	declare @t_usuario int
	declare @nome varchar(150)
	declare @foto varchar(500)
	declare @email varchar(500)
	declare @telefone varchar(500)
	
	select @id = id, @senha = senha, @t_usuario = tipo_usuario, @nome = nome, @foto = foto, @email = email, @telefone = telefones from inserted
	
	
	set @nome = (select stuff((
       select ' '+upper(left(T3.V, 1))+lower(stuff(T3.V, 1, 1, ''))
       from (select cast(replace((select @nome as '*' for xml path('')), ' ', '<X/>') as xml).query('.')) as T1(X)
         cross apply T1.X.nodes('text()') as T2(X)
         cross apply (select T2.X.value('.', 'varchar(150)')) as T3(V)
       for xml path(''), type
       ).value('text()[1]', 'varchar(150)'), 1, 1, '') as [Capitalize first letter only])
	
	
	
	update Usuario set nome = ltrim(@nome) where id = @id

	if(len(@senha)<8)
	begin
		rollback transaction
		raiserror('Senha curta, por favor colocar uma com pelo menos 8 caracteres',0,0)
	end
	--select @descricao = descricao from inserted
	
	if(@nome='' or @nome = ' ')
	begin
		rollback transaction
		raiserror('Campo de nome vazio, por favor preenche-lo',0,0)
	end

	if @email not like '[a-z,0-9,_,-]%@[a-z,0-9,_,-]%.[a-z][a-z]%'
	begin
		rollback transaction
		raiserror('Email invalido, por favor colocar um valido',0,0)
	end

	if exists (select id from Usuario where email = @email and id <> @id)
	begin
		rollback transaction
		raiserror('Email já cadastrado',0,0)
	end
go
create trigger valHorarioSoli on horario_Solicitado
for insert, update
as
	declare @id int
	declare @dia_semana int
	declare @hora_inicio datetime
	declare @hora_fim datetime
	declare @id_SolicitacaoReserva int
	
	select @id = id, @dia_semana = dia_semana, @hora_inicio = hora_inicio, @hora_fim = hora_fim, @id_SolicitacaoReserva = id_SolicitacaoReserva from inserted
	
	declare @hora_inicio2 smalldatetime = @hora_inicio
	declare @hora_fim2 smalldatetime = @hora_fim

	declare @date_i date = @hora_inicio2
	declare @date_f date = @hora_fim2

	declare @time_i time = @hora_inicio2
	declare @time_f time = @hora_fim2

	if(@time_f<=@time_i)
	begin
		rollback transaction
		raiserror('Horario improprio, coloque uma maior diferença de tempo',0,0)
	end
	
	if(@date_i>@date_f or @date_i<CONVERT(date, GETDATE()) or @date_f<CONVERT(date, GETDATE()))
	begin
		rollback transaction
		raiserror('Horario improprio, coloque uma data maior ou igual que a atual',0,0)
	end
		
	if @dia_semana not like '[1-7]'
	begin
		rollback transaction
		raiserror('Dia inválido, por favor colocar um valor válido',0,0)
	end
go
create trigger valHorarioDispo on horario_Disponivel
for insert, update
as
	declare @id int
	declare @dia_semana int
	declare @hora_inicio datetime
	declare @hora_fim datetime
	
	
	select @id = id, @dia_semana = dia_semana, @hora_inicio = hora_inicio, @hora_fim = hora_fim from inserted
	
	declare @hora_inicio2 smalldatetime = @hora_inicio
	declare @hora_fim2 smalldatetime = @hora_fim

	declare @date_i date = @hora_inicio2
	declare @date_f date = @hora_fim2

	declare @time_i time = @hora_inicio2
	declare @time_f time = @hora_fim2

	if(@time_f<=@time_i)
	begin
		rollback transaction
		raiserror('Horario improprio, coloque uma maior diferença de tempo',0,0)
	end
	
	if(@date_i>@date_f or @date_i<CONVERT(date, GETDATE()) or @date_f<CONVERT(date, GETDATE()))
	begin
		rollback transaction
		raiserror('Horario improprio, coloque uma data maior ou igual que a atual',0,0)
	end
		
	if @dia_semana not like '[1-7]'
	begin
		rollback transaction
		raiserror('Dia inválido, por favor colocar um valor válido',0,0)
	end
	