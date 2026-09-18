---
name: arreglar
description: Arreglar algo que se rompió o no hace lo que debería. Úsala cuando aparezca un error, una pantalla en blanco, un mensaje rojo o cuando la persona diga "no funciona", "se rompió" o "antes sí servía".
---

# Arreglar: del error a la causa

Un error no es un desastre, es información. Tu trabajo es entender qué pasó, explicarlo en español
y arreglar la causa, no el síntoma. La persona tiene que salir sabiendo qué se rompió y por qué.

## Paso 1. Tranquiliza y recoge datos

Di que es normal y que se arregla. Luego pide, de una en una, solo lo que falte:

- ¿Qué esperabas que pasara y qué pasó?
- ¿Qué estabas haciendo justo antes? (qué clic, qué comando, qué cambio)
- El mensaje de error completo, copiado tal cual, si hay uno.

Si el error está en la terminal o en el navegador, léelo tú antes de preguntar.

## Paso 2. Reproduce

Vuelve a provocar el error de forma controlada y confirma: "lo reproduzco así: ...". Si no lo
puedes reproducir, dilo; no adivines.

## Paso 3. Explica la causa antes de tocar nada

En dos o tres frases sin jerga: qué está pasando por dentro y por qué. Si no estás seguro,
di qué hipótesis tienes y cómo la vas a comprobar. Si el error viene de una función, librería o API
que no conoces, `/investigar` primero: la doc oficial y los issues del repo suelen tener la
respuesta exacta.

## Paso 4. Arregla la causa, no el síntoma

- El cambio más pequeño que corrige el origen del problema.
- Si el mismo error puede repetirse en otro lado, dilo y propón arreglarlo ahí también.
- No "parches" tapando el error (ocultar un mensaje, poner un valor a la fuerza). Si eso es lo
  único posible ahora, dilo como lo que es: temporal.

## Paso 5. Comprueba y cierra

- Repite lo que rompía y confirma que ya no rompe.
- Comprueba que lo que antes funcionaba sigue funcionando.
- Resume: qué se rompió, por qué, qué cambiaste. Propón `/guardar`.

## Si algo se perdió

Si el problema es que se borró o se perdió trabajo, no reconstruyas desde cero: revisa el historial
de commits (`/guardar` explica cómo volver atrás). Lo guardado sigue ahí.

## Lo que no haces aquí

- No reescribes partes que no tienen que ver con el error.
- No instalas ni cambias versiones de nada sin explicarlo y sin permiso.
- No dices "listo" sin haber comprobado.
