#1 // SELECT * FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id = 5)
#2 // SELECT * FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id = 5)
#3 // SELECT * FROM t_pays INNER JOIN t_regions ON (1 = t_regions.id_region)
#4 // SELECT libelle_continent,COUNT(libelle_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) WHERE id_continent=6 GROUP BY libelle_continent;
#5 // SELECT libelle_continent,COUNT(libelle_region) FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent) WHERE id_continent=4 GROUP BY libelle_continent;
#6 // SELECT libelle_continent,COUNT(libelle_region) FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent) WHERE id_continent=3 GROUP BY libelle_continent;
#7 // SELECT libelle_continent,SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent;
#8 // SELECT libelle_region ,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region
#9 // SELECT libelle_continent,SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) ORDER BY SUM(population_pays) DESC;
#10 // SELECT libelle_region,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY SUM(population_pays) DESC;
#11 // SELECT libelle_continent, SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY SUM(population_pays) ASC
#12 // SELECT libelle_region,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY SUM(population_pays) ASC;
#13 // SELECT id_pays, libelle_pays, esperance_vie_pays FROM t_pays HAVING esperance_vie_pays = (SELECT MAX(esperance_vie_pays) FROM t_pays)
#14 // SELECT id_pays, libelle_pays, taux_mortalite_pays FROM t_pays HAVING taux_mortalite_pays = (SELECT min(taux_mortalite_pays) FROM t_pays)
#15 // SELECT id_pays, libelle_pays, taux_natalite_pays FROM t_pays HAVING taux_natalite_pays = (SELECT max(taux_natalite_pays) FROM t_pays)
#16 // SELECT id_pays, libelle_pays, nombre_enfants_par_femme_pays FROM t_pays HAVING nombre_enfants_par_femme_pays = (SELECT max(nombre_enfants_par_femme_pays) FROM t_pays)
#17 // SELECT id_pays, libelle_pays, population_plus_65_pays FROM t_pays HAVING population_plus_65_pays = (SELECT max(population_plus_65_pays) FROM t_pays)
#18 // SELECT AVG(esperance_vie_pays) FROM t_pays
#19 // SELECT libelle_region ,AVG(taux_natalite_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY AVG(taux_natalite_pays) ASC
#20 // SELECT libelle_continent,AVG(taux_natalite_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY AVG(taux_natalite_pays) ASC;
#21 // SELECT libelle_region ,AVG(taux_mortalite_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY AVG(taux_mortalite_pays) ASC
#22 // SELECT libelle_continent,AVG(taux_mortalite_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY AVG(taux_mortalite_pays) ASC;
#23 // SELECT libelle_pays FROM t_pays where libelle_pays LIKE "A%"
#24 // SELECT libelle_continent, SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) where libelle_continent LIKE  "%Amérique%"
#25 // SELECT id_pays, libelle_pays, SUM(population_plus_65_pays)/(select SUM(population_plus_65_pays) FROM t_pays)*100 FROM t_pays GROUP BY libelle_pays ORDER BY SUM(population_plus_65_pays)/(select SUM(population_plus_65_pays) FROM t_pays)*100 DESC
#26 // SELECT id_pays, libelle_pays, SUM(population_pays) FROM t_pays WHERE libelle_pays LIKE "%Corée%"
#27 // 
#28 // SELECT id_pays, libelle_pays, taux_natalite_pays FROM t_pays WHERE taux_natalite_pays >= 17
#29 // SELECT id_pays, libelle_pays, population_pays FROM t_pays WHERE population_pays >= 20000
#30 // SELECT id_pays, libelle_pays, taux_croissance_pays FROM t_pays WHERE taux_croissance_pays < 0
#31 // SELECT id_pays, libelle_pays, sum(population_pays) FROM t_pays WHERE libelle_pays like "%Chine%"
#32 // SELECT id_pays, libelle_pays, sum(population_pays)/(select SUM(population_pays) FROM t_pays)*100 FROM t_pays WHERE libelle_pays like "%Chine%"
#33 // SELECT libelle_continent,SUM(population_pays)+(SELECT SUM(population_pays) FROM t_pays WHERE libelle_pays = "Turquie") FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) WHERE id_continent=5
#34 // 