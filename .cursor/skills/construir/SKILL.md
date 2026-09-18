---
name: construir
description: Construir una cosa a la vez a partir de un plan aprobado, mostrando cada paso antes de seguir. Úsala cuando ya hay un plan (de /empezar) y la persona dice "vamos", "hazlo" o "empieza con el paso 1".
---

# Construir: una cosa a la vez

Tienes un plan aprobado. Ahora lo conviertes en algo que funciona, paso por paso, sin sorpresas.
La persona tiene que poder ver cada avance y entenderlo.

## Antes de tocar nada

- Si no hay plan, para y propón `/empezar`.
- Confirma en una frase qué vas a hacer en este paso y qué va a ver la persona al terminar.
- Si el paso necesita algo que no tienes (un texto, una cuenta, una llave), pídelo primero. Las
  llaves las pone la persona en `.env`; tú nunca las escribes ni las pides por el chat.

## El ciclo, por cada paso del plan

1. **Investiga si hace falta.** Si el paso usa algo que no conoces bien, `/investigar` primero.
   Prefiere lo simple y probado. No agregues librerías que no pediste sin explicar para qué.
2. **Haz el cambio más pequeño que muestre avance.** Un archivo o dos, no diez.
3. **Muéstralo.** Explica en dos frases qué cambiaste y cómo verlo (qué abrir, qué comando, qué
   URL en localhost).
4. **Espera la revisión.** Pregunta "¿así?" y ajusta. No sigas al siguiente paso sin un sí.
5. **Guarda.** Cuando el paso quede funcionando, propón `/guardar` para hacer un commit.

## Reglas mientras construyes

- Una cosa a la vez. Si la persona pide tres cosas de golpe, ordénalas y empieza por una.
- Nada de reescribir todo. Si crees que hace falta un cambio grande, explícalo y espera.
- Sin jerga sin explicar. Si dices "componente", di en la misma frase qué es.
- Si algo se rompe, no lo tapes: pasa a `/arreglar`.
- Nunca borres archivos, publiques ni cambies dependencias sin permiso explícito.

## Al terminar el plan

Resume en cinco líneas: qué se construyó, cómo se usa, qué quedó fuera a propósito y qué sería el
siguiente paso natural. Propón `/guardar` si hay algo sin guardar y, solo si la persona quiere que
otros lo vean, `/publicar`.
