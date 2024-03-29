Feature: Obtener información de una mascota por ID
  Este servicio es usado para consultar la información de una mascota.

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar código de respuesta 200 al consultar una mascota
    * def SchemaUtils = Java.type('com.intuit.karate.swagger.util.SchemaUtils')
    * string schema = read('classpath:swagger/getPet/getPet-schema.json')
    * def CreatePetResponse = call read('classpath:common/CreatePetCommon.feature')
    * def petId = CreatePetResponse.response.id
    * path '/pet/' + petId
    * method GET
    * status 200
    * assert SchemaUtils.isValid(response,schema)
