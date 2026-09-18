---
name: secretos
description: Manejar llaves (API keys), contraseñas y datos sensibles sin exponerlos. Úsala cuando un servicio pida una llave, cuando aparezca un archivo .env, cuando la persona pegue una llave en el chat o cuando sospeche que una se filtró.
---

# Secretos: llaves y contraseñas

Una llave es como la tarjeta corporativa: identifica a la persona ante un servicio y, si se filtra,
alguien puede gastar su cuota, generar cargos o llegar a datos de clientes. Tu regla: tú nunca ves,
escribes ni mueves una llave. La persona la pone donde va, y tú le dices dónde.

## Dónde van las llaves

- En un archivo `.env` en la raíz del proyecto, una por línea: `NOMBRE=valor`.
- `.env` está en `.gitignore`, así que nunca se guarda ni se sube. Compruébalo antes del primer
  commit; si no está, agrégalo.
- `.env.example` lleva solo los nombres, sin valores, para saber qué hace falta. Ese sí se guarda.
- En producción (Vercel), las llaves se ponen en el panel del proyecto, una por entorno. El código
  las lee con `process.env.NOMBRE` y no sabe de dónde vienen.

## Cuando un servicio pide una llave

1. Explica para qué es y qué permisos necesita. Pide el permiso mínimo: si solo hay que leer, que
   la llave no pueda escribir ni borrar.
2. Di dónde generarla (la sección "API keys" del servicio) y con qué nombre guardarla en `.env`.
3. Pide que la pegue en `.env`, no en el chat. Si la pega en el chat, dilo de inmediato: "esa llave
   ya quedó expuesta aquí; genera otra y borra esta en el servicio".
4. En el código, usa la variable de entorno. Nunca escribas el valor.

## Si una llave se filtró

Se filtró si: se pegó en un chat, se subió a Git (aunque se haya borrado después), apareció en una
captura de pantalla o la vio alguien que no debía. Git no olvida: borrar la línea en un commit nuevo
no la quita del historial.

1. Invalida la llave en el servicio (borrarla o "revocar") y genera otra. Esto es lo único que de
   verdad la protege.
2. Actualiza el valor en `.env` y en el panel de producción.
3. Si se subió a Git, avisa que sigue en el historial y que por eso el paso 1 no era opcional.

## Datos de clientes

Nombres, correos, teléfonos y cualquier dato personal se tratan igual que una llave: no se pegan
en el chat, no se guardan en el repo, no se mandan a servicios sin saber qué hacen con ellos. Para
probar, usa datos inventados.

## Lo que no haces aquí

- No pides que te manden una llave "para probar".
- No escribes una llave en ningún archivo que no sea `.env`.
- No guardas ni subes `.env`.
