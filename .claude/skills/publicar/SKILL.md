---
name: publicar
description: Poner una app en internet con Vercel, primero como preview y después en producción, o integrar una feature terminada a main, siempre con permiso explícito. Úsala cuando la persona diga "quiero que lo vean", "súbelo", "publícalo", "intégralo" o pregunte cómo compartir lo que construyó.
---

# Publicar: de tu compu a internet

Hasta ahora todo corre en localhost: solo lo ve la persona. Publicar es sacarlo a una URL. Se hace
en dos etapas: **preview** (ensayo general, URL para el equipo) y **producción** (concierto, lo ve
todo el mundo). Nada llega a producción sin un sí explícito.

Cada feature se construye en su rama (`feature/NNN-nombre`), y `main` es lo que ya funciona. Una
regla que hay que explicar antes de nada: **si el proyecto está conectado a Vercel, integrar a
`main` ES publicar a producción.** Por eso el preview sale de la rama, y `main` solo se toca en la
etapa 2.

## Antes de publicar

Recorre la lista completa de `plantillas/antes-de-publicar.md` con la persona. Es la Definition of
Done: si algo no está marcado, no se publica. Los puntos que nunca se saltan:

- ¿La feature está terminada? En su rama, la spec dice `Estado: terminada` y `/probar` pasó (caso
  feliz, error y límite). Si no, `/construir` o `/arreglar` primero.
- ¿Estás en la rama de la feature, no en `main`? (`git branch --show-current`)
- ¿Está guardado? Si hay cambios sin commit, `/guardar`.
- ¿Sabe la persona cómo volver a la versión anterior si algo sale mal?
- ¿Hay llaves en el código? No debe haber ninguna. Las llaves van en el panel de Vercel
  (`/secretos`).
- ¿Hay datos de clientes en el proyecto (archivos, semillas, capturas)? Fuera antes de subir.
- ¿La ficha y las specs están limpias? Son texto escrito a mano que se sube con el repo, en todas
  sus versiones. Antes de cada push corre el paso 0 de la etapa 1; no basta con leer los archivos
  abiertos, porque cada rama y cada commit tienen su propia versión.
- ¿En qué nivel de la escalera de riesgo está esto (`guia/escalera-de-riesgo.md`)? Si es rojo o
  negro, no se publica sola: revisión técnica antes.
- ¿La persona tiene cuenta en Vercel y en GitHub? Si no, guía la creación; ella se registra, tú no
  manejas credenciales.

## Etapa 1. Preview, desde la rama

Vercel despliega desde GitHub: cada push a una rama que no es `main` crea un preview con su propia
URL.

0. **Antes de cada push: busca datos personales en todo lo que se va a subir.** Cada feature trae su
   spec nueva, así que esto no es solo la primera vez. Corre (revisa todos los commits que todavía no
   están en GitHub, de todas las ramas; la primera vez, eso es todo el historial):
   `git log -p --branches --not --remotes -- docs/ | grep -nE '^\+.*([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|\+?[0-9][0-9 ()-]{7,}[0-9])'`
   Revisa cada resultado con la persona: el número de WhatsApp de la campaña puede ser correcto; un
   correo o teléfono de un cliente o colega no. Si hay alguno, no se sube: aunque se borre en un
   commit nuevo sigue en el historial. Explícaselo así y escala a alguien técnico antes de subir. No
   reescribas el historial tú (nada de `reset`, `rebase` ni herramientas que borren commits), aunque
   ella te lo pida.
1. El repo tiene que estar en GitHub. Subirlo (push) requiere permiso: explica que el código quedará
   en su cuenta, propón repo privado y espera el sí. La primera vez se sube `main` (la foto base y
   las specs) y después la rama. Si no quiere GitHub, la alternativa es el CLI de Vercel (`vercel`),
   que sube desde la carpeta y crea un preview; también con permiso.
2. Si el proyecto todavía no está en Vercel: en vercel.com, "Add New Project", importar el repo.
   Vercel detecta el framework solo. Avisa: al importar, Vercel publica lo que hay en `main`; como
   `main` todavía no tiene la feature, esa primera URL de producción mostrará poco o nada. Es normal y
   nadie la conoce aún.
3. Variables de entorno: en el panel del proyecto, pestaña de Environment Variables, la persona
   copia cada nombre de `.env.example` con su valor. Marca los entornos Preview y Production.
4. Sube la rama de la feature, con permiso: `git push -u origin feature/NNN-nombre`. Vercel crea el
   preview de esa rama. Nunca subas `main` para "probar": eso es producción.
5. Abre la URL del preview con la persona y revisen juntas que funciona. Lo que falle aquí se arregla
   en la rama y se vuelve a subir; para eso existe el preview.

## Etapa 2. Producción: integrar la rama a `main`

Solo cuando el preview esté bien y la persona diga explícitamente que quiere que lo vea el mundo.
Antes, dilo con estas palabras: "integrar esta rama a `main` la publica en producción".

La forma recomendada deja el último clic en sus manos:

1. Abre un pull request de la rama a `main`: con `gh pr create` si está instalado, o desde GitHub
   (aparece un botón "Compare & pull request" después del push). Explica: "es la propuesta de pasar
   esta feature a lo que ya funciona".
2. La persona revisa y aprieta "Merge" ella misma. Vercel despliega producción solo.
3. En la compu: `git switch main` y `git pull`, para que `main` local tenga la feature.

Si GitHub avisa de un conflicto (dos cambios en las mismas líneas) y no deja integrar, no adivines
qué choca: míralo de verdad, en la rama de la feature.

1. `git status`. Si hay cambios sin guardar, para: di qué archivos son y resuélvelo con la persona
   (`/guardar`, o descartarlos solo con su sí) antes de seguir. Con todo guardado,
   `git switch feature/NNN-nombre`, `git fetch origin`
   y `git merge origin/main`. Git marca el choque en los archivos.
2. Explica en palabras qué choca (qué archivo, qué parte), con las dos versiones que git marcó, y que
   ella elija. Si no quiere decidir ahora, `git merge --abort` deja la rama como estaba.
3. Con su elección, deja el archivo como ella dijo y propón `/guardar`. Antes de subir, repite el
   paso 0 de la etapa 1: resolver el choque pudo meter texto nuevo en `docs/`. Luego sube la rama
   (con permiso).
   El pull request se actualiza solo, y ella vuelve a apretar "Merge".

Si no queda claro, `/rescate`.

- Dominio: por defecto es `nombre-del-proyecto.vercel.app`. Si quiere `algo.suempresa.com`, se
  agrega en Settings > Domains y hay que tocar el DNS de la empresa: eso lo coordina ella con quien
  administre el dominio; no lo hagas por tu cuenta.
- Confirma: "en producción, en esta URL. Si algo sale mal, se puede volver a la versión anterior en
  segundos".

## Integrar sin publicar

Si el proyecto no está en Vercel ni en GitHub (solo vive en la compu), integrar a `main` no publica
nada: solo declara que la feature ya es parte de lo que funciona. Igual se pide el sí:

1. `git status`. Si hay cambios sin guardar, para: di qué archivos son y resuélvelo con la persona
   (`/guardar`, o descartarlos solo con su sí) antes de seguir. Sin eso, `git merge --abort` no
   podría dejar todo como estaba.
2. `git switch main` y `git merge --no-ff feature/NNN-nombre -m "Integra NNN: [nombre]"`.
3. Si git avisa de un conflicto, no lo resuelvas tú. Primero `git merge --abort`: deja `main` exactamente
   como estaba. Después explica en palabras qué choca (qué archivo, qué parte), muéstrale las dos
   versiones y que ella elija. Solo con su decisión se vuelve a integrar, aplicando lo que eligió. Si
   no queda claro, `/rescate`.

Con la feature integrada, ya cuenta como terminada. Propón `/retomar` para cerrar el ciclo o
`/empezar` para la siguiente.

## Si producción falla

En el panel de Vercel, en Deployments, se elige el deploy anterior que funcionaba y se "promueve" a
producción (Instant Rollback). No hace falta reconstruir. Después, `/arreglar` con calma en la rama
de la feature y un preview nuevo.

## Lo que no haces aquí

- No haces push, merge ni deploy sin permiso explícito para cada uno.
- No subes `main` para probar ni integras una rama sin que la persona lo pida.
- No creas ni cambias registros DNS.
- No escribes llaves en ningún archivo del proyecto.
- No dices "publicado" sin haber abierto la URL y comprobado.
