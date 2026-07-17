# Buscador de Rutas del Metro / Corredores de Lima (Grupo 3)

Proyecto final del curso de Bases de Datos NoSQL. Modela una red ficticia de
transporte (31 estaciones, 2 líneas, 1 estación de transbordo) como un grafo
en Neo4j, y responde tres preguntas mediante consultas Cypher: ruta más corta
entre dos estaciones, identificación de transbordos en esa ruta, y estaciones
ubicadas a una distancia exacta de N paradas.

## Integrantes — Grupo 3

- Argomedo Montejo, Juan José
- Diaz Pinillos, Jose Gianfranco
- Lopez Gonzalez, Jorge
- Velasquez Revilla, Favio Adrian

## Requisitos

- Neo4j 5.x (local vía Docker, o Neo4j AuraDB — capa gratuita)
- Neo4j Browser (incluido con cualquiera de las dos opciones anteriores)

## Cómo levantar Neo4j (Docker)

```bash
docker run -d \
  --name neo4j-metro \
  -p 7474:7474 -p 7687:7687 \
  -e NEO4J_AUTH=neo4j/<tu_contraseña> \
  neo4j:5
```

Luego abrir [http://localhost:7474](http://localhost:7474) e iniciar sesión.

> Si usan AuraDB en vez de Docker, simplemente abran la consola de su
> instancia desde [https://console.neo4j.io](https://console.neo4j.io).

## Cómo cargar los datos

1. Abrir `carga_red.cypher` con un editor de texto.
2. Copiar todo el contenido y pegarlo en Neo4j Browser, o ejecutar desde
   terminal con `cypher-shell`:

```bash
cat carga_red.cypher | cypher-shell -u neo4j -p <tu_contraseña>
```

3. Verificar que se cargaron las 31 estaciones:

```cypher
MATCH (e:Estacion) RETURN count(e);
```

## Cómo ejecutar las consultas

Abrir `consultas.cypher`, copiar cada bloque (Listado 1, 2 o 3) y pegarlo
en Neo4j Browser para verlo ejecutarse con el grafo visible.

## Estructura del repositorio

```
├── carga_red.cypher   # Carga las 31 estaciones y las relaciones CONECTA
├── consultas.cypher   # Las 3 consultas obligatorias del alcance
└── README.md          # Este archivo
```