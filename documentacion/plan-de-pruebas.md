# Plan de Pruebas para Alta de Cliente

## Riesgos Identificados
1. **Errores de validación de datos**: Datos incorrectos o incompletos pueden ser ingresados por el usuario.
2. **Fraude**: Posibilidad de que se intente registrar un cliente fraudulento.
3. **Fallos en la comunicación con servicios externos**: Problemas al comunicarse con el motor antifraude, buró de riesgos, core bancario, etc.
4. **Errores en el procesamiento de pagos**: Fallos en la gateway de pagos o sistema de liquidación.
5. **Consistencia de datos**: Problemas al consolidar datos en el sistema contable.

## Escenarios de Error
- **Datos incompletos**: El usuario no proporciona todos los datos requeridos.
- **Datos incorrectos**: Los datos ingresados no cumplen con los formatos o reglas establecidos.
- **Fraude detectado**: El motor antifraude marca la solicitud como sospechosa.
- **Fallo en servicio externo**: Cualquier servicio externo falla durante el proceso.
- **Error en pago**: El pago no se procesa correctamente.

## Criterios de Entrada/Salida
- **Entrada**: Solicitud de alta de cliente con todos los datos requeridos.
- **Salida**: Confirmación de alta de cliente o mensaje de error detallado.