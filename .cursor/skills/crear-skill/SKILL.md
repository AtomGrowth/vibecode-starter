---
name: crear-skill
description: Crear una guía propia (skill) para que la IA repita una tarea siempre igual. Úsala cuando la persona diga "quiero que siempre hagas X así", cuando repita la misma instrucción varias veces o cuando quiera compartir su forma de trabajar con el equipo.
---

# Crear tu propia skill

Una skill es un archivo de texto (`SKILL.md`) con instrucciones paso a paso. La IA la sigue cuando
lo que pides encaja con su descripción o cuando escribes `/nombre`. Sirve para dejar de repetir la
misma explicación: "los mensajes de outreach siempre en este tono", "los reportes siempre con estas
tres secciones".

## Paso 1. Encuentra la tarea que se repite

Pregunta: "¿Qué le explicas a la IA una y otra vez?". Una skill vale la pena si la tarea se hace
más de dos veces y siempre debería salir parecida. Una sola skill por tarea.

## Paso 2. Escribe la skill con la persona

Crea la carpeta y el archivo:

```
.cursor/skills/<nombre>/SKILL.md      (Cursor)
.claude/skills/<nombre>/SKILL.md      (Claude Code)
```

Mismo contenido en las dos. `<nombre>` en minúsculas, sin espacios ni acentos, con guiones:
`mensaje-outreach`, `reporte-semanal`.

Plantilla:

```markdown
---
name: mensaje-outreach
description: Escribir el primer mensaje a un prospecto con el tono de la empresa. Úsala cuando la persona pida un mensaje de outreach, un primer contacto o "escríbele a este prospecto".
---

# Mensaje de outreach

## Qué necesito antes de escribir
- Nombre, empresa y un dato concreto del prospecto (algo que publicó, un cambio en su empresa).
- Qué queremos que haga: responder, agendar, ver un enlace.

## Cómo lo escribo
1. Primera línea: el dato concreto del prospecto, nunca "espero que estés bien".
2. Segunda: en una frase, qué hacemos y para quién.
3. Tercera: la pregunta o el siguiente paso, uno solo.
4. Máximo 70 palabras. Tuteo. Sin signos de exclamación.

## Entrego
- Tres variantes con distinto ángulo. Señalo cuál recomiendo y por qué.

## Lo que no hago
- No invento datos del prospecto. Si falta el dato concreto, lo pido.
```

Lo que más importa es la **descripción**: dice qué hace y cuándo usarla, con las palabras que la
persona diría. Con eso la IA la activa sola.

## Paso 3. Prueba y ajusta

1. Escribe `/nombre` en el chat y pide algo real.
2. Si el resultado no es el esperado, no cambies el pedido: cambia la skill. Agrega el paso o la
   regla que faltó.
3. Repite dos o tres veces hasta que salga bien sin explicar nada extra.

## Paso 4. Compártela

La skill es un archivo: se manda, se copia a otro proyecto o se sube al repo del equipo. Si cambia
en una carpeta, copia el cambio a la otra (o corre `scripts/sincronizar-skills.sh`).

## Lo que no haces aquí

- No escribes skills largas: si pasa de una pantalla, probablemente son dos skills.
- No metes llaves, datos de clientes ni nada sensible dentro de una skill.
