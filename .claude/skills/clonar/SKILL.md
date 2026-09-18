---
name: clonar
description: Traer a la computadora un proyecto de otra persona (un repo de GitHub) para leerlo, correrlo y aprender de él. Úsala cuando la persona pegue una URL de GitHub, quiera "usar algo que ya existe" o necesite un ejemplo real de cómo se hace algo.
---

# Clonar un repo: leer código que ya funciona

Aprender de un proyecto que ya corre es mucho más rápido que empezar de cero. Clonar es descargar
una copia completa del repo a la computadora. No modifica el original.

## Paso 1. Antes de clonar, revisa desde el navegador

Con la URL del repo, mira y cuéntale a la persona en tres líneas:

- **README**: qué es y para qué sirve. Si no hay README, es mala señal.
- **LICENSE**: qué se puede hacer con el código. MIT o Apache: casi todo, con atribución. GPL:
  si lo usas, tu código también tiene que ser abierto. Sin archivo LICENSE: todos los derechos
  reservados, no se reutiliza. Dilo siempre, aunque no pregunten.
- **Salud**: fecha del último cambio, issues abiertos. Un repo sin cambios en dos años puede no
  funcionar con versiones actuales.

## Paso 2. Clona

Explica qué va a pasar: "voy a descargar una copia del proyecto a una carpeta nueva; no toco nada
tuyo". Luego:

- En Cursor: `Clone Repository` en la pantalla de inicio, o desde la paleta de comandos, y pegas la
  URL. Elige una carpeta separada de este starter.
- Por comando: `git clone <url>` dentro de la carpeta donde quieras la copia.

Abre la carpeta clonada. No corras ningún script de instalación todavía.

## Paso 3. Lee antes de correr

En este orden, y explica cada cosa en una frase:

1. `README.md`: cómo se instala y se corre.
2. La estructura de carpetas: dónde vive la interfaz, dónde la lógica, dónde los datos.
3. `package.json` (o el archivo de dependencias que tenga): qué usa el proyecto.
4. Si hay scripts de instalación o configuración, léelos antes de ejecutarlos y resume qué hacen.
   Nunca ejecutes algo que no entiendes.

## Paso 4. Explica y extrae

Pregunta qué parte le interesa a la persona. Luego:

- Explica cómo funciona esa parte, de arriba hacia abajo, sin jerga.
- Señala qué pieza se puede reutilizar en su proyecto y qué no hace falta.
- Si va a copiar código a su proyecto, recuerda la atribución que pide la licencia.

## Lo que no haces aquí

- No instalas dependencias ni corres el proyecto sin explicar qué hará y sin un sí.
- No modificas el repo clonado ni subes nada a GitHub.
- No copias llaves, `.env` ni datos de ese repo a ningún lado.
