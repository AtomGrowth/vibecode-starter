# Brief ejecutable

Un prompt suelto ("hazme una app de X") deja que la IA invente requisitos y toque diez archivos. Un
brief la obliga a un plan, límites claros y una forma de comprobar. Cada cosa que construyes (una
"feature") tiene su brief.

Dónde vive:

- **En Cursor o Claude Code**, `/empezar` lo llena contigo y lo guarda como archivo en
  `docs/specs/001-nombre.md` (002, 003... para las siguientes). Guardado, sobrevive a la sesión: la
  próxima vez la IA lo lee y sabe en qué ibas.
- **En Claude web**, cópialo, llénalo y pégaselo a la IA. Lo que no sepas, déjalo y pídele que te
  ayude a pensarlo.

```md
# 001 — [Nombre corto]

Estado: borrador
Rama: feature/001-[nombre-corto]

## Tarea

Problema:
[Qué le pasa a una persona real. El problema, no la solución.]

Resultado esperado:
[Qué podrá hacer esa persona cuando esto esté listo.]

Quién lo usa:
[Rol o tipo de persona.]

Alcance:
[Qué pantallas, datos o flujos SÍ cambian.]

No cambiar:
[Qué debe conservarse tal cual.]

## Criterios de aceptación

- C1. Cuando [hago algo concreto], entonces [veo este resultado].
- C2. Cuando [hago otra cosa], entonces [veo este resultado].
- C3. Cuando [me equivoco o empujo un límite: campo vacío, dato raro], entonces [la app avisa así].

## Pasos

- [ ] 1. [Algo que se puede ver funcionando] → C1
- [ ] 2. [Siguiente cosa visible] → C2
- [ ] 3. [...] → C3

## Para después

- [Ideas que salieron mientras se construía y que son otra feature. Vacío al principio.]

## Antes de escribir código

1. Explícame el plan en máximo 8 pasos.
2. Dime qué archivos tocarías y por qué.
3. Señala riesgos y lo que no te quede claro.
4. Espera mi aprobación.

## Restricciones

- No borres archivos.
- No hagas commit, push, deploy, migraciones ni cambios de datos sin preguntarme.
- Usa datos de prueba, nunca datos reales de clientes.
- Al terminar, explícame cómo verificar el resultado.
```

## Cómo se llena cada parte

- **Estado** avanza así: `borrador` (lo estamos pensando) → `aprobada` (dijiste que sí) →
  `en construcción` → `terminada`. Si decides no seguir, queda `abandonada`: no se borra, para que
  se sepa que se intentó y por qué se dejó. La IA lo actualiza; tú lo apruebas. La spec se guarda
  primero en `main`; el avance se marca en la rama de la feature y llega a `main` al integrarla.
  `abandonada` se anota en `main`, porque esa rama ya no se va a integrar.
- **Para después** junta lo que se te ocurre a mitad del camino y es otra feature, no un ajuste. Así
  no se pierde ni hace crecer esta.
- **Rama** es el borrador paralelo donde se construye esta feature sin tocar lo que ya funciona. El
  número es el mismo que el de la spec, para saber qué rama es de qué.
- **Criterios**: cada uno con la forma "Cuando..., entonces...". Si no se puede comprobar mirando la
  pantalla o el resultado, no es un criterio, es un deseo. "Que se vea bonito" es un deseo; "cuando
  abro la página en el móvil, entonces el botón se ve completo sin hacer zoom" es un criterio.
  Antes de darlos por buenos, revisa cada uno:
  - ¿Puedo contestar "sí" o "no" mirando la pantalla o el resultado?
  - ¿Dice qué hago yo ("cuando...") y qué veo ("entonces...")?
  - ¿Evité palabras como rápido, bonito, profesional, fácil o intuitivo? Si una se coló, cámbiala
    por lo que vería alguien para saber que ya está.
  - ¿Hay al menos uno para cuando algo sale mal (un dato vacío, un error, una pantalla chica)?
- **Pasos**: de 3 a 6, cada uno algo visible, y cada uno dice qué criterio cumple. La casilla se
  marca `[x]` cuando el paso queda funcionando y guardado.

## Por qué funciona

- **"Problema, no solución"** evita que construyas lo que pediste en vez de lo que necesitas.
- **"No cambiar"** y **"alcance"** son lo que impide que un cambio chico se convierta en cinco
  archivos rotos.
- **"Antes de escribir código: plan y aprobación"** te devuelve el control: ves qué va a pasar antes
  de que pase.
- **Los criterios numerados** son lo que después compruebas con la skill `/probar`, uno por uno.
- **Las casillas** dicen en qué paso vas aunque cierres la sesión y vuelvas una semana después.

Las restricciones son las reglas de la casa (`CLAUDE.md`) hechas prompt: sirven aunque la IA no las
tuviera ya puestas.
