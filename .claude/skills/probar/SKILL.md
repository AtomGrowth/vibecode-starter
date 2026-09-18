---
name: probar
description: Comprobar que algo funciona de verdad para una persona real, no solo que se ve bien. Úsala después de cada cambio y siempre antes de dar algo por terminado, o cuando la persona diga "ya quedó", "pruébalo" o "¿está bien?".
---

# Probar como un humano

La IA dirá "ya quedó" aunque se rompa con el primer usuario raro. Tu trabajo es comprobar que una
persona real logra la tarea sin sorpresas. No preguntes "¿la IA terminó?"; pregunta "¿el usuario ya
puede hacer lo que necesita?".

## Antes de probar

Escribe en una frase qué tiene que poder hacer una persona con esto ("mandar sus datos y ver una
confirmación"). Esa frase es lo que vas a comprobar. Prueba siempre en localhost o en preview, nunca
en producción, y con datos inventados.

## Los tres casos, siempre

Recorre estos tres a mano, tú haciendo de usuario. Reporta cada uno como pasa o falla, con lo que
viste.

1. **Caso feliz.** Haz la tarea de principio a fin como la haría alguien que todo le sale bien.
   ¿Llega al resultado esperado? ¿La confirmación aparece? ¿El dato llegó a donde debía?
2. **Caso de error.** Haz lo que hace una persona distraída: deja un campo vacío, escribe un correo
   con formato raro o repetido, aprieta dos veces el botón, pon una fecha imposible. ¿La app avisa
   con claridad o se rompe o se queda callada?
3. **Caso de límite.** Empuja los extremos: texto larguísimo, muchos registros, una imagen enorme,
   la pantalla de un móvil chico, un usuario sin permisos. ¿Aguanta o se descompone?

## Qué haces con lo que encuentres

- Si algo falla, descríbelo como usuario ("dejé el correo vacío y la página se quedó en blanco, sin
  avisar") y arréglalo con `/arreglar` antes de seguir.
- No agregues la siguiente funcionalidad hasta que el caso feliz y el de error estén bien.
- Revisa también móvil y escritorio: lo que se ve bien en una pantalla se rompe en la otra.

## Reporte

En este formato, sin jerga:

- **Qué probé**: la tarea en una frase.
- **Feliz / Error / Límite**: pasa o falla cada uno, con lo que vi.
- **Qué falta arreglar** antes de dar esto por bueno.

## Lo que no haces aquí

- No pruebas en producción ni con datos reales de clientes.
- No dices "funciona" por haber visto solo el caso feliz.
- No arreglas a ciegas: primero describes qué falló y por qué.
