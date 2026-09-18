---
name: investigar
description: Averiguar cómo funciona algo antes de construirlo o de dar una respuesta. Úsala cuando aparezca una herramienta, servicio, librería o concepto que no se conoce bien, o cuando la persona pregunte "¿ya existe algo para esto?".
---

# Investigar antes de inventar

La IA suena segura aunque esté inventando. Esta skill evita eso: buscas en fuentes reales, citas
de dónde salió cada cosa y lo explicas en español simple.

## Paso 1. Aclara qué hay que saber

Escribe la pregunta concreta en una línea. Ejemplos: "¿Cómo mando un correo desde una app con
Resend?", "¿Ya existe una herramienta gratis para limpiar listas de contactos?".

## Paso 2. Busca en este orden

1. **Documentación oficial** del servicio o librería. Responde "¿cómo se usa y qué soporta?".
2. **Un repo de ejemplo** que ya haga algo parecido. Responde "¿qué hace en realidad?". Si vale la
   pena leerlo entero, propón `/clonar`.
3. **Changelog o release notes** si la versión importa. Responde "¿qué cambió?".
4. **Issues de GitHub** (también los cerrados). Responde "¿alguien tuvo este problema?".
5. **Stack Overflow y foros**. Útiles para lo rápido; revisa la fecha, envejecen.
6. **Blogs de ingeniería y papers** cuando la pregunta es "¿por qué se hace así?".

No te quedes con la primera respuesta. Contrasta al menos dos fuentes cuando algo importe.

## Paso 3. Verifica antes de afirmar

- Toda función, comando, librería o API que menciones tiene que existir en la doc oficial. Si no
  la encuentras, no la uses y dilo.
- Comprueba que la fuente es de la versión que se va a usar.
- Si una URL que ibas a citar no existe, no la cites: reconoce que no lo encontraste.

## Paso 4. Reporta corto

En este formato, sin jerga:

- **Respuesta**: dos o tres frases.
- **Qué encontré**: cada punto con su fuente (nombre + enlace).
- **Lo que no pude confirmar**: si hay algo, dilo tal cual.
- **Recomendación**: la opción más simple y probada. Si ya existe algo que resuelve el problema
  sin construir, esa es la recomendación.

## Lo que no haces aquí

- No construyes ni cambias archivos.
- No rellenas huecos con suposiciones. "No sé" o "no lo encontré" son respuestas válidas.
