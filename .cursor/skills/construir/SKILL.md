---
name: construir
description: Construir una cosa a la vez a partir de una spec aprobada, mostrando cada paso antes de seguir. Úsala cuando ya hay una spec (de /empezar) y la persona dice "vamos", "hazlo" o "empieza con el paso 1".
---

# Construir: una cosa a la vez

Tienes una spec aprobada en `docs/specs/`. Ahora la conviertes en algo que funciona, paso por paso,
sin sorpresas. La persona tiene que poder ver cada avance y entenderlo. La spec manda: es lo que se
acordó, y lo que no está en ella no se construye.

## Antes de tocar nada

- Lee `docs/proyecto.md` y ubica en `docs/specs/` la spec de esta feature. Si no hay spec, para y
  propón `/empezar`.
- La spec la lees completa después de ubicarte en su rama (sección siguiente). En `main` está tal
  como se aprobó; las casillas marcadas y los cambios viven en la rama.
- Si el paso necesita algo que no tienes (un texto, una cuenta, una llave), pídelo primero. Las
  llaves las pone la persona en `.env`; tú nunca las escribes ni las pides por el chat.

## Al empezar una feature: la rama

Lo que decide si la feature ya empezó es si su rama existe (`git branch --list feature/NNN-nombre`),
no el campo Estado.

**Si la rama ya existe**: revisa `git status`. Si hay cambios sin guardar, avisa y pregunta qué hacer
con ellos antes de moverte. Luego cámbiate a ella (`git switch feature/NNN-nombre`, sin `-c`).

**Si no existe**, es la primera vez:

1. Si la carpeta todavía no tiene historial (no hay `.git`), sigue primero la parte "Primera vez en
   un proyecto" de `/guardar`, para que exista una foto base en `main`.
2. Revisa `git status`. Si hay cambios sin guardar (por ejemplo, de otra feature), para: avisa, di
   qué archivos son y resuélvelo con la persona antes de seguir. Una rama nueva se los llevaría.
3. Cámbiate a `main` (`git switch main`): cada feature sale de lo que ya funciona, no de otra
   feature a medias.
4. Crea la rama con el nombre que dice la spec: `git switch -c feature/NNN-nombre`.
5. Cambia el estado de la spec a `en construcción` y propón `/guardar` para dejarla como primer
   commit de la rama.

Nunca construyas en `main`.

## El ciclo, por cada paso de la spec

1. **Di dónde estás y qué paso toca.** Empieza tu mensaje con la rama: "Estamos en la rama
   `feature/NNN-nombre`, el borrador de esta feature". La primera vez de cada feature, o si la
   persona no lo sabe, añade qué es: "un borrador paralelo; lo que ya funciona no se toca hasta que
   decidas integrarlo". Luego el paso: el primero sin marcar, qué vas a hacer, qué va a ver la
   persona al terminar y qué criterio (C1, C2...) cumple.
2. **Investiga si hace falta.** Si el paso usa algo que no conoces bien, `/investigar` primero.
   Prefiere lo simple y probado, y lo que dice "Con qué está hecho" en `docs/proyecto.md`. No
   agregues librerías que no pediste sin explicar para qué.
3. **Haz el cambio más pequeño que muestre avance.** Un archivo o dos, no diez.
4. **Muéstralo.** Explica en dos frases qué cambiaste y cómo verlo (qué abrir, qué comando, qué
   URL en localhost).
5. **Espera la revisión.** Pregunta "¿así?" y ajusta. No sigas al siguiente paso sin un sí.
6. **Marca y guarda.** Con el sí, cambia la casilla de ese paso a `[x]` en la spec y propón
   `/guardar`: el código del paso y su casilla van en el mismo commit.

## Si algo cambia a mitad del camino

La persona ve el resultado y quiere otra cosa, o descubres que un paso no se puede hacer como se
planeó. Primero se corrige la spec, después el código:

1. Explica qué cambia y por qué.
2. Propón el cambio en la spec (un criterio, un paso, el alcance) y espera el sí.
3. Actualiza la spec y sigue con el ciclo.

Si el cambio es grande (otra feature, no un ajuste), no lo metas aquí: anótalo al final de esta
spec, en "Para después", para una spec nueva con `/empezar` cuando esta termine. En la rama no se
toca `docs/proyecto.md`: la ficha solo se edita en `main`.

Si la persona decide no seguir con esta feature, no borres nada:

1. Propón `/guardar` para dejar en la rama lo que haya a medias, y espera a que quede guardado:
   `git status` sin cambios pendientes.
2. Cámbiate a `main`. Ahí, cambia el estado de la spec a `abandonada`, anota el porqué en
   "Aprendizajes y pendientes" de `docs/proyecto.md` y propón `/guardar`.
3. La rama se queda como está, por si algún día se retoma.

## Reglas mientras construyes

- Una cosa a la vez. Si la persona pide tres cosas de golpe, ordénalas y empieza por una.
- Nada de reescribir todo. Si crees que hace falta un cambio grande, explícalo y espera.
- Sin jerga sin explicar. Si dices "componente", di en la misma frase qué es.
- Si algo se rompe, no lo tapes: pasa a `/arreglar`.
- Nunca borres archivos, publiques ni cambies dependencias sin permiso explícito.

## Al terminar los pasos

1. Recorre los criterios uno por uno y di, para cada uno, cómo comprobarlo. Luego pasa a `/probar`.
2. Cuando `/probar` salga bien, cambia el estado de la spec a `terminada` y propón `/guardar`.
3. Resume en cinco líneas: qué se construyó, cómo se usa, qué quedó fuera a propósito y qué sería el
   siguiente paso natural (si la spec tiene "Para después", menciónalo). La feature queda terminada
   en su rama; pasa a ser parte de lo que funciona cuando se integra a `main` con `/publicar`, y
   solo si la persona quiere.
