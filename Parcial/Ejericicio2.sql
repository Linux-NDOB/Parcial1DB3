CREATE TABLE gama_producto (
  gama VARCHAR(50)  NOT NULL  ,
  descripcion_texto TEXT  NULL  ,
  descripcion_html TEXT  NULL  ,
  imagen VARCHAR(256)  NULL    ,
PRIMARY KEY(gama));



CREATE TABLE oficina (
  codigo_oficina VARCHAR(10)  NOT NULL  ,
  ciudad VARCHAR(30)  NULL  ,
  pais VARCHAR(50)  NULL  ,
  region VARCHAR(50)  NULL  ,
  codigo_postal VARCHAR(10)  NULL  ,
  telefono VARCHAR(20)  NULL  ,
  linea_direccion1 VARCHAR(50)  NULL  ,
  linea:direccion2 VARCHAR(50)  NULL    ,
PRIMARY KEY(codigo_oficina));



CREATE TABLE producto (
  codigo_producto VARCHAR(15)  NOT NULL  ,
  gama_producto_gama VARCHAR(50)  NOT NULL  ,
  nombre VARCHAR(70)  NULL  ,
  dimensiones VARCHAR(25)  NULL  ,
  proveedor VARCHAR(50)  NULL  ,
  descripcion TEXT  NULL  ,
  cantidad_en_stock SMALLINT(6) UNSIGNED  NULL  ,
  precio_venta DECIMAL(|15.2)  NULL  ,
  precio_proveedor DECIMAL(15.2)  NULL    ,
PRIMARY KEY(codigo_producto)  ,
INDEX producto_FKIndex1(gama_producto_gama),
  FOREIGN KEY(gama_producto_gama)
    REFERENCES gama_producto(gama)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE empleado (
  codigo_empleado INT(11)  NOT NULL  ,
  empleado_codigo_empleado INT(11)  NOT NULL  ,
  oficina_codigo_oficina VARCHAR(10)  NOT NULL  ,
  nombre VARCHAR(50)  NULL  ,
  apellido1 VARCHAR(50)  NULL  ,
  apellido2 VARCHAR(50)  NULL  ,
  extension VARCHAR(10)  NULL  ,
  email VARCHAR(100)  NULL  ,
  puesto VARCHAR(50)  NULL    ,
PRIMARY KEY(codigo_empleado)  ,
INDEX empleado_FKIndex1(oficina_codigo_oficina)  ,
INDEX empleado_FKIndex2(empleado_codigo_empleado),
  FOREIGN KEY(oficina_codigo_oficina)
    REFERENCES oficina(codigo_oficina)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(empleado_codigo_empleado)
    REFERENCES empleado(codigo_empleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE cliente (
  codigo_cliente INT(11)  NOT NULL  ,
  empleado_codigo_empleado INT(11)  NOT NULL  ,
  nombre_cliente VARCHAR(50)  NULL  ,
  nombre_contacto VARCHAR(50)  NULL  ,
  apellido_contacto VARCHAR(30)  NULL  ,
  telefono VARCHAR(15)  NULL  ,
  fax VARCHAR(15)  NULL  ,
  linea_direccion1 VARCHAR(50)  NULL  ,
  linea_direccion2 VARCHAR(50)  NULL  ,
  ciudad VARCHAR(50)  NULL  ,
  region VARCHAR(50)  NULL  ,
  pais VARCHAR(50)  NULL  ,
  codigo_postal VARCHAR(10)  NULL  ,
  limite_credito DECIMAL(15.2)  NULL    ,
PRIMARY KEY(codigo_cliente)  ,
INDEX cliente_FKIndex1(empleado_codigo_empleado),
  FOREIGN KEY(empleado_codigo_empleado)
    REFERENCES empleado(codigo_empleado)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE pago (
  id_transaccion VARCHAR(50)  NOT NULL  ,
  cliente_codigo_cliente INT(11)  NOT NULL  ,
  forma_pago VARCHAR(40)  NULL  ,
  fecha_pago DATE  NULL  ,
  total DECIMAL(|15.2)  NULL    ,
PRIMARY KEY(id_transaccion, cliente_codigo_cliente)  ,
INDEX pago_FKIndex1(cliente_codigo_cliente),
  FOREIGN KEY(cliente_codigo_cliente)
    REFERENCES cliente(codigo_cliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE pedido (
  codigo_pedido INT(11)  NOT NULL  ,
  cliente_codigo_cliente INT(11)  NOT NULL  ,
  fecha_pedido DATE  NULL  ,
  fecha_esperada DATE  NULL  ,
  fecha_entrega DATE  NULL  ,
  estado VARCHAR(15)  NULL  ,
  comentarios TEXT  NULL    ,
PRIMARY KEY(codigo_pedido)  ,
INDEX pedido_FKIndex1(cliente_codigo_cliente),
  FOREIGN KEY(cliente_codigo_cliente)
    REFERENCES cliente(codigo_cliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE detalle_pedido (
  producto_codigo_producto VARCHAR(15)  NOT NULL  ,
  pedido_codigo_pedido INT(11)  NOT NULL  ,
  cantidad INT(11)  NULL  ,
  precio_unidad DECIMAL(15.2)  NULL  ,
  numero_linea SMALLINT(6) UNSIGNED  NULL    ,
PRIMARY KEY(producto_codigo_producto, pedido_codigo_pedido)  ,
INDEX detalle_pedido_FKIndex1(producto_codigo_producto)  ,
INDEX detalle_pedido_FKIndex2(pedido_codigo_pedido),
  FOREIGN KEY(producto_codigo_producto)
    REFERENCES producto(codigo_producto)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(pedido_codigo_pedido)
    REFERENCES pedido(codigo_pedido)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




