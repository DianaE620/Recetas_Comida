Actividades

Diseña la base de datos de un sitio de recetas siguiendo los siguientes requerimientos.

Usa SQL Designer para diseñar los siguientes esquemas. Al final de cada paso guarda el XML de 
tu esquema (Botón Load/Save -> Save XML) y haz una captura de pantalla.

- Paso 1: Diseño básico

Diseña el esquema de las siguientes tablas en SQL Designer.

Un Chef tiene muchos Meals
Un Meal pertenece a un solo Chef
Un Meal tiene muchos Ingredients
Un Ingredient puede estar en muchos Meals
Para cada Ingredient en un Meal, necesitamos saber la cantidad (quantity) y la unidad de medición 
(measurement). La unidad de medición puede ser gramos, litros, cucharadas, tazas, etc. 
Piensa cuidadosamente en que tabla viven estos datos.
Paso 2: El cliente cambió de opinión
Ahora el cliente se ha acercado con nuevos requerimientos para el sitio, seguramente estos 
requerimientos modificarán la estructura de tu base de datos.

Estos son los nuevos requerimientos:

Un Menu tiene muchos Meals
Un Meal puede estar en muchos Menus
Un Chef tiene muchos Meals
Un Meal pertenece a un solo Chef
Un Meal tiene muchos Ingredients
Un Ingredient puede estar en muchos Meals
Un Meal tiene un Category. Las categorías especifican si el meal es una sopa, entrada, plato 
fuerte, postre, etc.
Un Category tiene muchos Meals

- Paso 3: Constraints

¿Cómo podríamos restringir que un Menu tenga máximo un Meal de cada Category?

Las bases de datos muchas veces no cuentan con las características para poder soportar ciertas 
restricciones. En estos casos, podemos escribir código de Ruby que valide la información antes 
de guardarla en la base de datos.

Piensa en las ventajas y desventajas de esta solución.

La restricción anterior si puede crearse a nivel de base de datos.

CREATE TABLE meal_menu
(
id int NOT NULL AUTO_INCREMENT,
id_meal int NOT NULL CHECK ,
id_menu int NOT NULL,
Address varchar(255),
City varchar(255),
CHECK (P_Id>0)
)     

---- SQL Constraints
http://www.w3schools.com/sql/sql_constraints.asp

SQL constraints are used to specify rules for the data in a table.

 If there is any violation between the constraint and the data action, the action is aborted by 
 the constraint.

Constraints can be specified when the table is created (inside the CREATE TABLE statement) or 
after the table is created (inside the ALTER TABLE statement).

SQL CREATE TABLE + CONSTRAINT Syntax

CREATE TABLE table_name
(
column_name1 data_type(size) constraint_name,
column_name2 data_type(size) constraint_name,
column_name3 data_type(size) constraint_name,
....
);

 In SQL, we have the following constraints:

NOT NULL - Indicates that a column cannot store NULL value

UNIQUE - Ensures that each row for a column must have a unique value

PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Ensures that a column (or combination of 
  two or more columns) have a unique identity which helps to find a particular record in a table 
more easily and quickly

FOREIGN KEY - Ensure the referential integrity of the data in one table to match values in another 
table

CHECK - Ensures that the value in a column meets a specific condition

DEFAULT - Specifies a default value for a column

- Paso 4: Múltiples Categories

Algunos Meals pudieran clasificarse en más de un Category.

¿Cómo afecta esta modificación en el esquema de tu base de datos? ¿Qué es necesario cambiar 
para permitir a un Meal tener más de un Category?


Archivo XML

<?xml version="1.0" encoding="utf-8" ?>
<!-- SQL XML created by WWW SQL Designer, https://github.com/ondras/wwwsqldesigner/ -->
<!-- Active URL: http://ondras.zarovi.cz/sql/demo/ -->
<sql>
<datatypes db="mysql">
  <group label="Numeric" color="rgb(238,238,170)">
    <type label="Integer" length="0" sql="INTEGER" quote=""/>
    <type label="TINYINT" length="0" sql="TINYINT" quote=""/>
    <type label="SMALLINT" length="0" sql="SMALLINT" quote=""/>
    <type label="MEDIUMINT" length="0" sql="MEDIUMINT" quote=""/>
    <type label="INT" length="0" sql="INT" quote=""/>
    <type label="BIGINT" length="0" sql="BIGINT" quote=""/>
    <type label="Decimal" length="1" sql="DECIMAL" re="DEC" quote=""/>
    <type label="Single precision" length="0" sql="FLOAT" quote=""/>
    <type label="Double precision" length="0" sql="DOUBLE" re="DOUBLE" quote=""/>
  </group>

  <group label="Character" color="rgb(255,200,200)">
    <type label="Char" length="1" sql="CHAR" quote="'"/>
    <type label="Varchar" length="1" sql="VARCHAR" quote="'"/>
    <type label="Text" length="0" sql="MEDIUMTEXT" re="TEXT" quote="'"/>
    <type label="Binary" length="1" sql="BINARY" quote="'"/>
    <type label="Varbinary" length="1" sql="VARBINARY" quote="'"/>
    <type label="BLOB" length="0" sql="BLOB" re="BLOB" quote="'"/>
  </group>

  <group label="Date &amp; Time" color="rgb(200,255,200)">
    <type label="Date" length="0" sql="DATE" quote="'"/>
    <type label="Time" length="0" sql="TIME" quote="'"/>
    <type label="Datetime" length="0" sql="DATETIME" quote="'"/>
    <type label="Year" length="0" sql="YEAR" quote=""/>
    <type label="Timestamp" length="0" sql="TIMESTAMP" quote="'"/>
  </group>
  
  <group label="Miscellaneous" color="rgb(200,200,255)">
    <type label="ENUM" length="1" sql="ENUM" quote=""/>
    <type label="SET" length="1" sql="SET" quote=""/>
    <type label="Bit" length="0" sql="bit" quote=""/>
  </group>
</datatypes><table x="539" y="51" name="Chefs">
<row name="id_chef" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="age" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="country" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="speciality" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_chef</part>
</key>
</table>
<table x="739" y="50" name="Meals">
<row name="id_meal" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_chef" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Chefs" row="id_chef" />
</row>
<row name="flavor" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_meal</part>
</key>
</table>
<table x="1138" y="52" name="Ingredients">
<row name="id_ingredient" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="ingredient" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_ingredient</part>
</key>
</table>
<table x="902" y="52" name="meal_ingredient">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_meal" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<row name="id_ingredient" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Ingredients" row="id_ingredient" />
</row>
<row name="quantity" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="measurement" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="418" y="448" name="Chefs">
<row name="id_chef" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="age" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="country" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="speciality" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="new field" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_chef</part>
</key>
</table>
<table x="618" y="457" name="Meals">
<row name="id_meal" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_chef" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Chefs" row="id_chef" />
</row>
<row name="id_category" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="flavor" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_category" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Categories" row="id_category" />
</row>
<key type="PRIMARY" name="">
<part>id_meal</part>
</key>
</table>
<table x="917" y="305" name="meal_ingredient">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_meal" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<row name="id_ingredient" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Ingredients" row="id_ingredient" />
</row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="1203" y="389" name="Ingredients">
<row name="id_ingredient" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="ingredient" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_ingredient</part>
</key>
</table>
<table x="1221" y="556" name="Menus">
<row name="id_menu" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="type" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="restaurant" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_menu</part>
</key>
</table>
<table x="922" y="508" name="meal_menu">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_meal" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<row name="id_menu" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Menus" row="id_menu" />
</row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="807" y="663" name="Categories">
<row name="id_category" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="category" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_category</part>
</key>
</table>
</sql>


