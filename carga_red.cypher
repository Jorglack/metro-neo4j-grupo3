// carga_red.cypher


// 1. Limpieza (cuidado: borra todo el grafo actual)
MATCH (n) DETACH DELETE n;

// 2. Restricción de unicidad para evitar estaciones duplicadas
CREATE CONSTRAINT estacion_nombre_unico IF NOT EXISTS
FOR (e:Estacion) REQUIRE e.nombre IS UNIQUE;

// 3. Creación de estaciones (MERGE evita duplicados si se re-ejecuta)
// TODO: agregar aquí las 31 estaciones reales del grupo, ejemplo:
MERGE (:Estacion {nombre: 'Villa Sur', lineas: ['L1'], distrito: '...', transbordo: false});
MERGE (:Estacion {nombre: 'Estación Central', lineas: ['L1','L2'], distrito: '...', transbordo: true});
// ... continuar con las 31 estaciones

// 4. Creación de relaciones CONECTA (bidireccionales)
// TODO: agregar aquí los 60 tramos reales del grupo, ejemplo:
MATCH (a:Estacion {nombre: 'Villa Sur'}), (b:Estacion {nombre: 'Parque Industrial'})
MERGE (a)-[:CONECTA {linea: 'L1', orden: 1}]->(b)
MERGE (b)-[:CONECTA {linea: 'L1', orden: 1}]->(a);
// ... continuar con los demás tramos

// 5. Verificación rápida
MATCH (e:Estacion) RETURN count(e) AS total_estaciones;
MATCH ()-[r:CONECTA]->() RETURN count(r) AS total_relaciones;