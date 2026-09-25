---
name: guardar
description: Guardar el avance con un commit para poder volver atrás, y recuperar una versión anterior si algo se rompió. Úsala cuando algo quede funcionando, cuando la persona diga "guarda esto" o "quiero volver a como estaba", o antes de un cambio grande.
---

# Guardar: commits y volver atrás

Un commit es una foto del proyecto con nombre y fecha. Es lo que permite equivocarse sin miedo:
siempre se puede volver a la última foto buena. Aquí guías paso a paso; no asumas que la persona
sabe usar Git.

## Cuándo guardar

- Cada vez que algo queda funcionando, aunque sea pequeño.
- Antes de un cambio grande o de probar algo arriesgado.
- Al terminar la sesión de trabajo.

Si ya pasó un rato sin guardar y hay cambios, propónlo tú.

## Primera vez en un proyecto

Si la carpeta todavía no tiene historial (no hay carpeta `.git`), explica que vas a activarlo y
que eso no sube nada a internet: `git init -b main` (así la línea principal se llama `main` en
cualquier computadora). Comprueba que `.gitignore` existe y que incluye `.env`
y `node_modules/` antes del primer commit. Ese primer commit es la foto base en `main` y lleva todo lo
que ya hay en la carpeta: es la única vez que se guarda en `main` algo que no es `docs/`. A partir de
ahí, lo nuevo se construye en ramas.

## Ramas: un borrador por feature

Una rama es un borrador paralelo: se trabaja ahí sin tocar lo que ya funciona, que vive en `main`.
Cada spec tiene su rama, con el mismo número: `feature/001-landing-campana`.

- **Ver en cuál estás**: `git branch --show-current`. Díselo a la persona antes de guardar.
- **Crear la de una feature**: la crea `/construir` al empezar una spec aprobada.
- **Cambiarte a otra**: `git switch <rama>`. Antes, guarda o descarta lo pendiente; si hay cambios
  sin guardar, avisa y pregunta.
- **Integrar a `main`**: es decidir que la feature ya es parte de lo que funciona. Se hace con
  `/publicar`, con un sí explícito, porque si el proyecto está conectado a Vercel integrar a `main`
  lo publica.

## Cómo guardar

1. Revisa en qué rama estás. En `main` solo se guardan la ficha y las specs nuevas (`docs/`), salvo
   la foto base del primer commit. Si es `main`, ya hay historial y hay código nuevo, para: eso va
   en la rama de su feature.
2. Muestra qué cambió, en palabras: "cambiaron estos tres archivos: ...". Comando por debajo:
   `git status` y, si hace falta detalle, `git diff`.
3. Revisa que no haya llaves ni datos de clientes en lo que se va a guardar. Si aparece un `.env`
   o una llave, para y avisa: eso no se guarda nunca.
4. Guarda con un mensaje que diga qué se logró y por qué, en español, corto:
   `git add -A` y `git commit -m "Formulario de contacto envía a WhatsApp"`.
5. Confirma: "guardado. Si algo se rompe, podemos volver a este punto".

Un commit por cosa lograda. No mezcles dos cambios distintos en uno. Si hay una spec en
construcción, la casilla del paso terminado va en el mismo commit que su código.

## Cómo volver atrás

Primero pregunta qué quiere la persona:

- **Ver el historial**: `git log --oneline`. Léelo en voz alta como una lista de fotos.
- **Descartar cambios sin guardar y volver a la última foto**: `git restore .` Avisa antes: lo que
  no estaba guardado se pierde. Espera el sí.
- **Volver a una foto anterior sin borrar el historial**: `git revert <id>` crea una foto nueva
  que deshace aquella. Es la opción segura.
- Nunca uses `git reset --hard` ni reescribas el historial sin explicar exactamente qué se pierde
  y sin permiso explícito.

## Subir a GitHub

Guardar (commit) es local: nada sale de la computadora. Subir (push) es otra cosa y solo se hace si
la persona lo pide. Si lo pide, explica que el repo quedará en su cuenta de GitHub, confirma si debe
ser privado, y guía la creación del repo remoto antes del primer push. Antes de cada push, sigue el
paso 0 de la etapa 1 de `/publicar`: buscar datos personales en lo que se va a subir.

## Lo que no haces aquí

- No haces push ni creas repos remotos sin que lo pidan.
- No creas ramas fuera de la de cada feature, ni integras nada a `main` por tu cuenta.
- No guardas `.env`, llaves ni datos de clientes.
- No borras historial.
