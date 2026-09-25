---
name: empezar
description: Decidir qué construir y tener un plan corto antes de tocar código. Úsala cuando la persona tenga una idea, un problema o un "quiero hacer X" y todavía no haya nada construido.
---

# Empezar: del problema al plan

Tú no construyes todavía. Primero ayudas a pensar. El objetivo es salir de aquí con una decisión
clara (construir o no) y, si es que sí, una spec aprobada y guardada en el proyecto.

## Paso 1. Escucha el problema, no la solución

Pide que te cuenten el problema en sus palabras. Si te dan una solución ("hazme un HTML con un
formulario"), pregunta qué problema resuelve eso. Reformula el problema en una frase y confirma:
"¿Es esto lo que te pasa?".

## Paso 2. Las 4 preguntas

Hazlas de una en una, en español simple. No sigas hasta tener respuesta.

1. ¿El problema es real y se repite? ¿O pasó una sola vez?
2. ¿Ya existe algo que lo resuelve? Busca antes de construir desde cero (usa `/investigar`).
   Una herramienta que ya existe casi siempre gana a construir una nueva.
3. ¿Vale la pena? Construir y mantener cuesta. ¿Cuánto tiempo ahorra por semana?
4. ¿Quién lo va a usar después? Si solo lo entiende la IA, no sirve.

Si alguna respuesta dice "no vale la pena", dilo con claridad y propón la alternativa más simple
(una hoja de cálculo, una plantilla, una herramienta que ya existe). No construir también es un
buen resultado.

## Paso 3. La ficha del proyecto (solo la primera vez)

Si ya existe `docs/proyecto.md`, léela y salta al paso 4: esta es una feature nueva de un proyecto que
ya existe.

Si no existe, explica por qué hace falta: "la IA no recuerda nada entre conversaciones; esta ficha es
la memoria del proyecto". Llénala con la persona usando `plantillas/proyecto.md`. Dos partes que
decides tú y explicas en español simple:

- **Nivel de riesgo**: ubícalo en la escalera (`guia/escalera-de-riesgo.md`). Si cae en rojo o
  negro (pagos, datos sensibles, permisos, infraestructura), dilo y recomienda revisión técnica
  antes de construir. Verde y amarillo se pueden hacer aquí.
- **Con qué está hecho**: propón lo más simple, popular y bien documentado que resuelva el problema,
  y di por qué en una frase. Queda escrito para que nadie lo cambie a mitad del camino sin decidirlo.

## Paso 4. La spec de la feature

Escribe el plan con el formato de `plantillas/brief-ejecutable.md`: problema, resultado esperado,
quién lo usa, alcance, qué NO cambiar, criterios numerados (C1, C2...) con la forma
"Cuando..., entonces..." y de 3 a 6 pasos con casilla, cada uno ligado a su criterio.

- Número: el siguiente libre en `docs/specs/` (001 si es la primera). Nombre corto, en minúsculas y
  con guiones: `001-landing-campana`.
- Rama: `feature/` más el mismo número y nombre. Todavía no se crea; eso pasa en `/construir`.
- Si un criterio no se puede comprobar mirando el resultado ("que se vea profesional"), no es un
  criterio: pregunta qué vería la persona para saber que ya está.
- Si esta feature necesita algo de otra que todavía no está `terminada` e integrada (por ejemplo,
  copiar una página que sigue a medias), dilo: primero se termina e integra esa, y después se
  arranca esta.
- Anota también **qué necesitas de ella**: textos, datos, una cuenta, una llave (que ella gestiona,
  no tú).

Muéstrale la spec completa en el chat, en español simple, y pregunta: "¿Así? ¿Cambiamos algo?".
Ajusta hasta que diga que sí.

## Paso 5. Guardar la spec y arrancar

La ficha y las specs son la memoria del proyecto y viven en `main`, la línea principal, para que
cualquier feature nueva las encuentre. Con el sí:

1. Si la carpeta ya tiene historial (hay `.git`), revisa en qué rama estás. Si no es `main`, revisa
   `git status`: si hay cambios sin guardar, para y resuélvelos con la persona (`/guardar` en su
   rama) antes de moverte. Luego `git switch main`.
2. Guarda la spec en `docs/specs/NNN-nombre.md` con `Estado: aprobada`, y agrégala a la tabla de
   Features de `docs/proyecto.md`. Explica: "lo dejo escrito en tu proyecto; así, aunque cierres
   esto, la próxima vez sabemos en qué íbamos".
3. Propón `/guardar` para dejar la ficha y la spec en `main`.
4. Pregunta: "¿Empezamos con el paso 1?". Solo con el sí, pasa a `/construir`.

## Lo que no haces aquí

- No escribes código ni instalas nada. Los únicos archivos que creas son la ficha y la spec, y solo
  después de que la persona los aprobó.
- No propones diez ideas: una, la más simple que resuelva el problema.
- No usas jerga sin explicarla en la misma frase.
