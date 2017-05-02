CREATE TABLE public.menu
(
    id integer NOT NULL,
    text character varying(255) NOT NULL,
    action character varying(255) NOT NULL,
    controller character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    icon character varying(150) NOT NULL,
    PRIMARY KEY (id)
)


CREATE TABLE IF NOT EXISTS ofrecido (
  id_ofrecimiento int NOT NULL,
  id_viaje int NOT NULL,
  id_transportista int NOT NULL,
  oferta_activa bit NOT NULL
)


CREATE TABLE IF NOT EXISTS role (
  id int NOT NULL,
  name character varying(250) NOT NULL,
  slug character varying(50) NOT NULL,
  PRIMARY KEY (id)
)


INSERT INTO role (id, name, slug) VALUES
(1, 'Invitado', 'guest'),
(2, 'Administrador', 'admin'),
(3, 'O.N.G.', 'ong'),
(4, 'Transportista', 'transportista'),
(5, 'Usuario', 'user');



CREATE TABLE IF NOT EXISTS role_menu (
  id_role int NOT NULL,
  id_menu int NOT NULL,
  PRIMARY KEY (id_role,id_menu)
)


INSERT INTO role_menu (id_role, id_menu) VALUES
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(3, 5),
(4, 3),
(4, 4),
(4, 5);


CREATE TABLE IF NOT EXISTS users (
  id int NOT NULL ,
  name character varying(100) NOT NULL,
  email character varying(50) NOT NULL,
  password character varying(255) NOT NULL,
  facebook character varying(50) DEFAULT NULL,
  webpage character varying(50) DEFAULT NULL,
  descripcion character varying(500),
  telefono character varying(50) DEFAULT NULL,
  tipo_usuario character varying(255) NOT NULL,
  fecha_alta date NOT NULL,
  img_path character varying(255) DEFAULT NULL,
  id_role int NOT NULL,
  PRIMARY KEY (id)
)



INSERT INTO users (id, name, email, password, facebook, webpage, descripcion, telefono, tipo_usuario, fecha_alta, img_path, id_role) VALUES
(1, 'SysAdmin', 'a@a.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', NULL, 'transportesolidario.app', NULL, NULL, '', '2016-11-17', 'img/user-icon.png', 2),
(2, 'Mesa Solidaria', 'mesasolidaria@lala.com', 'laclave1', 'miramelamesa', 'que mesasa', 'son un para de chavones/as que hacen cosas por la gente', '24324234', 'ONG', '2016-11-16', 'img/logo_Mesa.png', 3),
(3, 'Banco de alimentos', 'bancoalimentos@gmail.com', 'quebanquitopapa', 'bancoalimentos', 'www.bankfood.com', 'El citibank del morfi', '3247932864', 'ONG', '2016-11-16', 'img/BancoAlimentos.jpg', 3),
(4, 'reinventar', 'teinventedenuevo@gmail.com', '27o8127oyhdlq', 'reinventarTandil', 'www.reinventar.com.ar', 'hacen algo', '23212', 'ONG', '2016-11-15', 'img/reinventar.jpg', 3);


CREATE TABLE IF NOT EXISTS viajesolidario (
  id_viaje int NOT NULL,
  origen character varying(50) NOT NULL,
  destino character varying(50) NOT NULL,
  fecha_creac date NOT NULL,
  id_ong int NOT NULL,
  habilitado bit NOT NULL,
  frecuencia character varying(50) NOT NULL,
  alto float NOT NULL,
  ancho float NOT NULL,
  peso float NOT NULL,
  PRIMARY KEY (id_viaje)
  -- KEY id_ong (id_ong)
)


INSERT INTO viajesolidario (id_viaje, origen, destino, fecha_creac, id_ong, habilitado, frecuencia, alto, ancho, peso) VALUES
(1, 'Tandil', 'Azul', '2016-11-07', 2, 1::bit, 'mensual', 1, 4, 25),
(2, 'Tandil', 'Olavarria', '2016-11-07', 2, 1::bit, 'Semanal', 2, 2, 34),
(5, 'Tandil', 'Juarez', '2016-11-07', 3, 1::bit, '15 dias', 1.4, 2.2, 66),
(6, 'Tandil', 'Capital Federal', '2016-11-07', 4, 1::bit, 'Mensual', 1, 1.5, 33),
(7, 'Azul', 'Tandil', '2016-11-19', 2, 1::bit, 'Mensual', 30, 30, 10);



CREATE TABLE IF NOT EXISTS viaje_realizado (
  id_viaje int NOT NULL,
  id_transportista int NOT NULL,
  fecha_realizado date NOT NULL,
  observacion character varying(150) DEFAULT NULL,
  estado int NOT NULL,
  PRIMARY KEY (id_viaje,id_transportista)
  -- KEY id_viaje (id_viaje),
  -- KEY id_transportista (id_transportista)
)


INSERT INTO viaje_realizado (id_viaje, id_transportista, fecha_realizado, observacion, estado) VALUES
(1, 3, '2016-11-08', 'Problemas de logistica en destino no hay personal para descargar', 1),
(2, 5, '2016-11-22', 'LALALA', 1),
(5, 4, '2016-11-16', 'Se despacho mercaderia en deposito alternativo indicado por ONG', 2),
(7, 5, '2016-11-19', 'sgsdgsd', 0);

ALTER TABLE viaje_realizado
  ADD CONSTRAINT fk_viajesolidario_realizado FOREIGN KEY (id_viaje) REFERENCES viajesolidario (id_viaje) ON DELETE CASCADE;
