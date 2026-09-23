# Diseño de casos de prueba para alta de cliente

Diseña y documenta casos de prueba que cubran el riesgo del negocio durante el flujo de alta de cliente en un sistema de banca digital. Debes identificar y documentar los casos de prueba que no solo cubren el camino feliz, sino también los posibles riesgos y escenarios de error. Los casos de prueba deben ser trazables y deben considerar los siguientes actores: originador de créditos, motor antifraude, buró de riesgos, core bancario, gateway de pagos, sistema de liquidación, agente de retención y consolidador contable. El sistema debe manejar un volumen de 1 500 solicitudes por segundo en hora pico y garantizar la idempotencia del registro de la solicitud por número de operación y canal, asegurando que dos invocaciones con la misma clave produzcan un solo registro y devuelvan la misma respuesta dentro de una ventana de 24 horas.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Diseño de casos de prueba a partir de riesgo |
| **Nivel** | junior-l1 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Node.js 18+, npm, VS Code o similar.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Ejecuta `npm install && npm run build` (o `npm start`). Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Identificación de riesgos y escenarios

**Objetivo:** Identificar los riesgos y escenarios de error durante el flujo de alta de cliente

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Analiza el flujo de alta de cliente y enumera los posibles riesgos y escenarios de error.
- Identifica los actores involucrados y sus interacciones.
- Documenta los casos de prueba que cubren estos riesgos y escenarios.

**Entregable:** Documento que enumera los riesgos y escenarios de error, y describe los casos de prueba correspondientes.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los diferentes tipos de errores que pueden ocurrir en cada interacción entre los actores.
- Piensa en cómo el sistema debe responder a cada error para minimizar el riesgo.

</details>

### Fase 2: Diseño de casos de prueba

**Objetivo:** Diseñar casos de prueba que cubran los riesgos y escenarios identificados

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Usa la documentación de la fase anterior para diseñar casos de prueba específicos.
- Asegúrate de que los casos de prueba sean trazables y cubran tanto el camino feliz como los escenarios de error.
- Documenta cada caso de prueba con detalle, incluyendo los pasos a seguir y los resultados esperados.

**Entregable:** Documento que detalla los casos de prueba diseñados, incluyendo los pasos y resultados esperados.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la idempotencia del registro de la solicitud y cómo garantizarla en cada caso de prueba.
- Piensa en cómo el sistema debe manejar diferentes tipos de errores y fallos.

</details>

### Fase 3: Revisión y mejora de casos de prueba

**Objetivo:** Revisar y mejorar los casos de prueba diseñados

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Revisar los casos de prueba diseñados en busca de posibles mejoras.
- Identificar y documentar cualquier brecha o riesgo adicional que no haya sido cubierto.
- Mejorar la documentación de los casos de prueba para asegurar su trazabilidad y claridad.

**Entregable:** Documento revisado y mejorado de casos de prueba, incluyendo cualquier brecha o riesgo adicional identificado.

<details>
<summary>Pistas de conocimiento</summary>

- Considera la retroalimentación de colegas o expertos en el dominio para identificar posibles mejoras.
- Asegúrate de que la documentación sea clara y concisa para facilitar la trazabilidad.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué son los casos de prueba y por qué son importantes en el flujo de alta de cliente?
- **paraQueSirve**: ¿Para qué sirven los casos de prueba en el contexto del flujo de alta de cliente?
- **comoSeUsa**: ¿Cómo se usan los casos de prueba para cubrir los riesgos y escenarios de error en el flujo de alta de cliente?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir durante el flujo de alta de cliente y cómo se pueden cubrir con casos de prueba?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño de casos de prueba para el flujo de alta de cliente?

## Criterios de Evaluacion

- Identificación de riesgos y escenarios de error durante el flujo de alta de cliente.
- Diseño de casos de prueba que cubren tanto el camino feliz como los escenarios de error.
- Documentación clara y trazable de los casos de prueba.
- Revisión y mejora de los casos de prueba para asegurar su calidad y cobertura.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
npx --yes newman run coleccion.json --bail
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
