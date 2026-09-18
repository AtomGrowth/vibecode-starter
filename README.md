# Vibecode Starter

Tu punto de partida para construir tus propias cosas con IA, sin saber programar.
Tú traes el problema y el criterio; la IA trae el código.

> La IA no te quita el trabajo. Te quita la pausa en la que decidías si el problema valía la pena
> resolverse. Esa pausa, el criterio, sigue siendo tuya.

## Qué hay adentro

- `CLAUDE.md` / `.cursorrules`: las reglas de la casa. Le enseñan a la IA a tratarte como alguien
  que no es dev: te explica, va despacio y nunca borra ni publica sin preguntarte.
- `.cursor/skills/` y `.claude/skills/`: trece guías paso a paso que la IA sigue cuando le pides
  algo. Son las mismas en las dos carpetas: una para Cursor y otra para Claude Code.
- `guia/`: los fundamentos de la clase por escrito y la escalera de riesgo, para consultar.
- `plantillas/`: el brief ejecutable y la lista de "antes de publicar", para copiar y llenar.
- `ejemplos/`: ideas de primer proyecto pensadas para ventas y marketing.
- `presentacion/`: la clase completa en un HTML que abres con doble clic.
- `.env.example`: la plantilla de dónde van las llaves y contraseñas (nunca en el código).

No hay nada que instalar dentro de la carpeta.

## Cómo instalarlo

En **Cursor** y **Claude Code** las skills y las reglas se cargan solas al abrir la carpeta. En
**Claude web** el mecanismo es distinto (se arma un Proyecto con las reglas como instrucciones).

### Cursor (lo que usamos en la clase)

`Clone Repository` con la URL `https://github.com/AtomGrowth/vibecode-starter.git`, abre la carpeta,
y sigue los cinco pasos de abajo. Lee `.cursor/skills/` solo.

### Claude Code

Dos líneas en la terminal, clonar y entrar:

```bash
git clone https://github.com/AtomGrowth/vibecode-starter.git
cd vibecode-starter && claude
```

Al arrancar `claude` dentro de la carpeta se cargan las reglas (`CLAUDE.md`) y las 13 skills. Pega
esto como primer mensaje:

```
Estoy empezando a vibecodear y no soy técnica. Confírmame que cargaste las reglas
de la casa (CLAUDE.md) y lista las skills que tengo en .claude/skills, con una
línea de qué hace cada una, en español simple. No construyas ni modifiques nada
todavía: solo cuando yo diga /empezar, guíame paso a paso con las 4 preguntas.
```

### Claude web (claude.ai)

Aquí las skills no se cargan solas: eso es del editor local. La forma equivalente es un **Proyecto**
con las reglas como instrucciones:

1. claude.ai → **Projects** → **New project**.
2. Copia el contenido de `CLAUDE.md` y pégalo en **Set custom instructions** del proyecto.
3. Sube como Project knowledge las carpetas `guia/` y `plantillas/` (y las skills de `.claude/skills/`
   que más uses).

Pega esto en el primer mensaje del proyecto:

```
Estas instrucciones son mis reglas de la casa: trátame como alguien que no es
dev, explícame antes de hacer, ve una cosa a la vez y nunca borres, publiques ni
toques llaves sin preguntarme. Cuando te pida algo, primero aplica las 4 preguntas
antes de construir y sigue el método: problema (no solución) → investiga si ya
existe → plan corto que yo apruebo → construir en pasos. Empecemos: pregúntame qué
quiero lograr.
```

## Empezar en 5 pasos

1. Instala [Cursor](https://cursor.com). Es un editor de texto con la IA adentro. Gratis.
2. Abre esta carpeta en Cursor: `File > Open Folder > vibecode-starter`.
3. Abre el chat de la IA: `Cmd/Ctrl + L`.
4. Escribe `/empezar` y cuéntale, en español, qué quieres lograr. No un prompt perfecto: el
   problema real, como se lo contarías a un colega.
5. Ve paso a paso. La IA te propone, tú apruebas, ella construye, tú revisas. Repite.

## Las skills: qué escribir y cuándo

Escribe `/` en el chat y elige una. También se activan solas cuando lo que pides encaja.

| Cuando quieras...                                   | Escribe         |
| --------------------------------------------------- | --------------- |
| Decidir qué construir y tener un plan corto         | `/empezar`      |
| Averiguar cómo funciona algo antes de construirlo   | `/investigar`   |
| Traer a tu compu un proyecto de otro para aprender  | `/clonar`       |
| Construir, una cosa a la vez                        | `/construir`    |
| Comprobar que funciona de verdad, no solo bonito    | `/probar`       |
| Arreglar algo que se rompió                         | `/arreglar`     |
| Recuperar el control cuando todo se rompe y empeora | `/rescate`      |
| Guardar tu avance y poder volver atrás              | `/guardar`      |
| Manejar llaves, contraseñas y datos sensibles       | `/secretos`     |
| Conectar la IA a Slack, Gmail, una base de datos    | `/conectar`     |
| Crear tu propia guía para la IA                     | `/crear-skill`  |
| Crear un conector propio (MCP) sencillo             | `/crear-mcp`    |
| Poner tu app en internet                            | `/publicar`     |

El orden natural de un proyecto es de arriba hacia abajo.

## Antes de pedir algo, las 4 preguntas

1. ¿El problema es real y se repite?
2. ¿Ya existe algo que lo resuelve?
3. ¿Vale la pena construirlo y mantenerlo?
4. ¿Quién lo va a usar después de ti?

Si no tienes claras las respuestas, `/empezar` te ayuda a pensarlas antes de construir.

## Lo que este starter no hace

Aquí las reglas de seguridad ("nunca borres", "nunca publiques sin permiso") son texto que la IA
sigue, no candados técnicos. Funcionan bien en el día a día, pero no sustituyen a una persona
revisando antes de publicar algo que importa. Si algo te da duda, pregunta antes.

## Reglas

Están en `CLAUDE.md` y en `.cursorrules` (el que lee Cursor solo). Puedes editarlas: son tuyas.
Si quieres cambiar cómo te trata la IA, cambia ese archivo.

## Licencia

MIT (ver `LICENSE`). Puedes usarlo, copiarlo y adaptarlo libremente, conservando el aviso de
copyright.
