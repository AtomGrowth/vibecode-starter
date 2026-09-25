# Ficha del proyecto

La IA no recuerda nada de una conversación a otra. Esta ficha es la memoria del proyecto: la lee al
empezar cada sesión y así no tienes que volver a explicarle todo. Se escribe una vez, con `/empezar`,
y se guarda en tu proyecto como `docs/proyecto.md`. Cabe en una pantalla; si crece más, sobra algo.

```md
# [Nombre del proyecto]

## Qué es
[Una frase. Qué hace y para quién.]

## Para quién
[Rol o tipo de persona que lo usa.]

## Cómo sabremos que funciona
[Una sola métrica que se pueda mirar: envíos del formulario por semana, horas ahorradas, clics.]

## Nivel de riesgo
[Verde / Amarillo / Rojo / Negro, según guia/escalera-de-riesgo.md, y por qué.]

## Con qué está hecho
[Las herramientas elegidas y por qué, en español simple. Ej.: "Next.js para las páginas, porque es
popular y la IA lo conoce bien; Vercel para publicarlo".]

## Dónde vive
- Carpeta: [ruta en tu computadora]
- Repo: [URL de GitHub, si lo subiste]
- Preview: [URL, cuando exista]
- Producción: [URL, cuando exista]

## Dueña
[Quién decide y quién lo mantiene.]

## Reglas de este proyecto
- [Algo propio de este proyecto que la IA debe respetar siempre. Ej.: "los textos van en tuteo".]

## Features
| Spec | Qué hace |
| --- | --- |
| 001-[nombre] | [una frase] |

## Aprendizajes y pendientes
- [Lo que salió de usarlo: si resolvió el problema, qué sigue, qué quedó a medias.]
```

## Dónde se edita y cómo se sabe en qué va cada feature

La ficha vive en `main`, la línea principal, y solo se edita ahí. La tabla de Features no dice en qué
va cada una a propósito: ese dato cambia en la rama de cada feature, y si también se anotara aquí
habría dos versiones que no coinciden. El estado real lo dice el historial, y la IA lo averigua con
estas reglas, en este orden (la primera que se cumple manda):

1. La spec en `main` dice `Estado: abandonada`: se dejó, aunque su rama siga existiendo. El porqué
   está en "Aprendizajes y pendientes".
2. Su rama ya se integró a `main`: terminada.
3. Tiene rama y no se ha integrado a `main`: en construcción. El avance (las casillas) está en la rama.
4. La spec está en `main` y no tiene rama: aprobada, sin empezar.

## Por qué existe

- **La IA empieza cada sesión en blanco.** Sin esta ficha, en la sesión 2 inventa el stack, olvida
  lo que no se debía tocar y repite preguntas. Con ella, la IA sabe dónde van.
- **"Cómo sabremos que funciona"** es lo que después se revisa para decidir si el proyecto valió la
  pena, no solo si quedó bonito.
- **"Con qué está hecho"** evita que la IA cambie de herramientas a mitad del camino.
