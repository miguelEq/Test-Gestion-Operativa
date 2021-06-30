const axios = require('axios').default;
const fs = require('fs');
const util =require('util')

const readFile= util.promisify(fs.readFile)
const writeFile= util.promisify(fs.writeFile)
const site_id = "MLA";
//por default debe haber una lista vacia en el archivo
const path='log.json'

//En esta lista van los ids de los vendedores   
const sellers = [179571326]

//por cada id de vendedor crea una promesa que se encarga de armar el objeto resultado luego de 
//consultar en la api de mercadolibre y lo guarda en un archivo json
sellers.forEach(seller => {
  axios.get(`https://api.mercadolibre.com/sites/${site_id}/search?seller_id=${seller}`)
  .then(res =>{
      const promises=[] 
      res.data.results.forEach(elem => {
         const obj={}
         obj.id=elem.id
         obj.title=elem.title
         obj.category_id=elem.category_id  
         const request = axios.get(`https://api.mercadolibre.com/categories/${elem.category_id}`)
                         .then(res=>{
                          obj.name=res.data.name 
                          return obj
                         }) 
         promises.push(request)
      })
      Promise.all(promises)
      .then(res=>{
        const obj_result = {seller_id:seller,info:res}
        readFile(path)
        .then(data => {
          let logs = JSON.parse(data)  
          logs.push(obj_result)
          writeFile(path,JSON.stringify(logs,null,2))
          .then(()=>console.log("se guardo correctamente"))
          .catch(e=>console.log(e))
        })
        .catch(e=>console.log(e)) 
      })
      .catch(err=> console.log(err))
      }
    ).catch(e=>console.log(e));      
})

