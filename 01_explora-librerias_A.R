# Texto sin acentos

#' En que directorio va a buscar R los paquetes?

# Prueba con .libPaths() y .Library

.Library
.libPaths()
#' Paquetes instalados
installed.packages()
## Usa installed.packages() para obtener los paquetes instalados
## Si lo deseas puedes observar estos datos en un data frame o tibble
## Recuerda utilizar View(), dplyr::glimpse(), o una funcion similar
## para explorar los datos

## Cuantos paquetes tienes? 146
library(dplyr)
installed.packages() %>% as_tibble() %>% View()

installed.packages() %>%
        glimpse() %>%   ## convierte los datos a un matrix, array
        View()
class(installed.packages())

installed.packages() %>%
    as_tibble() %>%
    nrow()


#' Explora los paquetes que tienes instalados

## Puedes contar algunas cosas! Aqui hay algunas ideas:
##   * Ordena los paquetes de acuerdo con su LibPath, Priority, o ambos

installed.packages() %>% as_tibble() %>%
      arrange(Priority)  ## los ordena en orden alfabético.

installed.packages() %>% as_tibble() %>%
  arrange(desc(Priority))   ## con desc se pone en orden descendente.

##   * Cuantos de ellos necesitan ser compilados?

installed.packages() %>% as_tibble() %>%
  filter(NeedsCompilation == "yes") %>%
  count()

##   * En que version de R se construyeron?
installed.packages() %>% as_tibble() %>% group_by(Built) %>% count()

## Este comando nos dice de aquellos que necesitan compilación en que versión de R se construyeron.
installed.packages() %>% as_tibble() %>%
  filter(NeedsCompilation == "yes") %>%
  count(Built)

## Para los amantes del tidyverse, aqui hay algunas funciones utiles
# data %>% count(var)
# data %>% count(var1, var2)
# data %>% count(var) %>% mutate(prop = n / sum(n))

#' Algunos puntos para reflexionar

## Puedes tomar notas para ti mismo sobre puntos importantes del
## ejercicio anterior, algunas sugerencias son:
##   * El numero de paquete de R base y los paquetes recomendados
##     tienen sentido para ti?
##   * Como se relaciona el resultado de .libPaths() con el de .Library?

#' Actividades adicionales

## Si aun te queda tiempo hagamos estos ejercicios...

## Cuantos paquetes pertenecen ya sea a paquetes base o recomendados? Son todos
## los que tenemos instalados?
installed.packages() %>% as_tibble() %>% filter(Suggests != "NA") %>% count() # 124 paquetes que no son recomendados.
installed.packages() %>% as_tibble() %>% filter(Priority == "base") %>% count()
installed.packages() %>% as_tibble() %>% filter(Priority == "recommended") %>% count()

installed.packages() %>%
  as_tibble() %>%
  count(Priority)
## Como es el estilo de los nombres de los paquetes instalados? (estan escritos
## con minusculas? Contienen signos de puntuacion . - _ ? ), etc.
## Usa el argumento `fields` de installed.packages() para obtener mas
## informacion y explora los datos.

installed.packages(fields = )
