---
name: retomar
description: Retomar un proyecto en una sesión nueva sin volver a explicar nada: lee la ficha del proyecto, las specs y el historial, y propone el siguiente paso. Úsala al abrir una conversación nueva sobre un proyecto que ya existe, o cuando la persona diga "¿en qué íbamos?", "sigamos" o "retoma".
---

# Retomar: en qué íbamos

La IA empieza cada conversación en blanco. Lo que se acordó vive en archivos y en el historial: la
ficha (`docs/proyecto.md`), las specs (`docs/specs/`) y las ramas y commits. Tu trabajo aquí es
leerlos, comprobar que cuentan la misma historia y decirle a la persona dónde está, en cuatro líneas.

## Paso 1. Lee la ficha y revisa lo pendiente

1. `git status`. Si hay cambios sin guardar, esto va primero: di qué archivos son y en qué rama
   están, y pregunta si se guardan (`/guardar`) o eran una prueba. No sigas hasta resolverlo.
2. Lee `docs/proyecto.md` tal como está en `main` (`git show main:docs/proyecto.md` si estás en otra
   rama): la ficha solo se edita ahí.

Si no hay ficha, este proyecto no tiene memoria escrita. Dilo sin drama: "este proyecto todavía no
tiene ficha; si quieres, la armo a partir de lo que ya hay". Con el sí, revisa la carpeta y el
historial, propón la ficha con el formato de `plantillas/proyecto.md` y guárdala en `main` solo
cuando la apruebe. Después sigue con `/empezar` para la siguiente feature.

## Paso 2. Averigua en qué va cada feature

Para cada spec de la tabla de Features, aplica las reglas de "Dónde se edita y cómo se sabe en qué
va cada feature" de `plantillas/proyecto.md`, en su orden:

1. Su spec en `main` dice `Estado: abandonada`: abandonada.
2. Su rama `feature/NNN-nombre` ya está integrada a `main` (`git branch --merged main`): terminada.
3. Su rama existe y no está integrada: en construcción. Si la spec de esa rama ya dice
   `Estado: terminada`, está lista pero falta integrarla: dilo así, y el siguiente paso es `/publicar`
   (o integrarla sin publicar), no `/construir`.
4. No tiene rama: aprobada, sin empezar.

La activa es la que está en construcción. Si hay más de una, no elijas tú: pregunta cuál. Si no hay
ninguna en construcción, la siguiente es la primera aprobada sin empezar.

Una abandonada nunca es la activa. Si la persona quiere retomarla, es decisión suya y va así:

1. Recuérdale por qué se dejó (lo dice "Aprendizajes y pendientes") y pregunta si eso cambió.
2. Muéstrale el cambio exacto: en la spec en `main`, `Estado: abandonada` pasa a `Estado: aprobada`,
   y en la ficha se anota en una línea por qué se retoma. Espera el sí.
3. Con el sí, cámbiate a `main` (si hay cambios sin guardar, para y resuélvelos antes): aplica los dos cambios y
   propón `/guardar`.
4. Sigue con `/construir`, que retoma desde la rama que se quedó.

## Paso 3. Lee la spec activa desde su rama

El avance vive en la rama, no en `main`. Lee la spec con
`git show feature/NNN-nombre:docs/specs/NNN-nombre.md` (o cámbiate a la rama si la persona quiere
seguir ya; si hay cambios sin guardar, para y resuélvelos antes), y mira `git log --oneline main..feature/NNN-nombre`:
qué se guardó en esa feature.

## Paso 4. Compara la spec con la realidad

Las casillas de la spec y el historial de la rama tienen que contar lo mismo. Busca dos cosas:

- **Una casilla marcada `[x]` sin un commit que la respalde.** Puede ser un paso que se dio por hecho
  y nunca se guardó.
- **Código guardado de un paso cuya casilla sigue vacía.** Puede ser un paso hecho y no marcado.

Si encuentras una diferencia, no adivines cuál de los dos tiene razón ni la corrijas por tu cuenta.
Cuéntala en una frase ("la spec dice que el paso 2 está hecho, pero no encuentro nada guardado del
botón") y pregunta qué pasó. Corrige la spec o el código solo con el sí.

## Paso 5. Reporta en cuatro líneas

- **Proyecto**: qué es, en una frase (de la ficha).
- **Feature**: en cuál spec van y su rama.
- **Hecho**: los pasos marcados, en palabras.
- **Siguiente**: el primer paso sin marcar, qué va a ver la persona al terminarlo y qué criterio
  cumple. Si todos están marcados, el siguiente es comprobarla con `/probar` o, si la spec ya dice
  `terminada`, integrarla con `/publicar`.

Pregunta: "¿Seguimos con eso?". Con el sí, pasa a la skill que toca.

## Si no queda nada en construcción ni aprobado: cerrar el ciclo

Antes de proponer algo nuevo, mira atrás con la persona. Tres preguntas, de una en una:

1. ¿Se está usando? ¿Quién y cada cuánto?
2. ¿Resolvió el problema? Compáralo con "Cómo sabremos que funciona" de la ficha.
3. ¿Qué sigue? Algo que mejorar, algo que falta (revisa las secciones "Para después" de las specs
   terminadas), o nada: "ya cumplió" también es una respuesta.

Anota las respuestas en "Aprendizajes y pendientes" de la ficha, en `main` y con su sí, y propón
`/guardar`. Si algo sigue, pasa a `/empezar` para escribir la spec siguiente.

## Si la spec ya no refleja lo que se quiere

A veces, al volver, la persona ya quiere otra cosa. No construyas sobre una spec vieja: propón el
cambio en la spec (un criterio, un paso, el alcance), espera el sí y solo entonces sigue, en la rama
de esa feature.

## Lo que no haces aquí

- No construyes ni cambias código.
- No tocas la ficha ni la spec sin aprobación, y la ficha solo en `main`.
- No descartas cambios sin guardar ni cambias de rama sin preguntar.
