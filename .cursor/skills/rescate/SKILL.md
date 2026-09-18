---
name: rescate
description: Guía de emergencia cuando algo se rompió y hay que recuperar el control sin empeorarlo. Úsala cuando la app dejó de funcionar, salió un error que no se entiende, o la persona lleva varios intentos pidiendo arreglos y cada vez está peor.
---

# El rescate: recuperar el control

El error más caro del vibecode es encadenar prompts desesperados: "arréglalo", "sigue sin
funcionar", "ahora quedó peor". Cada intento a ciegas rompe más y enreda el proyecto. El guion es al
revés: primero se para, luego se diagnostica, luego se arregla en un lugar seguro.

## El guion, en orden

1. **Para.** No pidas otro arreglo improvisado. Dile a la persona: "vamos a detenernos y entender
   qué pasó antes de tocar nada más".
2. **Captura el error.** Copia el mensaje exacto (de la terminal o del navegador) y toma nota de qué
   se estaba haciendo justo antes: qué clic, qué comando, qué último cambio.
3. **Ubícate.** ¿Esto está en localhost, en preview o en producción? La respuesta cambia la urgencia
   y lo que se puede hacer.
4. **Si es producción, primero salva a los usuarios.** Vuelve al deployment anterior que funcionaba
   (rollback en el panel de Vercel: Deployments, elegir el bueno, promoverlo). No hace falta
   reconstruir. Con producción ya estable, se investiga con calma. Si no sabes hacer el rollback,
   este es momento de escalar a alguien técnico.
5. **Diagnostica con la IA, con datos.** Cuéntale qué cambiaste, qué esperabas, qué pasó y cómo
   reproducir el error. Pídele que explique la causa antes de proponer un arreglo. Si el error viene
   de algo que no conoces, `/investigar` la doc oficial y los issues del repo.
6. **Arregla en un lugar seguro.** El cambio va en una rama o en preview, nunca directo en
   producción. Cuando esté probado con `/probar`, recién ahí se vuelve a publicar con `/publicar`.

## Recuperar una versión anterior

Si lo que se rompió es que se perdió trabajo o un cambio dejó todo mal, no reconstruyas desde cero:
lo guardado sigue en el historial. Sigue `/guardar` para ver los commits y volver a la última foto
buena de forma segura (`git revert`, no `reset --hard`).

## Cuándo dejar de intentarlo sola

Escala a alguien técnico, sin pena, si: es producción y no sabes hacer rollback; el error toca
pagos, datos de clientes o permisos; llevas varios intentos y cada vez está peor; o el mensaje habla
de base de datos, migraciones o algo de la escalera de riesgo en rojo o negro (`guia/escalera-de-riesgo.md`).
Pedir ayuda a tiempo es criterio, no debilidad.

## Lo que no haces aquí

- No encadenas arreglos a ciegas.
- No experimentas en producción.
- No borras historial ni haces cambios grandes "a ver si así".
