# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Diseño de casos de prueba para alta de cliente**.

| | |
|---|---|
| Tema | Diseño de casos de prueba a partir de riesgo |
| Nivel | junior-l1 |
| Chapter | Calidad de Software |
| Especialidad | Funcional |
| Stack | Gherkin / BDD con Cucumber y Karate Framework |
| Patron arquitectonico | Patrón de diseño basado en riesgos con trazabilidad de requisitos y escenarios en Gherkin |
| Tiempo estimado | 8 horas |

## Receta del stack

Esqueleto obligatorio:

- `plan-de-pruebas.md con alcance, riesgos y criterios de entrada/salida`
- `casos/*.feature con escenarios en Gherkin y datos concretos`
- `coleccion Postman (.json) con requests y asserts`
- `matriz-de-trazabilidad.csv requisito -> caso`
- `datos-de-prueba.sql o .csv`

Dependencias:

- Postman n/a
- Newman n/a
- Karate Framework n/a
- Cucumber n/a

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `npx --yes newman run coleccion.json --bail` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `npx --yes newman run coleccion.json --bail` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Identificación de riesgos y escenarios**: Documento que enumera los riesgos y escenarios de error, y describe los casos de prueba correspondientes.
- **Fase 2 — Diseño de casos de prueba**: Documento que detalla los casos de prueba diseñados, incluyendo los pasos y resultados esperados.
- **Fase 3 — Revisión y mejora de casos de prueba**: Documento revisado y mejorado de casos de prueba, incluyendo cualquier brecha o riesgo adicional identificado.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Lo que falta y tenes que completar

### 1. Referencias colgando (3)

Salieron de un analisis estatico del codigo que SI esta en el repo. Cada una rompe la compilacion:

- [ ] `package.json` — `postman-to-karate@1.0.0`
      postman-to-karate declara la version 1.0.0, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.
- [ ] `package.json` — `karate-js@1.4.0`
      karate-js declara la version 1.4.0, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.
- [ ] `package.json` — `cucumber@10.2.1`
      cucumber declara la version 10.2.1, pero el registry de npm respondio que esa version no existe. Es una version inventada: reemplazala por una version publicada real, o si no se conoce con certeza, usa el mecanismo centralizado del ecosistema (BOM/parent/platform/version catalog) y no declares una version individual.

### Presentes (7)

- `package.json`
- `documentacion/plan-de-pruebas.md`
- `documentacion/matriz-trazabilidad.csv`
- `casos/alta-cliente.feature`
- `datos/datos-prueba.csv`
- `coleccion-postman/alta-cliente.postman_collection.json`
- `README.md`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `casos`
- `datos`
- `documentacion`
- `coleccion-postman`

## Verificacion

```bash
npx --yes newman run coleccion.json --bail
```

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **Patrón de diseño basado en riesgos con trazabilidad de requisitos y escenarios en Gherkin**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Calidad de Software, Especialidad Funcional, Tecnología Postman, Junior
- Brecha que el reto ataca: Diseña casos de prueba que cubren el riesgo del negocio y no solo el camino feliz, y los documenta de forma trazable
- Mision: Cubrir el flujo de alta de cliente

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
