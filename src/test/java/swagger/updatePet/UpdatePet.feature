Feature: Actualizar información de una mascota
  Servicio que permite la actualización total o parcial de los datos de una mascota registrada.

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verifica la correcta actualización de 1 mascota
    * def SchemaUtils = Java.type('com.intuit.karate.swagger.util.SchemaUtils')
    * string schema = read('classpath:swagger/updatePet/updatePet-schema.json')
    * def CreatePetResponse = call read('classpath:common/CreatePetCommon.feature')
    * def petId = CreatePetResponse.response.id
    * path '/pet/'
    * request
    """
      {
        "id": 12345,
        "category": {
          "id": 10,
          "name": "PAW-PATROL"
        },
        "name": "Skye",
        "photoUrls": [
          "skye.jpg"
        ],
        "tags": [
          {
            "id": 12,
            "name": "PawPatrol Rosa"
          }
        ],
        "status": "available"
      }
    """
    * method PUT
    * status 200
    * match response.id == 12345
    * match response.category.id == 10
    * match response.category.name == "PAW-PATROL"
    * match response.name == "Skye"
    * match response.photoUrls == ["skye.jpg"]
    * match response.tags contains [{"name":"PawPatrol Rosa","id":12}]
    * match response.status == "available"
    * assert SchemaUtils.isValid(response,schema)