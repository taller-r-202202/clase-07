## Eduard Martinez
## Update: 14-09-2022

## llamar/instalar otras librerias de la clase: (use pacman)
require(pacman)
p_load(tidyverse, rio, skimr,janitor)

## **[1.] Combinar conjuntos de datos (adicionar filas/columnas)**

### **1.1 Agregar observaciones**

## Generar conjuntos de datos para hacer la aplicación:
set.seed(0117)
obs_1 = tibble(id = 100:105 , 
               age = runif(6,18,25) %>% round() , 
               height = rnorm(6,170,10) %>% round())

obs_2 = tibble(id = 106:107 , 
               age = runif(2,40,50)  %>% round() , 
               height = rnorm(2,165,8) %>% round() , 
               name = c("Lee","Bo"))

## Inspeccionar los datos:
obs_1 %>% head(n = 5)
obs_2 %>% head(n = 2)

## Combinar el conjunto de datos:
data = bind_rows(obs_1,obs_2, .id = "group")
data

### **1.2 Adicionar variables a un conjunto de datos**

## Generar conjuntos de datos para haer la aplicación:
db_1 = tibble(id = 102:105 , income = runif(4,1000,2000) %>% round())
db_2 = tibble(id = 103:106 , age = runif(4,30,40)  %>% round())

## Inspeccionar los datos:
db_1 %>% head(n = 5)
db_2 %>% head(n = 4)

## Combinar el conjunto de datos:
db = bind_cols(db_1,db_2)
db

cat("Algo salió mal! la función `bind_cols()` no tiene en cuenta el identificador de cada observación.")

### **1.3 Adicionar variables a un conjunto de datos:** `join()`
cat("Puede adicionar variables a un conjunto de datos usando la familia de funciones de `join()`:")

## Generar conjuntos de datos para hacer la aplicación:
data_1 = tibble(Casa=c(101,201,201,301),
                Visita=c(2,1,2,1),
                Sexo=c("Mujer","Mujer","Hombre","Hombre"))
data_2 = tibble(Casa=c(101,101,201,201),
                Visita=c(1,2,1,2),
                Edad=c(23,35,7,24),
                Ingresos=c(500000,1000000,NA,2000000))

#### **Ejemplo: left_join()**
df = left_join(x=data_1,y=data_2,by=c("Casa","Visita"))
df

#### **Ejemplo: right_join()**
df = right_join(x=data_1,y=data_2,by=c("Casa","Visita"))
df

#### **Ejemplo: inner_join()**
df = inner_join(x=data_1,y=data_2,by=c("Casa","Visita"))
df

#### **Ejemplo: full_join()**
df = full_join(x=data_1,y=data_2,by=c("Casa","Visita"))
df

#### **Ejemplo: Join sin identificador único**
df = full_join(x=data_1,y=data_2,by=c("Casa"))
df

### **1.4 Chequear valores unicos**

## Coincidencia en variables:
intersect(colnames(data_1),colnames(data_1))

## Identificadores únicos:
nrow(distinct_all(data_1))

length(unique(data_1$Casa))

table(duplicated(data_1$Casa))

## **[2.]. Pivotear conjuntos de datos**
cat("Pivotear es la acción de intercambiar entre las filas y columnas de un conjunto de datos")

## Obtener conjunto de datos:** `fish_encounters` y `us_rent_income`, son conjuntos de datos de la librería `tidyr`:

fish_encounters %>% head(3)

us_rent_income %>% head(3)

### **2.1. pivot_wide**

#### **Ejemplo:** 
fish_encounters %>% pivot_wider(names_from = station, values_from = seen ) %>% head(3)

us_rent_income %>% pivot_wider(names_from = variable, values_from = c(estimate, moe)) %>% head(3)                        

fish_wide = fish_encounters %>% pivot_wider(names_from = station, values_from = seen ) %>% head(3)

### **2.2 pivot_long**

## Retorno `fish_wide` al formato original:

fish_wide %>% pivot_longer(cols = c(2:12), names_to = "seen")

## **[3.] Aplicación: GEIH**




                      