 CREATE TABLE USUARIO(
    nombre_usu VARCHAR2(100) NOT NULL,
    contraseña VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    sexo VARCHAR2(1) NOT NULL,
    fec_nacimiento DATE,
    tipo_perfil VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (nombre_usu),
    CONSTRAINT ck_sexo CHECK(sexo='H' OR sexo='M'),
    CONSTRAINT ck_perfil CHECK(tipo_perfil='público' OR tipo_perfil='privado')
    
    );
    
    
    
CREATE TABLE CAMPAÑA(
  nombre_camp VARCHAR2(100) NOT NULL,
  creador VARCHAR2(100) NOT NULL,
  descripcion VARCHAR2(255),
  CONSTRAINT pk_campaña PRIMARY KEY(nombre_camp)
    
);

CREATE TABLE PERSONAJE(
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_personaje VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    profesion VARCHAR2(100) NOT NULL,
    edad NUMBER NOT NULL,
    lugar_nac VARCHAR2(100) NOT NULL,
    fuerza NUMBER NOT NULL,
    constitucion NUMBER NOT NULL,
    tamaño NUMBER NOT NULL,
    destreza NUMBER NOT NULL,
    apariencia NUMBER NOT NULL,
    cordura NUMBER NOT NULL,
    inteligencia NUMBER NOT NULL,
    poder NUMBER NOT NULL,
    educacion NUMBER NOT NULL,
    idea NUMBER NOT NULL,
    suerte NUMBER NOT NULL,
    conocimiento NUMBER NOT NULL,
    CONSTRAINT pk_personaje PRIMARY KEY (nombre_usuario,nombre_personaje,nombre_campaña),
    CONSTRAINT fk_personaje_usuario FOREIGN KEY (nombre_usuario) REFERENCES USUARIO(nombre_usu) ON DELETE CASCADE,
    CONSTRAINT fk_personaje_campaña FOREIGN KEY (nombre_campaña) REFERENCES CAMPAÑA(nombre_camp) ON DELETE CASCADE 
    
    );
    
    
CREATE TABLE TITULO(
    nombre_titulo VARCHAR2(100) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_titulo PRIMARY KEY (nombre_titulo,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_titulo_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);

CREATE TABLE FAMILIA(
    familiar VARCHAR2(100) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_familia PRIMARY KEY(familiar,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_familia_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña) REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);


CREATE TABLE TRASTORNO(
    nombre_trastorno VARCHAR2(100) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_trastorno PRIMARY KEY(nombre_trastorno,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_trastorno_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);

CREATE TABLE HABILIDAD(
    nombre_habilidad VARCHAR2(50) NOT NULL,
    CONSTRAINT pk_habilidad PRIMARY KEY(nombre_habilidad)
    
);


CREATE TABLE ARMA(
    nombre_arma VARCHAR2(50) NOT NULL,
    CONSTRAINT pk_arma PRIMARY KEY(nombre_arma)
);

CREATE TABLE HERIDA(
    nombre_herida VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_herida PRIMARY KEY(nombre_herida,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_herida_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);
    
CREATE TABLE CICATRIZ(
    nombre_cicatriz VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_cicatriz PRIMARY KEY(nombre_cicatriz,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_cicatriz_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);


CREATE TABLE PROPIEDAD(
    nombre_propiedad VARCHAR2(50),
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_propiedad PRIMARY KEY(nombre_propiedad,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_propiedad_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);
    
    
CREATE TABLE POSESION (
    nombre_posesion VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_posesion PRIMARY KEY(nombre_posesion,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_posesion_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
    
);


CREATE TABLE LIBRO(
    nombre_libro VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_libro PRIMARY KEY(nombre_libro,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_libro_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE

);

CREATE TABLE OBJETO(
    nombre_objeto VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_objeto PRIMARY KEY(nombre_objeto,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_objeto_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
);

CREATE TABLE HECHIZO(
    nombre_hechizo VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_hechizo PRIMARY KEY(nombre_hechizo,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_hechizo_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
    
);

CREATE TABLE SER(
    nombre_ser VARCHAR2(50) NOT NULL,
    nombre_pers VARCHAR2(100) NOT NULL,
    nombre_usuario VARCHAR2(100) NOT NULL,
    nombre_campaña VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_ser PRIMARY KEY(nombre_ser,nombre_pers,nombre_usuario,nombre_campaña),
    CONSTRAINT fk_ser_personaje FOREIGN KEY(nombre_pers,nombre_usuario,nombre_campaña)REFERENCES PERSONAJE(nombre_personaje,nombre_usuario,nombre_campaña)ON DELETE CASCADE
    
);