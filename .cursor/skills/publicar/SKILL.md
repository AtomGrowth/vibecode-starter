---
name: publicar
description: Poner una app en internet con Vercel, primero como preview y después en producción, siempre con permiso explícito. Úsala cuando la persona diga "quiero que lo vean", "súbelo", "publícalo" o pregunte cómo compartir lo que construyó.
---

# Publicar: de tu compu a internet

Hasta ahora todo corre en localhost: solo lo ve la persona. Publicar es sacarlo a una URL. Se hace
en dos etapas: **preview** (ensayo general, URL para el equipo) y **producción** (concierto, lo ve
todo el mundo). Nada llega a producción sin un sí explícito.

## Antes de publicar

Revisa en voz alta, punto por punto:

- ¿Funciona en localhost lo que se va a publicar? Si no, `/arreglar` primero.
- ¿Está guardado? Si hay cambios sin commit, `/guardar`.
- ¿Hay llaves en el código? No debe haber ninguna. Las llaves van en el panel de Vercel
  (`/secretos`).
- ¿Hay datos de clientes en el proyecto (archivos, semillas, capturas)? Fuera antes de subir.
- ¿La persona tiene cuenta en Vercel y en GitHub? Si no, guía la creación; ella se registra, tú no
  manejas credenciales.

## Etapa 1. Preview

Vercel despliega desde GitHub: cada push a una rama crea un preview con su propia URL.

1. El repo tiene que estar en GitHub. Subirlo (push) requiere permiso: explica que el código quedará
   en su cuenta, propón repo privado y espera el sí. Si no quiere GitHub, la alternativa es el CLI
   de Vercel (`vercel`), que sube desde la carpeta; también con permiso.
2. En vercel.com, "Add New Project", importar el repo. Vercel detecta el framework solo.
3. Variables de entorno: en el panel del proyecto, pestaña de Environment Variables, la persona
   copia cada nombre de `.env.example` con su valor. Marca los entornos Preview y Production.
4. El primer deploy genera una URL. Ábrela con la persona y revisen juntas que funciona. Lo que
   falle aquí se arregla y se vuelve a subir; para eso existe el preview.

## Etapa 2. Producción

Solo cuando el preview esté bien y la persona diga explícitamente que quiere que lo vea el mundo.

- Con la integración de Git, integrar a la rama `main` despliega producción. Explica eso antes de
  hacer el merge y espera el sí.
- Dominio: por defecto es `nombre-del-proyecto.vercel.app`. Si quiere `algo.suempresa.com`, se
  agrega en Settings > Domains y hay que tocar el DNS de la empresa: eso lo coordina ella con quien
  administre el dominio; no lo hagas por tu cuenta.
- Confirma: "en producción, en esta URL. Si algo sale mal, se puede volver a la versión anterior en
  segundos".

## Si producción falla

En el panel de Vercel, en Deployments, se elige el deploy anterior que funcionaba y se "promueve" a
producción (Instant Rollback). No hace falta reconstruir. Después, `/arreglar` con calma en preview.

## Lo que no haces aquí

- No haces push, merge ni deploy sin permiso explícito para cada uno.
- No creas ni cambias registros DNS.
- No escribes llaves en ningún archivo del proyecto.
- No dices "publicado" sin haber abierto la URL y comprobado.
