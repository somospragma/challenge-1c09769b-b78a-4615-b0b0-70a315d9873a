# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `package.json` — `postman-to-karate@1.0.0`: postman-to-karate declara la version 1.0.0, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.
- `package.json` — `karate-js@1.4.0`: karate-js declara la version 1.4.0, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.
- `package.json` — `cucumber@10.2.1`: cucumber declara la version 10.2.1, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.

## Como saber que terminaste

```bash
npx --yes newman run coleccion.json --bail
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Calidad de Software, Especialidad Funcional, Tecnología Postman, Junior

### Brecha de conocimiento
Diseña casos de prueba que cubren el riesgo del negocio y no solo el camino feliz, y los documenta de forma trazable

### Misión / candidato
Cubrir el flujo de alta de cliente

### Datos adicionales
Candidato con 1 año en calidad

### Reto
- Tema: Diseño de casos de prueba a partir de riesgo
- Seniority: junior-l1
- Tipo: practical
- Título: Diseño de casos de prueba para alta de cliente
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Identificación de riesgos y escenarios — objetivo: Identificar los riesgos y escenarios de error durante el flujo de alta de cliente — entregable (NO resolver): Documento que enumera los riesgos y escenarios de error, y describe los casos de prueba correspondientes.
- Fase 2: Diseño de casos de prueba — objetivo: Diseñar casos de prueba que cubran los riesgos y escenarios identificados — entregable (NO resolver): Documento que detalla los casos de prueba diseñados, incluyendo los pasos y resultados esperados.
- Fase 3: Revisión y mejora de casos de prueba — objetivo: Revisar y mejorar los casos de prueba diseñados — entregable (NO resolver): Documento revisado y mejorado de casos de prueba, incluyendo cualquier brecha o riesgo adicional identificado.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: package.json ===
{
  "name": "alta-cliente-tests",
  "version": "1.0.0",
  "description": "Colección de pruebas para el flujo de alta de cliente en banca digital",
  "scripts": {
    "test": "npx newman run coleccion-postman/alta-cliente.postman_collection.json --bail",
    "test:report": "npx newman run coleccion-postman/alta-cliente.postman_collection.json -r cli,junit --reporter-junit-export report.xml",
    "test:karate": "karate.jar src/test/java/karate-config.js",
    "test:cucumber": "cucumber-js casos/**/*.feature"
  },
  "dependencies": {
    "newman": "^6.1.2",
    "karate-js": "^1.4.0",
    "cucumber": "^10.2.1"
  },
  "devDependencies": {
    "postman-to-karate": "^1.0.0",
    "newman-reporter-junit": "^1.2.3"
  },
  "keywords": [
    "banca-digital",
    "alta-cliente",
    "pruebas",
    "postman",
    "newman",
    "gherkin",
    "cucumber",
    "karate"
  ],
  "author": "Equipo de Calidad de Software",
  "license": "ISC",
  "engines": {
    "node": ">=18.0.0"
  }
}

// === ARCHIVO: documentacion/plan-de-pruebas.md ===
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


// === ARCHIVO: documentacion/matriz-trazabilidad.csv ===
Requisito,Caso de Prueba,Evidencia
REG-001: Validación de datos,CP-001: Datos incompletos,E-001: Mensaje de error
REG-002: Detección de fraude,CP-002: Fraude detectado,E-002: Alerta de fraude
REG-003: Comunicación con servicios externos,CP-003: Fallo en servicio externo,E-003: Log de error
REG-004: Procesamiento de pagos,CP-004: Error en pago,E-004: Mensaje de pago fallido
REG-005: Consistencia de datos,CP-005: Datos inconsistentes,E-005: Reporte de inconsistencia


// === ARCHIVO: casos/alta-cliente.feature ===
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

// === ARCHIVO: datos/datos-prueba.csv ===
ID,Nombre,Apellido,FechaNacimiento,Email,Direccion,Ciudad,Estado,Pais,CodigoPostal,NumeroTelefono,TipoDocumento,NumeroDocumento,EstadoCivil,Ocupacion,IngresosMensuales,OrigenSolicitud,Canal,FechaSolicitud,CodigoOperacion
1,Juan,Perez,1990-01-01,juan.perez@example.com,123 Main St,Anytown,Anystate,USA,12345,1234567890,Pasaporte,ABC123,Soltero,Ingeniero,5000,Web,Online,2024-07-01,OP123456789
2,Maria,Gonzalez,1985-05-15,maria.gonzalez@example.com,456 Elm St,Othertown,Otherstate,USA,67890,9876543210,DNI,XYZ789,Casado,Medico,7000,App,Mobile,2024-07-01,OP987654321
3,Carlos,Lopez,1978-12-31,carlos.lopez@example.com,789 Oak St,Thistown,Thisstate,USA,54321,5555555555,Pasaporte,DEF456,Divorciado,Abogado,6000,Web,Online,2024-07-01,OP111222333
4,Laura,Martinez,1992-07-20,laura.martinez@example.com,321 Pine St,Thattown,Thatstate,USA,98765,1111111111,DNI,GHI789,Viudo,Profesor,4500,App,Mobile,2024-07-01,OP444555666
5,Pedro,Sanchez,1980-03-10,pedro.sanchez@example.com,654 Maple St,Sometown,Somestate,USA,13579,2222222222,Pasaporte,JKL012,Soltero,Arquitecto,8000,Web,Online,2024-07-01,OP777888999
6,Ana,Rodriguez,1987-11-25,ana.rodriguez@example.com,987 Cedar St,Anothertown,Anotherstate,USA,24680,3333333333,DNI,MNO345,Casado,Chef,5500,App,Mobile,2024-07-01,OP000111222
7,Jorge,Hernandez,1975-09-05,jorge.hernandez@example.com,246 Birch St,Newtown,Newstate,USA,86420,4444444444,Pasaporte,PQR678,Divorciado,Diseñador,7500,Web,Online,2024-07-01,OP333444555
8,Sofía,Diaz,1995-04-12,sofia.diaz@example.com,135 Walnut St,Oldtown,Oldstate,USA,97531,5555555555,DNI,STU901,Viudo,Ingeniero,6000,App,Mobile,2024-07-01,OP666777888
9,Miguel,Ruiz,1983-02-28,miguel.ruiz@example.com,852 Cherry St,Freshtown,Freshstate,USA,15935,6666666666,Pasaporte,VWX234,Soltero,Piloto,9000,Web,Online,2024-07-01,OP999000111
10,Cristina,Flores,1991-08-18,cristina.flores@example.com,369 Spruce St,Newertown,Newerstate,USA,75315,7777777777,DNI,YZA567,Casado,Artista,4000,App,Mobile,2024-07-01,OP222333444

// === ARCHIVO: coleccion-postman/alta-cliente.postman_collection.json ===
{
  "info": {
    "name": "Alta de Cliente",
    "_postman_id": "12345678-1234-1234-1234-1234567890ab",
    "description": "Colección Postman para validar el flujo de alta de cliente en banca digital",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Crear Cliente",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\"Nombre\":\"Juan\",\"Apellido\":\"Perez\",\"FechaNacimiento\":\"1990-01-01\",\"Email\":\"juan.perez@example.com\",\"Direccion\":\"123 Main St\",\"Ciudad\":\"Anytown\",\"Estado\":\"Anystate\",\"Pais\":\"USA\",\"CodigoPostal\":\"12345\",\"NumeroTelefono\":\"1234567890\",\"TipoDocumento\":\"Pasaporte\",\"NumeroDocumento\":\"ABC123\",\"EstadoCivil\":\"Soltero\",\"Ocupacion\":\"Ingeniero\",\"IngresosMensuales\":5000,\"OrigenSolicitud\":\"Web\",\"Canal\":\"Online\",\"FechaSolicitud\":\"2024-07-01\",\"CodigoOperacion\":\"OP123456789\"}"
        },
        "url": {
          "raw": "https://api.bancadigital.com/clientes",
          "protocol": "https",
          "host": [
            "api",
            "bancadigital",
            "com"
          ],
          "path": [
            "clientes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "Verificar Idempotencia",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\"Nombre\":\"Juan\",\"Apellido\":\"Perez\",\"FechaNacimiento\":\"1990-01-01\",\"Email\":\"juan.perez@example.com\",\"Direccion\":\"123 Main St\",\"Ciudad\":\"Anytown\",\"Estado\":\"Anystate\",\"Pais\":\"USA\",\"CodigoPostal\":\"12345\",\"NumeroTelefono\":\"1234567890\",\"TipoDocumento\":\"Pasaporte\",\"NumeroDocumento\":\"ABC123\",\"EstadoCivil\":\"Soltero\",\"Ocupacion\":\"Ingeniero\",\"IngresosMensuales\":5000,\"OrigenSolicitud\":\"Web\",\"Canal\":\"Online\",\"FechaSolicitud\":\"2024-07-01\",\"CodigoOperacion\":\"OP123456789\"}"
        },
        "url": {
          "raw": "https://api.bancadigital.com/clientes",
          "protocol": "https",
          "host": [
            "api",
            "bancadigital",
            "com"
          ],
          "path": [
            "clientes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "Manejo de Errores",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\"Nombre\":\"Juan\",\"Apellido\":\"Perez\",\"FechaNacimiento\":\"1990-01-01\",\"Email\":\"juan.perez@example.com\",\"Direccion\":\"123 Main St\",\"Ciudad\":\"Anytown\",\"Estado\":\"Anystate\",\"Pais\":\"USA\",\"CodigoPostal\":\"12345\",\"NumeroTelefono\":\"1234567890\",\"TipoDocumento\":\"Pasaporte\",\"NumeroDocumento\":\"ABC123\",\"EstadoCivil\":\"Soltero\",\"Ocupacion\":\"Ingeniero\",\"IngresosMensuales\":5000,\"OrigenSolicitud\":\"Web\",\"Canal\":\"Online\",\"FechaSolicitud\":\"2024-07-01\",\"CodigoOperacion\":\"OP123456789\"}"
        },
        "url": {
          "raw": "https://api.bancadigital.com/clientes",
          "protocol": "https",
          "host": [
            "api",
            "bancadigital",
            "com"
          ],
          "path": [
            "clientes"
          ]
        }
      },
      "response": []
    }
  ]
}

// === ARCHIVO: README.md ===
# Alta de Cliente - Pruebas

## Descripción
Este proyecto contiene una colección de pruebas para validar el flujo de alta de cliente en un sistema de banca digital. Las pruebas están diseñadas para cubrir el riesgo del negocio y considerar los posibles escenarios de error.

## Instalación
1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu-usuario/alta-cliente-tests.git
   cd alta-cliente-tests
   ```
2. Instala las dependencias:
   ```bash
   npm install
   ```

## Ejecución
1. Ejecuta las pruebas:
   ```bash
   npm test
   ```
2. Genera un reporte de las pruebas:
   ```bash
   npm run test:report
   ```

## Estructura de Carpetas
- `datos/`: Contiene los datos de prueba en formato CSV.
- `coleccion-postman/`: Contiene la colección Postman para ejecutar las pruebas.
- `README.md`: Este archivo con las instrucciones para ejecutar las pruebas.

```
