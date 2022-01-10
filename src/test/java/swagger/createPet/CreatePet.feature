Feature: Crear Mascota
  Este servicio es usado para la creación de una mascota

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario Outline: Verificar el correcto registro de 10 mascotas con código 200
    * def SchemaUtils = Java.type('com.intuit.karate.swagger.util.SchemaUtils')
    * string schema = read('classpath:swagger/createPet/createPet-schema.json')
    * path '/pet'
    * request
    """
      {
        "id": <id>,
        "category": {
          "id": <categoryId>,
          "name": "<categoryName>"
        },
        "name": "<name>",
        "photoUrls": [
          "<photoUrls>"
        ],
        "tags": [
          {
            "id": <tagsId>,
            "name": "<tagsName>"
          }
        ],
        "status": "<status>"
      }
    """
    * method POST
    * status 200
    * assert SchemaUtils.isValid(response,schema)
    Examples:
      | read('data/createPet-data.csv') |