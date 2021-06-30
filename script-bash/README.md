### Script

#!/bin/bash

users_id=(71665538 66146765 132961968 15096445 172753273 54152646)

for users_id in ${users_id[*]}

do

curl=$(curl -s "​ api.mercadolibre.com/users/$users_id/shipping_preferences​ " | jq -c
'.services')

echo "$users_id: $curl"

done



*A tu entender, que se busca obtener como output del script?

--Respuesta:

  Imprime por pantalla los servicios(de envio) de cada usuario definido en una lista de usuarios

*Podrías detallar que se hace en cada línea del script?

--Respuesta:

1- define una lista de usuarios.

2- hace una iteracion sobre esa lista definida.

3- Define el bloque a ejecutar a cada iteracion. 

4- guarda en una variable llamada 'curl' los servicios del usuario que se obtiene de llamar a la api de mercadolibre y al endpoint que devuelve todos los modos de envío y servicios disponibles para el usuario. 

5-Imprime por pantalla el id del usuario y los servicios disponibles de ese usuario.

*Cuántas líneas se imprimen como output?

--Respuesta:

  6 lineas ya que son 6 usuarios.
