### Grails

import me.*;
def upsPullTrkService = ctx.getBean('upsPullTrkService')
def s = Shipment.get(27528954729)
def tn = s.trackingNumber
def trackingData = upsPullTrkService.getTrkEvents([tn])
trackingData.each { td ->
println "------------------------------------------------"
println "${td.sucursal} - ${td.eventDate} - ${td.description}"
}
"Done"

--El script:
1- trae un un objeto llamado 'upsPullTrkService' y lo guarda en una variable
2- luego se trae un objeto Shipment dado un identificador y lo guarda en una variable
3- accede a la propiedad trackingNumber del objeto Shipment guardado en 's' y lo guarda en una variable 'tn'
4- Le pide al objeto upsPullTrkService que le de todos los eventos del envio
con 'tn' y lo guarda en una variable
5- y por ultimo recorre los eventos e imprime de cada uno la sucursal , la fecha y la descripcion. 




