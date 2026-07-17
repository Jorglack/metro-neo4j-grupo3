// consultas.cypher

// Listado 1: Ruta más corta entre dos estaciones

MATCH (origen:Estacion {nombre:'Villa Sur'}),
      (destino:Estacion {nombre:'Huaycán'}),
      p = shortestPath((origen)-[:CONECTA*]-(destino))
RETURN [n IN nodes(p) | n.nombre] AS ruta,
       length(p) AS numero_paradas;


// Listado 2: Ruta más corta con identificación de transbordos

MATCH (origen:Estacion {nombre:'Villa Sur'}),
      (destino:Estacion {nombre:'Huaycán'}),
      p = shortestPath((origen)-[:CONECTA*]-(destino))
WITH p, [n IN nodes(p) WHERE n.transbordo = true | n.nombre] AS transbordos
RETURN [n IN nodes(p) | n.nombre] AS ruta,
       transbordos,
       length(p) AS numero_paradas;

// Listado 3: Estaciones a exactamente N paradas de distancia

MATCH (origen:Estacion {nombre:'Estación Central'})
MATCH p = (origen)-[:CONECTA*1..4]-(destino:Estacion)
WHERE destino <> origen
  AND all(n IN nodes(p) WHERE single(m IN nodes(p) WHERE m = n))
WITH destino, min(length(p)) AS distancia
WHERE distancia = 4
RETURN destino.nombre AS estacion,
       distancia
ORDER BY estacion;