create table tb_usuario(
	cd_usuario int not null auto_increment,
	nm_usuario varchar(45),
	nm_cpf char(11),
	nm_telefone char(11),
	nm_email varchar(45),
	cd_ativo char(1),
	constraint pk_usuario
		primary key(cd_usuario)
);
create table tb_topico(
	cd_topico int not null auto_increment,
	nm_topico varchar(100),
	cd_ordenacao char(5),
	cd_usuario int not null,
	constraint pk_topico
		primary key(cd_topico),
	constraint fk_topico_usuario
		foreign key(cd_usuario)
			references tb_usuario(cd_usuario)
);
create table tb_exibicao_materia(
	cd_exibicao_materia int not null auto_increment,
	nm_exibicao_materia varchar(45),
	constraint pk_exibicao_materia
		primary key (cd_exibicao_materia)
);
create table tb_exibicao_foto_materia(
	cd_exibicao_foto int not null auto_increment,
	nm_exibicao_foto varchar(45),
	constraint pk_exibicao_foto
		primary key(cd_exibicao_foto)
);
create table tb_materia(
	cd_materia int not null auto_increment,
	nm_titulo varchar(100),
	nm_legenda varchar(100),
	ds_texto text,
	dt_cadastrado date,
	cd_ativo char(1),
	cd_usuario int not null,
		constraint pk_materia
			primary key (cd_materia),
		constraint fk_materia_usuario
			foreign key (cd_usuario)
				references tb_usuario(cd_usuario)
);
create table tb_foto_materia(
	cd_foto_materia int not null auto_increment,
	nm_endereco_arquivamento varchar(100),	
	cd_materia int not null,
	cd_usuario int not null,
		constraint pk_foto_materia
			primary key (cd_foto_materia),
		constraint fk_foto_materia_materia
			foreign key (cd_materia)
				references tb_materia(cd_materia),
		constraint fk_foto_materia_usuario
			foreign key (cd_usuario)
				references tb_usuario(cd_usuario)	
);
create table tb_exibicao_foto(
	cd_exibicao_foto int not null auto_increment,
	cd_materia int not null,
	cd_exibicao_foto_materia int not null,
	constraint pk_exibicao_foto
		primary key (cd_exibicao_foto),
	constraint fk_exibicao_foto_materia
		foreign key (cd_materia)
			references tb_materia(cd_materia),
	constraint fk_exibicao_foto_exibicao_foto_materia
		foreign key (cd_exibicao_foto_materia)
			references tb_exibicao_foto_materia(cd_exibicao_foto_materia)
);