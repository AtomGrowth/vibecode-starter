# Fundamentos sin miedo

Las piezas de una app, cómo funciona la IA que programa y dónde investigar. Cada concepto con su
definición precisa, una analogía y los hechos que importan. Es el material de la clase, por escrito.

## Cómo trabaja quien construye software

**Definición.** La ingeniería de software es la disciplina de construir y cambiar sistemas de forma
segura y repetible: cada cambio se versiona, se revisa, se prueba y se integra en pasos pequeños.

**Analogía.** Git es Google Docs con historial. Cada commit es un guardado con nombre; una rama es
un borrador paralelo; el pull request es "revisa mi borrador antes de pasarlo al documento principal".

- Versionar (Git): cada commit es una foto del proyecto a la que puedes volver. Una rama aísla un
  cambio sin tocar lo que ya funciona.
- Revisar (code review): otra persona, o un agente, lee el cambio antes de integrarlo.
- Probar (tests): código que verifica que otro código hace lo esperado.
- Integrar seguido (CI): cada cambio corre las pruebas solo; si fallan, no se integra.

Mito: "si hay tests, el código es correcto". Los tests verifican lo que tú esperas; si la
expectativa está mal, el test también.

## Anatomía de una app: cliente y servidor

**Definición (MDN).** La web funciona con una arquitectura cliente-servidor: el navegador (cliente)
envía peticiones HTTP a un servidor, que las procesa y devuelve respuestas.

**Analogía.** Un restaurante. El comedor es el frontend, la cocina es el backend, la despensa es la
base de datos, y el mesero que lleva y trae pedidos es HTTP.

- Frontend: código que corre en el navegador del usuario. HTML, CSS y JavaScript.
- Backend: código que corre en una máquina que tú controlas: lógica, permisos, datos.
- Base de datos: el almacén persistente. Solo el backend le habla.
- Cada clic manda una petición y el servidor responde. Cada petición va sola; cookies y sesiones
  guardan el hilo.

Mito: "el backend es lo difícil y el front lo fácil". Los dos son código; el front corre en la
máquina del usuario, donde no controlas nada.

## HTTP, APIs y endpoints

**Definición.** Una API es el contrato que define cómo otro código puede pedirle cosas a un sistema;
un endpoint es una URL concreta que responde a una petición (`GET /api/clientes/123`).

**Analogía.** La API es el menú, cada endpoint es un platillo, HTTP es el mesero y JSON es el idioma
en que llega el pedido.

- Métodos: GET lee, POST crea, PUT/PATCH modifica, DELETE borra. GET se puede repetir sin efecto;
  POST no (10 veces = 10 registros).
- Códigos de estado: 2xx bien (200, 201 creado). 4xx culpa del cliente (400, 401 sin auth, 404 no
  existe, 429 límite). 5xx culpa del servidor (500, 503).
- JSON es el formato de datos habitual. REST: URLs que nombran recursos y verbos HTTP como acciones.
- SDK = librería que envuelve la API por ti. `/v1` y `/v2` para no romper clientes viejos. Rate
  limit: si te pasas, 429.

Mito: "una API es una página que abro en el navegador". Es código hablando con código.

## Secretos, API keys y variables de entorno

**Definición (12-factor).** La configuración que cambia entre entornos (credenciales, llaves, URLs
de base de datos) vive en variables de entorno, nunca escrita en el código fuente.

**Analogía.** La llave es la tarjeta corporativa. No se fotografía ni se manda por chat. El archivo
`.env` es tu caja fuerte local; la de producción la guarda el hosting.

- En local, las llaves van en `.env`, que Git ignora. En producción las pone la plataforma.
- Git no olvida: borrar la llave en un commit nuevo no la quita del historial. Si se subió, se rota.
- Mínimo privilegio: una llave para leer no debe poder borrar. Una llave por uso.
- Si se filtra: alguien puede gastar tu cuota, generar cargos o llegar a datos de clientes.

Mito: "si la borro del código ya no existe". Lo que vale es invalidar la llave real.

## Bases de datos

**Definición.** Un almacén persistente y organizado de información. Relacional: tablas con esquema y
llaves (Postgres). Documental: documentos JSON sin esquema fijo (MongoDB).

**Analogía.** La hoja de cálculo es un archivero. La base de datos es un almacén con etiquetas,
reglas y montacargas: mucha gente, mucho volumen, sin accidentes.

- Una tabla es una cuadrícula; el esquema define tipos y reglas. Cada fila tiene una llave primaria.
- Una llave foránea enlaza tablas y la base impide inconsistencias.
- Migración = script versionado que cambia el esquema. Respaldo = foto para volver.
- ¿Hoja o base? Hoja: una tabla, pocas filas, una persona. Base: varias tablas relacionadas, muchos
  usuarios a la vez. Supabase = Postgres administrado.

Mito: "un Excel es lo mismo". Es una base que falla en silencio cuando crece.

## Conectores y MCP

**Definición (modelcontextprotocol.io).** MCP es un estándar abierto (Anthropic, noviembre 2024) para
que las aplicaciones de IA se conecten a datos, herramientas y flujos externos con una interfaz común.

**Analogía.** El USB-C de la IA. Un conector se construye una vez y sirve para cualquier asistente.

- Host (Claude, Cursor) -> cliente -> servidor MCP (el código que expone la herramienta).
- Tres primitivas: tools (acciones), resources (datos de solo lectura), prompts (plantillas).
- Consentimiento: el host muestra qué quiere hacer un servidor y tú apruebas, niegas o revocas.
- Conector: en Claude, un servidor MCP empaquetado para activarlo sin configurar nada.

Mito doble: "la IA no puede tocar mis datos" (sí puede, con permiso) y "MCP hace lo que quiere"
(no: cada acción pasa por el host y tu aprobación).

## Cómo funciona la IA que programa

**Definición.** Un modelo de lenguaje predice el siguiente token a partir del contexto. No consulta
la verdad: calcula lo más probable. Por eso puede sonar seguro y estar mal.

**Analogía.** Un becario brillante con memoria de una sola conversación. Todo lo que no le pongas
enfrente, lo va a suponer.

- Un token son unos 4 caracteres. La ventana de contexto es cuánto texto "ve" a la vez.
- Alucinación: salida plausible pero falsa. No miente, predice. Se verifica contra la doc oficial.
- Contexto = calidad: reglas (`CLAUDE.md`, `.cursorrules`), docs y ejemplos reales reducen
  alucinaciones. Por eso existe el archivo de reglas de este starter.
- Agéntico: no solo responde, ejecuta herramientas en bucle. Por eso las reglas de "nunca sin
  preguntar".
- No aprende de tu conversación: al cerrarla se pierde. Por eso se documenta en archivos.

Mito: "si lo dice con seguridad, es cierto".

## Investigar: la jerarquía de fuentes

**Definición.** La fuente primaria vence a la derivada: la documentación oficial vence al blog, el
código fuente vence al tutorial, la especificación vence a lo que dijeron en un foro.

1. Documentación oficial: "¿cómo se usa y qué soporta?". Canónica y versionada.
2. Código fuente / repo: "¿qué hace en realidad?". La verdad sin intermediarios.
3. Changelogs y release notes: "¿qué cambió y qué se rompe entre versiones?".
4. Issues de GitHub: "¿alguien tuvo mi problema?". Mira los cerrados.
5. Stack Overflow y foros: "¿cómo lo resolvieron rápido?". Verifica fecha y versión.
6. Specs, blogs y papers: "¿por qué se diseñó así?".

Antes de construir, pídele a la IA: "investiga esto primero, cita la fuente y dime qué encontraste".
Y abre la cita: si la URL no existe, alucinó.

## Clonar un repo: leer código que ya funciona

**Definición (git-scm).** Clonar es descargar a tu máquina una copia completa de un repositorio con
todo su historial. Hacer fork es crear tu propia copia en GitHub para modificarla y proponer cambios.

- Cómo: en Cursor, "Clone Repository" y pegas la URL. Luego le pides a la IA que la explique.
- Qué leer primero: README, la estructura de carpetas y `package.json`.
- LICENSE, siempre: MIT/Apache casi todo permitido con atribución; GPL obliga a abrir tu código;
  sin licencia = todos los derechos reservados.
- Para qué: aprender un contexto nuevo y darle a la IA un ejemplo real en vez de dejarla suponer.

Mito: "está en GitHub, es libre". Público no es lo mismo que licenciado.

## Despliegues y Vercel

**Definición (Vercel).** Un deployment es el resultado de una build exitosa de tu proyecto, con una
URL única. Hay deployments de preview (por rama o PR) y de producción (rama principal).

**Analogía.** Localhost es el ensayo en tu cuarto; preview es el ensayo general; producción es el
concierto en vivo.

- Push -> deploy: cada push a una rama genera un preview; integrar a `main` despliega producción.
- Variables por entorno: development, preview y production tienen sus propios secretos.
- Rollback instantáneo: promueves un deployment anterior desde el panel, en segundos.
- Dominio y DNS: `tuempresa.com` apunta a tu deployment de producción. HTTPS incluido.

Mito: "funciona en mi compu, funciona en producción". Por eso existe el preview.

## Frameworks, librerías y el stack

**Definición.** Una librería es una colección de funciones que tu código llama. Un framework es una
estructura que llama a tu código y decide el flujo. El stack es el conjunto de herramientas con que
se construye y despliega una app.

**Analogía.** La librería es la caja de herramientas; el framework es la receta que te dice cuándo
mezclar y cuándo hornear.

- Librerías: React, Tailwind, Axios. Frameworks: Next.js, Astro, Django.
- Un stack típico de vibecode: Next.js + Supabase + Vercel.
- La IA trabaja mejor con stacks populares y bien documentados. Elige lo aburrido y probado.

Mito: "un framework siempre es mejor que una librería". Son trade-offs distintos.

## Fuentes

- developer.mozilla.org (How does the Internet work, HTTP, Glossary)
- 12factor.net/config; cheatsheetseries.owasp.org (Secrets Management)
- supabase.com/docs; martinfowler.com/articles/evodb.html
- modelcontextprotocol.io
- platform.claude.com/docs; cursor.com/docs
- git-scm.com/book; choosealicense.com
- vercel.com/docs/deployments
