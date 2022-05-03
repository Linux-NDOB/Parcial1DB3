CREATE TABLE departamento (
  id INT(10)  NOT NULL  ,
  nombre VARCHAR(50)  NULL    ,
PRIMARY KEY(id));



CREATE TABLE grado (
  id INT(10)  NOT NULL  ,
  nombre VARCHAR(100)  NULL    ,
PRIMARY KEY(id));



CREATE TABLE persona (
  id INT(10)  NOT NULL  ,
  nit VARCHAR(9)  NULL  ,
  nombre VARCHAR(25)  NULL  ,
  apellido1 VARCHAR(50)  NULL  ,
  apellido2 VARCHAR(50)  NULL  ,
  ciudad VARCHAR(25)  NULL  ,
  direccion VARCHAR(50)  NULL  ,
  telefono VARCHAR(9)  NULL  ,
  fecha_nacimiento DATE  NULL  ,
  sexo ENUM('H','M')  NULL  ,
  tipo ENUM(...)  NULL    ,
PRIMARY KEY(id));



CREATE TABLE curso_escolar (
  id INT(10)  NOT NULL  ,
  anio_inicio YEAR(4)  NULL  ,
  anio_fin YEAR(4)  NULL    ,
PRIMARY KEY(id));



CREATE TABLE profesor (
  persona_id INT(10)  NOT NULL  ,
  departamento_id INT(10)  NOT NULL    ,
PRIMARY KEY(persona_id)  ,
INDEX profesor_FKIndex1(departamento_id)  ,
INDEX profesor_FKIndex2(persona_id),
  FOREIGN KEY(departamento_id)
    REFERENCES departamento(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(persona_id)
    REFERENCES persona(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE asignatura (
  id INT(10)  NOT NULL  ,
  grado_id INT(10)  NOT NULL  ,
  profesor_persona_id INT(10)  NOT NULL  ,
  nombre VARCHAR(100)  NULL  ,
  creditos FLOAT  NULL  ,
  tipo ENUM(...)  NULL  ,
  curso TINYINT(3) UNSIGNED  NULL  ,
  cuatrimestre TINYINT(3) UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX asignatura_FKIndex1(grado_id)  ,
INDEX asignatura_FKIndex2(profesor_persona_id),
  FOREIGN KEY(grado_id)
    REFERENCES grado(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(profesor_persona_id)
    REFERENCES profesor(persona_id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE alumno_se_matricula_asignatura (
  persona_id INT(10)  NOT NULL  ,
  curso_escolar_id INT(10)  NOT NULL  ,
  asignatura_id INT(10)  NOT NULL    ,
PRIMARY KEY(persona_id, curso_escolar_id, asignatura_id)  ,
INDEX persona_has_curso_escolar_FKIndex1(persona_id)  ,
INDEX persona_has_curso_escolar_FKIndex2(curso_escolar_id)  ,
INDEX persona_has_curso_escolar_FKIndex3(asignatura_id),
  FOREIGN KEY(persona_id)
    REFERENCES persona(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(curso_escolar_id)
    REFERENCES curso_escolar(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(asignatura_id)
    REFERENCES asignatura(id)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




