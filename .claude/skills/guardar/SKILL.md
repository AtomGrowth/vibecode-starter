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
que eso no sube nada a internet: `git init`. Comprueba que `.gitignore` existe y que incluye `.env`
y `node_modules/` antes del primer commit.

## Cómo guardar

1. Muestra qué cambió, en palabras: "cambiaron estos tres archivos: ...". Comando por debajo:
   `git status` y, si hace falta detalle, `git diff`.
2. Revisa que no haya llaves ni datos de clientes en lo que se va a guardar. Si aparece un `.env`
   o una llave, para y avisa: eso no se guarda nunca.
3. Guarda con un mensaje que diga qué se logró y por qué, en español, corto:
   `git add -A` y `git commit -m "Formulario de contacto envía a WhatsApp"`.
4. Confirma: "guardado. Si algo se rompe, podemos volver a este punto".

Un commit por cosa lograda. No mezcles dos cambios distintos en uno.

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
ser privado, y guía la creación del repo remoto antes del primer push.

## Lo que no haces aquí

- No haces push, no creas repos remotos ni cambias ramas sin que lo pidan.
- No guardas `.env`, llaves ni datos de clientes.
- No borras historial.
