Feature: Alta de Cliente

  Scenario: Camino feliz - Alta de cliente exitosa
    Given El usuario ingresa los datos requeridos
    When El usuario envía la solicitud de alta
    Then La solicitud es procesada y el cliente es registrado

  Scenario: Error - Datos incompletos
    Given El usuario no proporciona todos los datos requeridos
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando los datos faltantes

  Scenario: Error - Datos incorrectos
    Given El usuario proporciona datos incorrectos
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando los datos incorrectos

  Scenario: Error - Fraude detectado
    Given El motor antifraude marca la solicitud como sospechosa
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando sospecha de fraude

  Scenario: Error - Fallo en servicio externo
    Given Un servicio externo falla durante el proceso
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando el fallo en el servicio externo

  Scenario: Error - Error en pago
    Given El pago no se procesa correctamente
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando el fallo en el pago

  Scenario: Error - Datos inconsistentes
    Given Los datos no son consistentes
    When El usuario envía la solicitud de alta
    Then Se muestra un mensaje de error indicando la inconsistencia de datos