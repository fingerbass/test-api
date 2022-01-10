Feature: Crear Mascota
  Crea una mascota

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar el correcto registro de 1 mascota con código 200
    * path '/pet'
    * request
    """
      {
        "id": 12345,
        "category": {
          "id": 12,
          "name": "VIP"
        },
        "name": "Marshall",
        "photoUrls": [
          "marshall.jpg"
        ],
        "tags": [
          {
            "id": 12,
            "name": "PawPatrol"
          }
        ],
        "status": "available"
      }
    """
    * method POST
    * status 200
    * match response.id == 12345
    * match response.category.id == 12
    * match response.category.name == "VIP"
    * match response.name == "Marshall"
    * match response.photoUrls == ["marshall.jpg"]
    * match response.tags contains [{"name":"PawPatrol","id":12}]
    * match response.status == "available"