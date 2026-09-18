# Antes de publicar

"Ya quedó" no lo decide la IA. Lo decides tú con esta lista. Si algo no está marcado, no se publica.
Cópiala en cada proyecto y recórrela antes de sacar nada a internet.

## Para cualquier cosa

- [ ] Puedo describir en una frase qué problema resuelve.
- [ ] Lo probé en localhost o preview como usuaria real (ver `/probar`).
- [ ] Probé el caso normal y un error esperable.
- [ ] Lo revisé en móvil y en escritorio.
- [ ] No hay llaves, contraseñas ni datos privados en Git (ver `/secretos`).
- [ ] Sé cómo volver a la versión anterior (ver `/guardar`).
- [ ] El formulario o la integración envía los datos al lugar correcto.
- [ ] Otra persona lo usó sin que yo le explicara.
- [ ] Sé qué voy a observar la primera semana (una métrica: visitas, envíos, clics).

## Si además tiene login o cuentas

- [ ] Probé con cuentas de prueba, no reales.
- [ ] El cierre de sesión funciona.
- [ ] Cada usuario ve solo sus datos, no los de otro.
- [ ] Recuperar contraseña o acceso funciona.
- [ ] Un usuario sin permisos no puede entrar donde no debe.

## Si toca pagos, datos sensibles o algo de la escalera en rojo

No lo publiques sola. Escala a alguien técnico para revisión antes de salir a producción
(ver `guia/escalera-de-riesgo.md`). No es falta de capacidad: es el nivel de riesgo el que lo pide.
