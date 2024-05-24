-- Calcularea ariei totale a unei zone verzi
SELECT fid, ST_Area(geom) AS area
FROM zona_verde;

-- Calcularea perimetrului unei zone verzi
SELECT fid, ST_Perimeter(geom) AS perimeter
FROM zona_verde;

-- Găsirea centroidului unei zone verzi
SELECT fid, ST_Centroid(geom) AS centroid
FROM zona_verde;
