--Como crear tablas 
CREATE TABLE CARGOS(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE EMPLEADOS(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    id_cargo NUMBER,
    FOREIGN KEY (id_cargo) REFERENCES CARGOS(id)
);

--Como insertar datos (data)
INSERT INTO CARGOS (id, nombre) VALUES (1, 'Administrador');
INSERT INTO CARGOS (id, nombre) VALUES (2, 'Cajero');
INSERT INTO CARGOS (id, nombre) VALUES (3, 'Bodeguero');
INSERT INTO CARGOS (id, nombre) VALUES (4, 'Mantenimiento');

--Como crear los empleados
INSERT INTO EMPLEADOS (id, nombre, id_cargo) VALUES (1, 'Cristobal Loncon', 1);
INSERT INTO EMPLEADOS (id, nombre, id_cargo) VALUES (2, 'Francisco Almonacid', 4);
INSERT INTO EMPLEADOS (id, nombre, id_cargo) VALUES (3, 'Diego Benitez', 2);
INSERT INTO EMPLEADOS (id, nombre, id_cargo) VALUES (4, 'Francisca Rivera', 2);
INSERT INTO EMPLEADOS (id, nombre, id_cargo) VALUES (5, 'El mejor profe', 3);

--Sin el commit los datos no se insertan en la base de datos.
COMMIT;

--Consultas de tablas
SELECT * FROM EMPLEADOS;

--CREAMOS TABLA LOCALES
CREATE TABLE LOCALES(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(100)
);

--CREAMOS LA TABLA PIVOTE EMPLEADOS_LOCALES
CREATE TABLE EMPLEADOS_LOCALES(
    id_empleado NUMBER,
    id_local NUMBER,
    PRIMARY KEY (id_empleado, id_local),
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADOS(id),
    FOREIGN KEY (id_local) REFERENCES LOCALES(id)
);

--INSERTAMOS DATOS EN LA TABLA LOCALES
INSERT INTO LOCALES (id, nombre, direccion) VALUES (1, 'Local Centro', 'Av. Siempre Viva 123');
INSERT INTO LOCALES (id, nombre, direccion) VALUES (2, 'Local Norte', 'Calle Falsa 456');
INSERT INTO LOCALES (id, nombre, direccion) VALUES (3, 'Local Sur   ', 'Av. Libertad 789'); 
INSERT INTO LOCALES (id, nombre, direccion) VALUES (4, 'Local Oriente', 'Calle Luna 101');
INSERT INTO LOCALES (id, nombre, direccion) VALUES (5, 'Local Poniente', 'Av. Sol 202');

--INSERTAMOS DATOS EN LA TABLA PIVOTE EMPLEADOS_LOCALES
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (1, 1);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (1, 2);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (2, 3);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (3, 1);        
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (3, 4);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (4, 5);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (5, 2);   
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (5, 3);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (5, 4);
INSERT INTO EMPLEADOS_LOCALES (id_empleado, id_local) VALUES (5, 5);
COMMIT;
