# Brief ejecutable

Un prompt suelto ("hazme una app de X") deja que la IA invente requisitos y toque diez archivos. Un
brief la obliga a un plan, límites claros y una forma de comprobar. Copia esto, llénalo y pégaselo a
la IA. Lo que no sepas, déjalo y pídele que te ayude a pensarlo.

```md
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

Criterios de aceptación:
- [Resultado observable 1.]
- [Resultado observable 2.]
- [Un caso de error o de límite que también debe funcionar.]

Antes de escribir código:
1. Explícame el plan en máximo 8 pasos.
2. Dime qué archivos tocarías y por qué.
3. Señala riesgos y lo que no te quede claro.
4. Espera mi aprobación.

Restricciones:
- No borres archivos.
- No hagas commit, push, deploy, migraciones ni cambios de datos sin preguntarme.
- Usa datos de prueba, nunca datos reales de clientes.
- Al terminar, explícame cómo verificar el resultado.
```

## Por qué funciona

- **"Problema, no solución"** evita que construyas lo que pediste en vez de lo que necesitas.
- **"No cambiar"** y **"alcance"** son lo que impide que un cambio chico se convierta en cinco
  archivos rotos.
- **"Antes de escribir código: plan y aprobación"** te devuelve el control: ves qué va a pasar antes
  de que pase.
- **Los criterios de aceptación** son lo que después compruebas con la skill `/probar`.

Las restricciones son las reglas de la casa (`CLAUDE.md`) hechas prompt: sirven aunque la IA no las
tuviera ya puestas.
