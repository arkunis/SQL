# Correction 
#### 1 // 

    SELECT * FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id = 5)

#### 2 // 

    SELECT * FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id = 5)

#### 3 // 

    SELECT * FROM t_pays INNER JOIN t_regions ON (1 = t_regions.id_region)

#### 4 //

    SELECT libelle_continent,COUNT(libelle_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) WHERE id_continent=6 GROUP BY libelle_continent;

#### 5 // 

    SELECT libelle_continent,COUNT(libelle_region) FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent) WHERE id_continent=4 GROUP BY libelle_continent;

#### 6 // 

    SELECT libelle_continent,COUNT(libelle_region) FROM t_regions INNER JOIN t_continents ON (t_regions.continent_id=t_continents.id_continent) WHERE id_continent=3 GROUP BY libelle_continent;

#### 7 // 

    SELECT libelle_continent,SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent;

#### 8 // 

    SELECT libelle_region ,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region

#### 9 //

    SELECT libelle_continent,SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) ORDER BY SUM(population_pays) DESC;

#### 10 // 

    SELECT libelle_region,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY SUM(population_pays) DESC;

#### 11 // 

    SELECT libelle_continent, SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY SUM(population_pays) ASC

#### 12 // 

    SELECT libelle_region,SUM(population_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY SUM(population_pays) ASC;

#### 13 // 

    SELECT id_pays, libelle_pays, esperance_vie_pays FROM t_pays HAVING esperance_vie_pays = (SELECT MAX(esperance_vie_pays) FROM t_pays)

#### 14 // 

    SELECT id_pays, libelle_pays, taux_mortalite_pays FROM t_pays HAVING taux_mortalite_pays = (SELECT min(taux_mortalite_pays) FROM t_pays)

#### 15 // 

    SELECT id_pays, libelle_pays, taux_natalite_pays FROM t_pays HAVING taux_natalite_pays = (SELECT max(taux_natalite_pays) FROM t_pays)

#### 16 // 

    SELECT id_pays, libelle_pays, nombre_enfants_par_femme_pays FROM t_pays HAVING nombre_enfants_par_femme_pays = (SELECT max(nombre_enfants_par_femme_pays) FROM t_pays)

#### 17 // 

    SELECT id_pays, libelle_pays, population_plus_65_pays FROM t_pays HAVING population_plus_65_pays = (SELECT max(population_plus_65_pays) FROM t_pays)

#### 18 // 

    SELECT AVG(esperance_vie_pays) FROM t_pays

#### 19 // 

    SELECT libelle_region ,AVG(taux_natalite_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY AVG(taux_natalite_pays) ASC

#### 20 // 

    SELECT libelle_continent,AVG(taux_natalite_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY AVG(taux_natalite_pays) ASC;

#### 21 // 

    SELECT libelle_region ,AVG(taux_mortalite_pays) FROM t_pays INNER JOIN t_regions ON (t_pays.region_id=t_regions.id_region) GROUP BY libelle_region ORDER BY AVG(taux_mortalite_pays) ASC

#### 22 // 

    SELECT libelle_continent,AVG(taux_mortalite_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) GROUP BY libelle_continent ORDER BY AVG(taux_mortalite_pays) ASC;

#### 23 // 

    SELECT libelle_pays FROM t_pays where libelle_pays LIKE "A%"
    #24 // SELECT libelle_continent, SUM(population_pays) FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) where libelle_continent LIKE  "%Amérique%"

#### 25 // 

    SELECT id_pays, libelle_pays, SUM(population_plus_65_pays)/(select SUM(population_plus_65_pays) FROM t_pays)*100 FROM t_pays GROUP BY libelle_pays ORDER BY SUM(population_plus_65_pays)/(select SUM(population_plus_65_pays) FROM t_pays)*100 DESC

#### 26 // 

    SELECT id_pays, libelle_pays, SUM(population_pays) FROM t_pays WHERE libelle_pays LIKE "%Corée%"

#### 27 //  

    SELECT SUM(population_pays) FROM t_pays WHERE libelle_pays LIKE 'France%' OR libelle_pays LIKE 'Guyane (fr%' OR libelle_pays LIKE 'réunion' OR libelle_pays LIKE 'guade%' OR libelle_pays LIKE 'Mayotte' OR libelle_pays LIKE 'Martinique';

  
#### 28 // 

    SELECT id_pays, libelle_pays, taux_natalite_pays FROM t_pays WHERE taux_natalite_pays >= 17

#### 29 // 

    SELECT id_pays, libelle_pays, population_pays FROM t_pays WHERE population_pays >= 20000

#### 30 // 

    SELECT id_pays, libelle_pays, taux_croissance_pays FROM t_pays WHERE taux_croissance_pays < 0

#### 31 // 

    SELECT id_pays, libelle_pays, sum(population_pays) FROM t_pays WHERE libelle_pays like "%Chine%"

#### 32 // 

    SELECT id_pays, libelle_pays, sum(population_pays)/(select SUM(population_pays) FROM t_pays)*100 FROM t_pays WHERE libelle_pays like "%Chine%"

#### 33 // 

    SELECT libelle_continent,SUM(population_pays)+(SELECT SUM(population_pays) FROM t_pays WHERE libelle_pays = "Turquie") FROM t_pays INNER JOIN t_continents ON (t_pays.continent_id=t_continents.id_continent) WHERE id_continent=5

#### 34 //  
  

      # Update Superficie par MAGINOT Damien
    
    UPDATE t_pays set Superficie='91' WHERE libelle_pays='Antigua-et-Barbuda';
    UPDATE t_pays set Superficie='180' WHERE libelle_pays='Aruba';
    UPDATE t_pays set Superficie='13900' WHERE libelle_pays='Bahamas';
    UPDATE t_pays set Superficie='431' WHERE libelle_pays='Barbade';
    UPDATE t_pays set Superficie='48700' WHERE libelle_pays='Cuba';
    UPDATE t_pays set Superficie='444' WHERE libelle_pays='Curaçao';
    UPDATE t_pays set Superficie='48' WHERE libelle_pays='Dominicaine (République)';
    UPDATE t_pays set Superficie='549' WHERE libelle_pays='Grenade';
    UPDATE t_pays set Superficie='1628' WHERE libelle_pays='Guadeloupe';
    UPDATE t_pays set Superficie='27750' WHERE libelle_pays='Haïti';
    UPDATE t_pays set Superficie='346.4' WHERE libelle_pays='Îles Vierges américaines';
    UPDATE t_pays set Superficie='10991' WHERE libelle_pays='Jamaïque';
    UPDATE t_pays set Superficie='1128' WHERE libelle_pays='Martinique';
    UPDATE t_pays set Superficie='13791' WHERE libelle_pays='Porto Rico';
    UPDATE t_pays set Superficie='617' WHERE libelle_pays='Sainte Lucie';
    UPDATE t_pays set Superficie='389' WHERE libelle_pays='St Vincent-et-les-Grenadines';
    UPDATE t_pays set Superficie='5128' WHERE libelle_pays='Trinité-et-Tobago';
    UPDATE t_pays set Superficie='22966' WHERE libelle_pays='Belize';
    UPDATE t_pays set Superficie='110900' WHERE libelle_pays='Costa Rica';
    UPDATE t_pays set Superficie='108888' WHERE libelle_pays='Guatemala';
    UPDATE t_pays set Superficie='90000' WHERE libelle_pays='Honduras';
    UPDATE t_pays set Superficie='1870' WHERE libelle_pays='Mexique';
    UPDATE t_pays set Superficie='140800' WHERE libelle_pays='Nicaragua';
    UPDATE t_pays set Superficie='883900' WHERE libelle_pays='Panama';
    UPDATE t_pays set Superficie='388' WHERE libelle_pays='Salvador';
    UPDATE t_pays set Superficie='961' WHERE libelle_pays='Argentine';
    UPDATE t_pays set Superficie='1099000' WHERE libelle_pays='Bolivie';
    UPDATE t_pays set Superficie='8515770' WHERE libelle_pays='Brésil';
    UPDATE t_pays set Superficie='9597000' WHERE libelle_pays='Chili';
    UPDATE t_pays set Superficie='2170' WHERE libelle_pays='Colombie';
    UPDATE t_pays set Superficie='256370' WHERE libelle_pays='Equateur';
    UPDATE t_pays set Superficie='84000' WHERE libelle_pays='Guyane';
    UPDATE t_pays set Superficie='84000' WHERE libelle_pays='Guyane (française)';
    UPDATE t_pays set Superficie='461700' WHERE libelle_pays='Paraguay';
    UPDATE t_pays set Superficie='1285220' WHERE libelle_pays='Pérou';
    UPDATE t_pays set Superficie='163820' WHERE libelle_pays='Surinam';
    UPDATE t_pays set Superficie='780600' WHERE libelle_pays='Uruguay';
    UPDATE t_pays set Superficie='916445' WHERE libelle_pays='Venezuela';
    UPDATE t_pays set Superficie='259' WHERE libelle_pays='Burundi';
    UPDATE t_pays set Superficie='342000' WHERE libelle_pays='Comores';
    UPDATE t_pays set Superficie='1001000' WHERE libelle_pays='Djibouti';
    UPDATE t_pays set Superficie='117600' WHERE libelle_pays='Erythrée';
    UPDATE t_pays set Superficie='1127000' WHERE libelle_pays='Ethiopie';
    UPDATE t_pays set Superficie='582646' WHERE libelle_pays='Kenya';
    UPDATE t_pays set Superficie='16' WHERE libelle_pays='Madagascar';
    UPDATE t_pays set Superficie='329700' WHERE libelle_pays='Malawi';
    UPDATE t_pays set Superficie='712000' WHERE libelle_pays='Maurice';
    UPDATE t_pays set Superficie='374' WHERE libelle_pays='Mayotte';
    UPDATE t_pays set Superficie='102' WHERE libelle_pays='Mozambique';
    UPDATE t_pays set Superficie='268700' WHERE libelle_pays='Ouganda';
    UPDATE t_pays set Superficie='2512' WHERE libelle_pays='Réunion';
    UPDATE t_pays set Superficie='11400' WHERE libelle_pays='Rwanda';
    UPDATE t_pays set Superficie='950' WHERE libelle_pays='Seychelles';
    UPDATE t_pays set Superficie='71700' WHERE libelle_pays='Somalie';
    UPDATE t_pays set Superficie='644329' WHERE libelle_pays='Sud Soudan';
    UPDATE t_pays set Superficie='163300' WHERE libelle_pays='Tanzanie';
    UPDATE t_pays set Superficie='912100' WHERE libelle_pays='Zambie';
    UPDATE t_pays set Superficie='390745' WHERE libelle_pays='Zimbabwe';
    UPDATE t_pays set Superficie='1246700' WHERE libelle_pays='Angola';
    UPDATE t_pays set Superficie='9976000' WHERE libelle_pays='Cameroun';
    UPDATE t_pays set Superficie='623000' WHERE libelle_pays='Centrafricaine (République)';
    UPDATE t_pays set Superficie='240' WHERE libelle_pays='Congo';
    UPDATE t_pays set Superficie='240' WHERE libelle_pays='Congo (Rép. dém. du) (ex-Zaïre)';
    UPDATE t_pays set Superficie='6' WHERE libelle_pays='Gabon';
    UPDATE t_pays set Superficie='28051' WHERE libelle_pays='Guinée équatoriale';
    UPDATE t_pays set Superficie='1001' WHERE libelle_pays='Sao Tomé-et-Principe';
    UPDATE t_pays set Superficie='17400' WHERE libelle_pays='Tchad';
    UPDATE t_pays set Superficie='2381740' WHERE libelle_pays='Algérie';
    UPDATE t_pays set Superficie='1001450' WHERE libelle_pays='Egypte';
    UPDATE t_pays set Superficie='10400' WHERE libelle_pays='Libye';
    UPDATE t_pays set Superficie='316' WHERE libelle_pays='Maroc';
    UPDATE t_pays set Superficie='266000' WHERE libelle_pays='Sahara occidental';
    UPDATE t_pays set Superficie='620' WHERE libelle_pays='Soudan';
    UPDATE t_pays set Superficie='10' WHERE libelle_pays='Tunisie';
    UPDATE t_pays set Superficie='1221040' WHERE libelle_pays='Afrique du Sud';
    UPDATE t_pays set Superficie='8512000' WHERE libelle_pays='Botswana';
    UPDATE t_pays set Superficie='30355' WHERE libelle_pays='Lesotho';
    UPDATE t_pays set Superficie='783000' WHERE libelle_pays='Namibie';
    UPDATE t_pays set Superficie='17364' WHERE libelle_pays='Swaziland';
    UPDATE t_pays set Superficie='114763' WHERE libelle_pays='Bénin';
    UPDATE t_pays set Superficie='274000' WHERE libelle_pays='Burkina Faso';
    UPDATE t_pays set Superficie='622900' WHERE libelle_pays='Cap-Vert';
    UPDATE t_pays set Superficie='322462' WHERE libelle_pays='Côte d\'Ivoire';
    UPDATE t_pays set Superficie='131900' WHERE libelle_pays='Gambie';
    UPDATE t_pays set Superficie='2180000' WHERE libelle_pays='Ghana';
    UPDATE t_pays set Superficie='245857' WHERE libelle_pays='Guinée';
    UPDATE t_pays set Superficie='36125' WHERE libelle_pays='Guinée-Bissau';
    UPDATE t_pays set Superficie='111369' WHERE libelle_pays='Libéria';
    UPDATE t_pays set Superficie='298' WHERE libelle_pays='Mali';
    UPDATE t_pays set Superficie='1100' WHERE libelle_pays='Mauritanie';
    UPDATE t_pays set Superficie='130000' WHERE libelle_pays='Niger';
    UPDATE t_pays set Superficie='923768' WHERE libelle_pays='Nigéria';
    UPDATE t_pays set Superficie='196839' WHERE libelle_pays='Sénégal';
    UPDATE t_pays set Superficie='2800' WHERE libelle_pays='Sierra Leone';
    UPDATE t_pays set Superficie='127900' WHERE libelle_pays='Togo';
    UPDATE t_pays set Superficie='4030' WHERE libelle_pays='Canada';
    UPDATE t_pays set Superficie='9831510' WHERE libelle_pays='Etats-Unis';
    UPDATE t_pays set Superficie='207600' WHERE libelle_pays='Biélorussie';
    UPDATE t_pays set Superficie='274200' WHERE libelle_pays='Bulgarie';
    UPDATE t_pays set Superficie='27800' WHERE libelle_pays='Hongrie';
    UPDATE t_pays set Superficie='375' WHERE libelle_pays='Moldavie';
    UPDATE t_pays set Superficie='300000' WHERE libelle_pays='Pologne';
    UPDATE t_pays set Superficie='4000' WHERE libelle_pays='Roumanie';
    UPDATE t_pays set Superficie='92100' WHERE libelle_pays='Russie';
    UPDATE t_pays set Superficie='196200' WHERE libelle_pays='Slovaquie';
    UPDATE t_pays set Superficie='78867' WHERE libelle_pays='Tchèque (République)';
    UPDATE t_pays set Superficie='430' WHERE libelle_pays='Ukraine';
    UPDATE t_pays set Superficie='198' WHERE libelle_pays='Anglo-Normandes (Îles)';
    UPDATE t_pays set Superficie='751' WHERE libelle_pays='Danemark';
    UPDATE t_pays set Superficie='18270' WHERE libelle_pays='Estonie';
    UPDATE t_pays set Superficie='11300' WHERE libelle_pays='Finlande';
    UPDATE t_pays set Superficie='340' WHERE libelle_pays='Irlande';
    UPDATE t_pays set Superficie='3288000' WHERE libelle_pays='Islande';
    UPDATE t_pays set Superficie='17820' WHERE libelle_pays='Lettonie';
    UPDATE t_pays set Superficie='1760000' WHERE libelle_pays='Lituanie';
    UPDATE t_pays set Superficie='385207' WHERE libelle_pays='Norvège';
    UPDATE t_pays set Superficie='243610' WHERE libelle_pays='Royaume Uni';
    UPDATE t_pays set Superficie='528447' WHERE libelle_pays='Suède';
    UPDATE t_pays set Superficie='28700' WHERE libelle_pays='Albanie';
    UPDATE t_pays set Superficie='51209' WHERE libelle_pays='Bosnie-Herzégovine';
    UPDATE t_pays set Superficie='23000' WHERE libelle_pays='Croatie';
    UPDATE t_pays set Superficie='1400' WHERE libelle_pays='Espagne';
    UPDATE t_pays set Superficie='131957' WHERE libelle_pays='Grèce';
    UPDATE t_pays set Superficie='435000' WHERE libelle_pays='Italie';
    UPDATE t_pays set Superficie='25713' WHERE libelle_pays='Macédoine';
    UPDATE t_pays set Superficie='1240000' WHERE libelle_pays='Malte';
    UPDATE t_pays set Superficie='13812' WHERE libelle_pays='Monténégro';
    UPDATE t_pays set Superficie='49' WHERE libelle_pays='Portugal';
    UPDATE t_pays set Superficie='21041' WHERE libelle_pays='Serbie';
    UPDATE t_pays set Superficie='20273' WHERE libelle_pays='Slovénie';
    UPDATE t_pays set Superficie='356800' WHERE libelle_pays='Allemagne';
    UPDATE t_pays set Superficie='7687000' WHERE libelle_pays='Autriche';
    UPDATE t_pays set Superficie='30500' WHERE libelle_pays='Belgique';
    UPDATE t_pays set Superficie='543940' WHERE libelle_pays='France (métropolitaine)';
    UPDATE t_pays set Superficie='160' WHERE libelle_pays='Luxembourg';
    UPDATE t_pays set Superficie='406800' WHERE libelle_pays='Pays-Bas';
    UPDATE t_pays set Superficie='276' WHERE libelle_pays='Suisse';
    UPDATE t_pays set Superficie='2767000' WHERE libelle_pays='Australie';
    UPDATE t_pays set Superficie='268021' WHERE libelle_pays='Nouvelle-Zélande';
    UPDATE t_pays set Superficie='267700' WHERE libelle_pays='Fidji';
    UPDATE t_pays set Superficie='18576' WHERE libelle_pays='Nouvelle-Calédonie';
    UPDATE t_pays set Superficie='462840' WHERE libelle_pays='Papouasie-Nouvelle-Guinée';
    UPDATE t_pays set Superficie='28896' WHERE libelle_pays='Salomon (Îles)';
    UPDATE t_pays set Superficie='26' WHERE libelle_pays='Vanuatu';
    UPDATE t_pays set Superficie='549' WHERE libelle_pays='Guam';
    UPDATE t_pays set Superficie='372000' WHERE libelle_pays='Kiribati';
    UPDATE t_pays set Superficie='701.9' WHERE libelle_pays='Micronésie (États fédérés de)';
    UPDATE t_pays set Superficie='4167' WHERE libelle_pays='Polynésie française';
    UPDATE t_pays set Superficie='2831' WHERE libelle_pays='Samoa occidentales';
    UPDATE t_pays set Superficie='514000' WHERE libelle_pays='Tonga';
    UPDATE t_pays set Superficie='9250' WHERE libelle_pays='Chine';
    UPDATE t_pays set Superficie='2755' WHERE libelle_pays='Chine - Hong Kong';
    UPDATE t_pays set Superficie='118' WHERE libelle_pays='Chine - Macao';
    UPDATE t_pays set Superficie='120540' WHERE libelle_pays='Corée du Nord';
    UPDATE t_pays set Superficie='100210' WHERE libelle_pays='Corée du Sud';
    UPDATE t_pays set Superficie='70200' WHERE libelle_pays='Japon';
    UPDATE t_pays set Superficie='2' WHERE libelle_pays='Mongolie';
    UPDATE t_pays set Superficie='36197' WHERE libelle_pays='Taïwan';
    UPDATE t_pays set Superficie='110900' WHERE libelle_pays='Brunei';
    UPDATE t_pays set Superficie='475400' WHERE libelle_pays='Cambodge';
    UPDATE t_pays set Superficie='1905' WHERE libelle_pays='Indonésie';
    UPDATE t_pays set Superficie='582600' WHERE libelle_pays='Laos';
    UPDATE t_pays set Superficie='587000' WHERE libelle_pays='Malaisie';
    UPDATE t_pays set Superficie='676578' WHERE libelle_pays='Myanmar (Birmanie)';
    UPDATE t_pays set Superficie='1285000' WHERE libelle_pays='Philippines';
    UPDATE t_pays set Superficie='970' WHERE libelle_pays='Singapour';
    UPDATE t_pays set Superficie='513120' WHERE libelle_pays='Thaïlande';
    UPDATE t_pays set Superficie='15006' WHERE libelle_pays='Timor-Est';
    UPDATE t_pays set Superficie='331690' WHERE libelle_pays='Viêt Nam';
    UPDATE t_pays set Superficie='647497' WHERE libelle_pays='Afghanistan';
    UPDATE t_pays set Superficie='144000' WHERE libelle_pays='Bangladesh';
    UPDATE t_pays set Superficie='53' WHERE libelle_pays='Bhoutan';
    UPDATE t_pays set Superficie='112100' WHERE libelle_pays='Inde';
    UPDATE t_pays set Superficie='150' WHERE libelle_pays='Iran';
    UPDATE t_pays set Superficie='20770' WHERE libelle_pays='Kazakhstan';
    UPDATE t_pays set Superficie='199900' WHERE libelle_pays='Kirgizistan';
    UPDATE t_pays set Superficie='118500' WHERE libelle_pays='Maldives';
    UPDATE t_pays set Superficie='147181' WHERE libelle_pays='Népal';
    UPDATE t_pays set Superficie='448900' WHERE libelle_pays='Ouzbékistan';
    UPDATE t_pays set Superficie='236000' WHERE libelle_pays='Pakistan';
    UPDATE t_pays set Superficie='2506000' WHERE libelle_pays='Sri Lanka';
    UPDATE t_pays set Superficie='41200' WHERE libelle_pays='Tadjikistan';
    UPDATE t_pays set Superficie='491210' WHERE libelle_pays='Turkménistan';
    UPDATE t_pays set Superficie='440' WHERE libelle_pays='Arabie saoudite';
    UPDATE t_pays set Superficie='29743' WHERE libelle_pays='Arménie';
    UPDATE t_pays set Superficie='86600' WHERE libelle_pays='Azerbaïdjan';
    UPDATE t_pays set Superficie='760' WHERE libelle_pays='Bahreïn';
    UPDATE t_pays set Superficie='1139000' WHERE libelle_pays='Chypre';
    UPDATE t_pays set Superficie='83600' WHERE libelle_pays='Emirats Arabes Unis';
    UPDATE t_pays set Superficie='69700' WHERE libelle_pays='Georgie';
    UPDATE t_pays set Superficie='93100' WHERE libelle_pays='Irak';
    UPDATE t_pays set Superficie='22145' WHERE libelle_pays='Israël';
    UPDATE t_pays set Superficie='103000' WHERE libelle_pays='Jordanie';
    UPDATE t_pays set Superficie='17818' WHERE libelle_pays='Koweït';
    UPDATE t_pays set Superficie='236800' WHERE libelle_pays='Liban';
    UPDATE t_pays set Superficie='19060' WHERE libelle_pays='Oman';
    UPDATE t_pays set Superficie='6020' WHERE libelle_pays='Palestine';
    UPDATE t_pays set Superficie='312700' WHERE libelle_pays='Qatar';
    UPDATE t_pays set Superficie='449900' WHERE libelle_pays='Syrie';
    UPDATE t_pays set Superficie='5100' WHERE libelle_pays='Turquie';
    UPDATE t_pays set Superficie='555000' WHERE libelle_pays='Yémen';

  
#### 35 // 
          # Update Capitale par MAGINOT Damien
        
    UPDATE t_pays set Capitale='Saint John\'s' WHERE libelle_pays='Antigua-et-Barbuda';
    UPDATE t_pays set Capitale='Oranjestad' WHERE libelle_pays='Aruba';
    UPDATE t_pays set Capitale='Nassau' WHERE libelle_pays='Bahamas';
    UPDATE t_pays set Capitale='Bridgetown' WHERE libelle_pays='Barbade';
    UPDATE t_pays set Capitale='La Havane' WHERE libelle_pays='Cuba';
    UPDATE t_pays set Capitale='Willemstad' WHERE libelle_pays='Curaçao';
    UPDATE t_pays set Capitale='Saint-Domingue' WHERE libelle_pays='Dominicaine (République)';
    UPDATE t_pays set Capitale='Saint-Georges' WHERE libelle_pays='Grenade';
    UPDATE t_pays set Capitale='Basse-Terre' WHERE libelle_pays='Guadeloupe';
    UPDATE t_pays set Capitale='Port-au-Prince' WHERE libelle_pays='Haïti';
    UPDATE t_pays set Capitale='Charlotte Amalie' WHERE libelle_pays='Îles Vierges américaines';
    UPDATE t_pays set Capitale='Kingston' WHERE libelle_pays='Jamaïque';
    UPDATE t_pays set Capitale='Fort-de-France' WHERE libelle_pays='Martinique';
    UPDATE t_pays set Capitale='San Juan' WHERE libelle_pays='Porto Rico';
    UPDATE t_pays set Capitale='Castries' WHERE libelle_pays='Sainte Lucie';
    UPDATE t_pays set Capitale='Kingstown' WHERE libelle_pays='St Vincent-et-les-Grenadines';
    UPDATE t_pays set Capitale='Port-d\'Espagne' WHERE libelle_pays='Trinité-et-Tobago';
    UPDATE t_pays set Capitale='Belmopan' WHERE libelle_pays='Belize';
    UPDATE t_pays set Capitale='San José' WHERE libelle_pays='Costa Rica';
    UPDATE t_pays set Capitale='Guatemala' WHERE libelle_pays='Guatemala';
    UPDATE t_pays set Capitale='Tegucigalpa' WHERE libelle_pays='Honduras';
    UPDATE t_pays set Capitale='Mexico' WHERE libelle_pays='Mexique';
    UPDATE t_pays set Capitale='Managua' WHERE libelle_pays='Nicaragua';
    UPDATE t_pays set Capitale='Panama' WHERE libelle_pays='Panama';
    UPDATE t_pays set Capitale='San Salvador' WHERE libelle_pays='Salvador';
    UPDATE t_pays set Capitale='Buenos Aires' WHERE libelle_pays='Argentine';
    UPDATE t_pays set Capitale='Sucre / La Paz' WHERE libelle_pays='Bolivie';
    UPDATE t_pays set Capitale='Brasília' WHERE libelle_pays='Brésil';
    UPDATE t_pays set Capitale='Santiago' WHERE libelle_pays='Chili';
    UPDATE t_pays set Capitale='Bogota' WHERE libelle_pays='Colombie';
    UPDATE t_pays set Capitale='Quito' WHERE libelle_pays='Equateur';
    UPDATE t_pays set Capitale='Cayenne' WHERE libelle_pays='Guyane';
    UPDATE t_pays set Capitale='Cayenne' WHERE libelle_pays='Guyane (française)';
    UPDATE t_pays set Capitale='Assomption (Asuncion)' WHERE libelle_pays='Paraguay';
    UPDATE t_pays set Capitale='Lima' WHERE libelle_pays='Pérou';
    UPDATE t_pays set Capitale='Paramaribo' WHERE libelle_pays='Surinam';
    UPDATE t_pays set Capitale='Montevideo' WHERE libelle_pays='Uruguay';
    UPDATE t_pays set Capitale='Caracas' WHERE libelle_pays='Venezuela';
    UPDATE t_pays set Capitale='Gitega' WHERE libelle_pays='Burundi';
    UPDATE t_pays set Capitale='Moroni' WHERE libelle_pays='Comores';
    UPDATE t_pays set Capitale='Djibouti' WHERE libelle_pays='Djibouti';
    UPDATE t_pays set Capitale='Asmara' WHERE libelle_pays='Erythrée';
    UPDATE t_pays set Capitale='Addis-Abeba' WHERE libelle_pays='Ethiopie';
    UPDATE t_pays set Capitale='Nairobi' WHERE libelle_pays='Kenya';
    UPDATE t_pays set Capitale='Antananarivo (Tananarive)' WHERE libelle_pays='Madagascar';
    UPDATE t_pays set Capitale='Lilongwe' WHERE libelle_pays='Malawi';
    UPDATE t_pays set Capitale='Port-Louis' WHERE libelle_pays='Maurice';
    UPDATE t_pays set Capitale='Mamoudzou' WHERE libelle_pays='Mayotte';
    UPDATE t_pays set Capitale='Maputo' WHERE libelle_pays='Mozambique';
    UPDATE t_pays set Capitale='Kampala' WHERE libelle_pays='Ouganda';
    UPDATE t_pays set Capitale='Saint-Denis' WHERE libelle_pays='Réunion';
    UPDATE t_pays set Capitale='Kigali' WHERE libelle_pays='Rwanda';
    UPDATE t_pays set Capitale='Victoria' WHERE libelle_pays='Seychelles';
    UPDATE t_pays set Capitale='Mogadiscio' WHERE libelle_pays='Somalie';
    UPDATE t_pays set Capitale='Djouba' WHERE libelle_pays='Sud Soudan';
    UPDATE t_pays set Capitale='Dodoma' WHERE libelle_pays='Tanzanie';
    UPDATE t_pays set Capitale='Lusaka' WHERE libelle_pays='Zambie';
    UPDATE t_pays set Capitale='Harare' WHERE libelle_pays='Zimbabwe';
    UPDATE t_pays set Capitale='Luanda' WHERE libelle_pays='Angola';
    UPDATE t_pays set Capitale='Yaoundé' WHERE libelle_pays='Cameroun';
    UPDATE t_pays set Capitale='Bangui' WHERE libelle_pays='Centrafricaine (République)';
    UPDATE t_pays set Capitale='Brazzaville' WHERE libelle_pays='Congo';
    UPDATE t_pays set Capitale='Brazzaville' WHERE libelle_pays='Congo (Rép. dém. du) (ex-Zaïre)';
    UPDATE t_pays set Capitale='Libreville' WHERE libelle_pays='Gabon';
    UPDATE t_pays set Capitale='Malabo' WHERE libelle_pays='Guinée équatoriale';
    UPDATE t_pays set Capitale='São Tomé' WHERE libelle_pays='Sao Tomé-et-Principe';
    UPDATE t_pays set Capitale='Ndjamena' WHERE libelle_pays='Tchad';
    UPDATE t_pays set Capitale='Alger' WHERE libelle_pays='Algérie';
    UPDATE t_pays set Capitale='Le Caire' WHERE libelle_pays='Egypte';
    UPDATE t_pays set Capitale='Tripoli' WHERE libelle_pays='Libye';
    UPDATE t_pays set Capitale='Rabat' WHERE libelle_pays='Maroc';
    UPDATE t_pays set Capitale='Laâyoune' WHERE libelle_pays='Sahara occidental';
    UPDATE t_pays set Capitale='Khartoum' WHERE libelle_pays='Soudan';
    UPDATE t_pays set Capitale='Tunis' WHERE libelle_pays='Tunisie';
    UPDATE t_pays set Capitale='Pretoria' WHERE libelle_pays='Afrique du Sud';
    UPDATE t_pays set Capitale='Gaborone' WHERE libelle_pays='Botswana';
    UPDATE t_pays set Capitale='Maseru' WHERE libelle_pays='Lesotho';
    UPDATE t_pays set Capitale='Windhoek' WHERE libelle_pays='Namibie';
    UPDATE t_pays set Capitale='Eswatini' WHERE libelle_pays='Swaziland';
    UPDATE t_pays set Capitale='Porto-Novo' WHERE libelle_pays='Bénin';
    UPDATE t_pays set Capitale='Ouagadougou' WHERE libelle_pays='Burkina Faso';
    UPDATE t_pays set Capitale='Praia' WHERE libelle_pays='Cap-Vert';
    UPDATE t_pays set Capitale='Yamoussoukro' WHERE libelle_pays='Côte d\'Ivoire';
    UPDATE t_pays set Capitale='Banjul' WHERE libelle_pays='Gambie';
    UPDATE t_pays set Capitale='Accra' WHERE libelle_pays='Ghana';
    UPDATE t_pays set Capitale='Conakry' WHERE libelle_pays='Guinée';
    UPDATE t_pays set Capitale='Bissau' WHERE libelle_pays='Guinée-Bissau';
    UPDATE t_pays set Capitale='Monrovia' WHERE libelle_pays='Libéria';
    UPDATE t_pays set Capitale='Bamako' WHERE libelle_pays='Mali';
    UPDATE t_pays set Capitale='Nouakchott' WHERE libelle_pays='Mauritanie';
    UPDATE t_pays set Capitale='Niamey' WHERE libelle_pays='Niger';
    UPDATE t_pays set Capitale='Abuja' WHERE libelle_pays='Nigéria';
    UPDATE t_pays set Capitale='Dakar' WHERE libelle_pays='Sénégal';
    UPDATE t_pays set Capitale='Freetown' WHERE libelle_pays='Sierra Leone';
    UPDATE t_pays set Capitale='Lomé' WHERE libelle_pays='Togo';
    UPDATE t_pays set Capitale='Ottawa' WHERE libelle_pays='Canada';
    UPDATE t_pays set Capitale='Washington' WHERE libelle_pays='Etats-Unis';
    UPDATE t_pays set Capitale='Minsk' WHERE libelle_pays='Biélorussie';
    UPDATE t_pays set Capitale='Sofia' WHERE libelle_pays='Bulgarie';
    UPDATE t_pays set Capitale='Budapest' WHERE libelle_pays='Hongrie';
    UPDATE t_pays set Capitale='Chisinau' WHERE libelle_pays='Moldavie';
    UPDATE t_pays set Capitale='Varsovie' WHERE libelle_pays='Pologne';
    UPDATE t_pays set Capitale='Bucarest' WHERE libelle_pays='Roumanie';
    UPDATE t_pays set Capitale='Moscou' WHERE libelle_pays='Russie';
    UPDATE t_pays set Capitale='Bratislava' WHERE libelle_pays='Slovaquie';
    UPDATE t_pays set Capitale='Prague' WHERE libelle_pays='Tchèque (République)';
    UPDATE t_pays set Capitale='Kiev' WHERE libelle_pays='Ukraine';
    UPDATE t_pays set Capitale='Saint Peter Port' WHERE libelle_pays='Anglo-Normandes (Îles)';
    UPDATE t_pays set Capitale='Copenhague' WHERE libelle_pays='Danemark';
    UPDATE t_pays set Capitale='Tallinn' WHERE libelle_pays='Estonie';
    UPDATE t_pays set Capitale='Helsinki' WHERE libelle_pays='Finlande';
    UPDATE t_pays set Capitale='Dublin' WHERE libelle_pays='Irlande';
    UPDATE t_pays set Capitale='Reykjavik' WHERE libelle_pays='Islande';
    UPDATE t_pays set Capitale='Riga' WHERE libelle_pays='Lettonie';
    UPDATE t_pays set Capitale='Vilnius' WHERE libelle_pays='Lituanie';
    UPDATE t_pays set Capitale='Oslo' WHERE libelle_pays='Norvège';
    UPDATE t_pays set Capitale='Londres' WHERE libelle_pays='Royaume Uni';
    UPDATE t_pays set Capitale='Stockholm' WHERE libelle_pays='Suède';
    UPDATE t_pays set Capitale='Tirana' WHERE libelle_pays='Albanie';
    UPDATE t_pays set Capitale='Sarajevo' WHERE libelle_pays='Bosnie-Herzégovine';
    UPDATE t_pays set Capitale='Zagreb' WHERE libelle_pays='Croatie';
    UPDATE t_pays set Capitale='Madrid' WHERE libelle_pays='Espagne';
    UPDATE t_pays set Capitale='Athènes' WHERE libelle_pays='Grèce';
    UPDATE t_pays set Capitale='Rome' WHERE libelle_pays='Italie';
    UPDATE t_pays set Capitale='Skopje' WHERE libelle_pays='Macédoine';
    UPDATE t_pays set Capitale='La Valette' WHERE libelle_pays='Malte';
    UPDATE t_pays set Capitale='Podgorica' WHERE libelle_pays='Monténégro';
    UPDATE t_pays set Capitale='Lisbonne' WHERE libelle_pays='Portugal';
    UPDATE t_pays set Capitale='Belgrade' WHERE libelle_pays='Serbie';
    UPDATE t_pays set Capitale='Ljubljana' WHERE libelle_pays='Slovénie';
    UPDATE t_pays set Capitale='Berlin' WHERE libelle_pays='Allemagne';
    UPDATE t_pays set Capitale='Vienne' WHERE libelle_pays='Autriche';
    UPDATE t_pays set Capitale='Bruxelles' WHERE libelle_pays='Belgique';
    UPDATE t_pays set Capitale='Paris' WHERE libelle_pays='France (métropolitaine)';
    UPDATE t_pays set Capitale='Luxembourg' WHERE libelle_pays='Luxembourg';
    UPDATE t_pays set Capitale='Amsterdam' WHERE libelle_pays='Pays-Bas';
    UPDATE t_pays set Capitale='Berne' WHERE libelle_pays='Suisse';
    UPDATE t_pays set Capitale='Canberra' WHERE libelle_pays='Australie';
    UPDATE t_pays set Capitale='Wellington' WHERE libelle_pays='Nouvelle-Zélande';
    UPDATE t_pays set Capitale='Suva' WHERE libelle_pays='Fidji';
    UPDATE t_pays set Capitale='Nouméa' WHERE libelle_pays='Nouvelle-Calédonie';
    UPDATE t_pays set Capitale='Port Moresby' WHERE libelle_pays='Papouasie-Nouvelle-Guinée';
    UPDATE t_pays set Capitale='Honiara' WHERE libelle_pays='Salomon (Îles)';
    UPDATE t_pays set Capitale='Port-Vila' WHERE libelle_pays='Vanuatu';
    UPDATE t_pays set Capitale='Agana' WHERE libelle_pays='Guam';
    UPDATE t_pays set Capitale='Bairiki' WHERE libelle_pays='Kiribati';
    UPDATE t_pays set Capitale='Palikir' WHERE libelle_pays='Micronésie (États fédérés de)';
    UPDATE t_pays set Capitale='Papeete' WHERE libelle_pays='Polynésie française';
    UPDATE t_pays set Capitale='Apia' WHERE libelle_pays='Samoa occidentales';
    UPDATE t_pays set Capitale='Nuku\'alofa' WHERE libelle_pays='Tonga';
    UPDATE t_pays set Capitale='Pékin' WHERE libelle_pays='Chine';
    UPDATE t_pays set Capitale='Victoria' WHERE libelle_pays='Chine - Hong Kong';
    UPDATE t_pays set Capitale='NULL' WHERE libelle_pays='Chine - Macao';
    UPDATE t_pays set Capitale='Pyongyang' WHERE libelle_pays='Corée du Nord';
    UPDATE t_pays set Capitale='Séoul' WHERE libelle_pays='Corée du Sud';
    UPDATE t_pays set Capitale='Tokyo' WHERE libelle_pays='Japon';
    UPDATE t_pays set Capitale='Oulan-Bator' WHERE libelle_pays='Mongolie';
    UPDATE t_pays set Capitale='Taipei' WHERE libelle_pays='Taïwan';
    UPDATE t_pays set Capitale='Bandar Seri Begawan' WHERE libelle_pays='Brunei';
    UPDATE t_pays set Capitale='Phnom Penh' WHERE libelle_pays='Cambodge';
    UPDATE t_pays set Capitale='Jakarta' WHERE libelle_pays='Indonésie';
    UPDATE t_pays set Capitale='Vientiane' WHERE libelle_pays='Laos';
    UPDATE t_pays set Capitale='Kuala Lumpur' WHERE libelle_pays='Malaisie';
    UPDATE t_pays set Capitale='Naypyidaw' WHERE libelle_pays='Myanmar (Birmanie)';
    UPDATE t_pays set Capitale='Manille' WHERE libelle_pays='Philippines';
    UPDATE t_pays set Capitale='Singapour' WHERE libelle_pays='Singapour';
    UPDATE t_pays set Capitale='Bangkok' WHERE libelle_pays='Thaïlande';
    UPDATE t_pays set Capitale='Díli' WHERE libelle_pays='Timor-Est';
    UPDATE t_pays set Capitale='Hanoï' WHERE libelle_pays='Viêt Nam';
    UPDATE t_pays set Capitale='Kaboul' WHERE libelle_pays='Afghanistan';
    UPDATE t_pays set Capitale='Dacca' WHERE libelle_pays='Bangladesh';
    UPDATE t_pays set Capitale='Thimphou' WHERE libelle_pays='Bhoutan';
    UPDATE t_pays set Capitale='New Delhi' WHERE libelle_pays='Inde';
    UPDATE t_pays set Capitale='Téhéran' WHERE libelle_pays='Iran';
    UPDATE t_pays set Capitale='Nour-Soultan' WHERE libelle_pays='Kazakhstan';
    UPDATE t_pays set Capitale='Bichkek' WHERE libelle_pays='Kirgizistan';
    UPDATE t_pays set Capitale='Malé' WHERE libelle_pays='Maldives';
    UPDATE t_pays set Capitale='Katmandou' WHERE libelle_pays='Népal';
    UPDATE t_pays set Capitale='Tachkent' WHERE libelle_pays='Ouzbékistan';
    UPDATE t_pays set Capitale='Islamabad' WHERE libelle_pays='Pakistan';
    UPDATE t_pays set Capitale='Sri Jayewardenepura-Kotte' WHERE libelle_pays='Sri Lanka';
    UPDATE t_pays set Capitale='Douchanbé' WHERE libelle_pays='Tadjikistan';
    UPDATE t_pays set Capitale='Achgabat' WHERE libelle_pays='Turkménistan';
    UPDATE t_pays set Capitale='Riyad' WHERE libelle_pays='Arabie saoudite';
    UPDATE t_pays set Capitale='Erevan' WHERE libelle_pays='Arménie';
    UPDATE t_pays set Capitale='Bakou' WHERE libelle_pays='Azerbaïdjan';
    UPDATE t_pays set Capitale='Manama' WHERE libelle_pays='Bahreïn';
    UPDATE t_pays set Capitale='Nicosie' WHERE libelle_pays='Chypre';
    UPDATE t_pays set Capitale='Abou Dabi' WHERE libelle_pays='Emirats Arabes Unis';
    UPDATE t_pays set Capitale='Tbilissi' WHERE libelle_pays='Georgie';
    UPDATE t_pays set Capitale='Bagdad' WHERE libelle_pays='Irak';
    UPDATE t_pays set Capitale='Jérusalem' WHERE libelle_pays='Israël';
    UPDATE t_pays set Capitale='Amman' WHERE libelle_pays='Jordanie';
    UPDATE t_pays set Capitale='Koweït' WHERE libelle_pays='Koweït';
    UPDATE t_pays set Capitale='Beyrouth' WHERE libelle_pays='Liban';
    UPDATE t_pays set Capitale='Mascate' WHERE libelle_pays='Oman';
    UPDATE t_pays set Capitale='Ramallah' WHERE libelle_pays='Palestine';
    UPDATE t_pays set Capitale='Doha' WHERE libelle_pays='Qatar';
    UPDATE t_pays set Capitale='Damas' WHERE libelle_pays='Syrie';
    UPDATE t_pays set Capitale='Ankara' WHERE libelle_pays='Turquie';
    UPDATE t_pays set Capitale='Sanaa' WHERE libelle_pays='Yémen';
---
## Résultat 
﻿
| id_pays | libelle_pays                    | Capitale                  | Superficie_km2 | libelle_pays_en | population_pays | taux_natalite_pays | taux_mortalite_pays | esperance_vie_pays | taux_mortalite_infantile_pays | nombre_enfants_par_femme_pays | taux_croissance_pays | population_plus_65_pays | continent_id | region_id |
|---------|---------------------------------|---------------------------|----------------|-----------------|-----------------|--------------------|---------------------|--------------------|-------------------------------|-------------------------------|----------------------|-------------------------|--------------|-----------|
| 202     | Antigua-et-Barbuda              | Saint John's              | 91             |                 | 93              | 16                 | 6                   | 77                 | 8                             | 2                             | 10                   | 7                       | 2            | 13        |
| 203     | Aruba                           | Oranjestad                | 180            |                 | 104             | 10                 | 9                   | 76                 | 14                            | 2                             | 4                    | 13                      | 2            | 13        |
| 204     | Bahamas                         | Nassau                    | 13900          |                 | 392             | 15                 | 6                   | 76                 | 8                             | 2                             | 12                   | 34                      | 2            | 13        |
| 205     | Barbade                         | Bridgetown                | 431            |                 | 289             | 13                 | 9                   | 76                 | 9                             | 2                             | 5                    | 34                      | 2            | 13        |
| 206     | Cuba                            | La Havane                 | 48700          |                 | 11236           | 9                  | 8                   | 80                 | 4                             | 1                             | -1                   | 1620                    | 2            | 13        |
| 207     | Curaçao                         | Willemstad                | 444            |                 | 167             | 12                 | 9                   | 78                 | 10                            | 2                             | 11                   | 25                      | 2            | 13        |
| 208     | Dominicaine (République)        | Saint-Domingue            | 48             |                 | 10773           | 20                 | 6                   | 74                 | 23                            | 2                             | 11                   | 727                     | 2            | 13        |
| 209     | Grenade                         | Saint-Georges             | 549            |                 | 107             | 19                 | 7                   | 73                 | 8                             | 2                             | 3                    | 8                       | 2            | 13        |
| 210     | Guadeloupe                      | Basse-Terre               | 1628           |                 | 472             | 13                 | 7                   | 82                 | 5                             | 2                             | 4                    | 69                      | 2            | 13        |
| 211     | Haïti                           | Port-au-Prince            | 27750          |                 | 10744           | 25                 | 8                   | 64                 | 37                            | 3                             | 13                   | 498                     | 2            | 13        |
| 212     | Îles Vierges américaines        | Charlotte Amalie          | 346.4          |                 | 107             | 14                 | 8                   | 81                 | 9                             | 2                             | 0                    | 19                      | 2            | 13        |
| 213     | Jamaïque                        | Kingston                  | 10991          |                 | 2827            | 18                 | 7                   | 74                 | 19                            | 2                             | 5                    | 234                     | 2            | 13        |
| 214     | Martinique                      | Fort-de-France            | 1128           |                 | 407             | 11                 | 8                   | 82                 | 6                             | 2                             | 2                    | 72                      | 2            | 13        |
| 215     | Porto Rico                      | San Juan                  | 13791          |                 | 3678            | 12                 | 8                   | 79                 | 6                             | 2                             | -1                   | 543                     | 2            | 13        |
| 216     | Sainte Lucie                    | Castries                  | 617            |                 | 186             | 15                 | 7                   | 75                 | 10                            | 2                             | 7                    | 17                      | 2            | 13        |
| 217     | St Vincent-et-les-Grenadines    | Kingstown                 | 389            |                 | 109             | 16                 | 7                   | 73                 | 16                            | 2                             | 0                    | 8                       | 2            | 13        |
| 218     | Trinité-et-Tobago               | Port-d'Espagne            | 5128           |                 | 1349            | 14                 | 10                  | 70                 | 23                            | 2                             | 1                    | 134                     | 2            | 13        |
| 219     | Belize                          | Belmopan                  | 22966          |                 | 355             | 22                 | 4                   | 75                 | 12                            | 3                             | 22                   | 15                      | 2            | 6         |
| 220     | Costa Rica                      | San José                  | 110900         |                 | 5064            | 14                 | 4                   | 81                 | 8                             | 2                             | 12                   | 394                     | 2            | 6         |
| 221     | Guatemala                       | Guatemala                 | 108888         |                 | 16653           | 30                 | 5                   | 73                 | 20                            | 4                             | 24                   | 785                     | 2            | 6         |
| 222     | Honduras                        | Tegucigalpa               | 90000          |                 | 8587            | 25                 | 5                   | 75                 | 20                            | 3                             | 19                   | 403                     | 2            | 6         |
| 223     | Mexique                         | Mexico                    | 1870           |                 | 126635          | 17                 | 5                   | 78                 | 13                            | 2                             | 11                   | 8893                    | 2            | 6         |
| 224     | Nicaragua                       | Managua                   | 140800         |                 | 6342            | 22                 | 5                   | 76                 | 14                            | 2                             | 13                   | 312                     | 2            | 6         |
| 225     | Panama                          | Panama                    | 883900         |                 | 4050            | 19                 | 5                   | 78                 | 13                            | 2                             | 15                   | 314                     | 2            | 6         |
| 226     | Salvador                        | San Salvador              | 388            |                 | 6467            | 20                 | 7                   | 73                 | 15                            | 2                             | 6                    | 479                     | 2            | 6         |
| 227     | Argentine                       | Buenos Aires              | 961            |                 | 42501           | 16                 | 8                   | 77                 | 10                            | 2                             | 8                    | 4829                    | 2            | 7         |
| 228     | Bolivie                         | Sucre / La Paz            | 1099000        |                 | 11202           | 25                 | 7                   | 68                 | 35                            | 3                             | 16                   | 576                     | 2            | 7         |
| 229     | Brésil                          | Brasília                  | 8515770        |                 | 205231          | 14                 | 7                   | 75                 | 17                            | 2                             | 8                    | 17000                   | 2            | 7         |
| 230     | Chili                           | Santiago                  | 9597000        |                 | 18073           | 14                 | 6                   | 81                 | 5                             | 2                             | 8                    | 1965                    | 2            | 7         |
| 231     | Colombie                        | Bogota                    | 2170           |                 | 50119           | 18                 | 6                   | 75                 | 15                            | 2                             | 12                   | 3449                    | 2            | 7         |
| 232     | Equateur                        | Quito                     | 256370         |                 | 16467           | 20                 | 5                   | 77                 | 15                            | 2                             | 15                   | 1156                    | 2            | 7         |
| 233     | Guyane                          | Cayenne                   | 84000          |                 | 811             | 19                 | 7                   | 67                 | 27                            | 2                             | 5                    | 30                      | 2            | 7         |
| 234     | Guyane (française)              | Cayenne                   | 84000          |                 | 268             | 23                 | 4                   | 78                 | 11                            | 3                             | 24                   | 14                      | 2            | 7         |
| 235     | Paraguay                        | Assomption (Asuncion)     | 461700         |                 | 7148            | 23                 | 6                   | 73                 | 29                            | 3                             | 16                   | 418                     | 2            | 7         |
| 236     | Pérou                           | Lima                      | 1285220        |                 | 31550           | 19                 | 5                   | 76                 | 14                            | 2                             | 12                   | 2165                    | 2            | 7         |
| 237     | Surinam                         | Paramaribo                | 163820         |                 | 553             | 17                 | 7                   | 72                 | 16                            | 2                             | 8                    | 38                      | 2            | 7         |
| 238     | Uruguay                         | Montevideo                | 780600         |                 | 3441            | 14                 | 9                   | 78                 | 11                            | 2                             | 3                    | 496                     | 2            | 7         |
| 239     | Venezuela                       | Caracas                   | 916445         |                 | 31729           | 19                 | 5                   | 75                 | 14                            | 2                             | 14                   | 2164                    | 2            | 7         |
| 240     | Burundi                         | Gitega                    | 259            |                 | 11153           | 43                 | 12                  | 55                 | 82                            | 6                             | 31                   | 267                     | 1            | 2         |
| 241     | Comores                         | Moroni                    | 342000         |                 | 788             | 34                 | 8                   | 62                 | 64                            | 5                             | 23                   | 23                      | 1            | 2         |
| 242     | Djibouti                        | Djibouti                  | 1001000        |                 | 913             | 26                 | 8                   | 63                 | 51                            | 3                             | 15                   | 38                      | 1            | 2         |
| 243     | Erythrée                        | Asmara                    | 117600         |                 | 6937            | 35                 | 6                   | 64                 | 35                            | 4                             | 29                   | 164                     | 1            | 2         |
| 244     | Ethiopie                        | Addis-Abeba               | 1127000        |                 | 101407          | 32                 | 7                   | 65                 | 44                            | 4                             | 25                   | 3560                    | 1            | 2         |
| 245     | Kenya                           | Nairobi                   | 582646         |                 | 47959           | 33                 | 8                   | 63                 | 48                            | 4                             | 25                   | 1352                    | 1            | 2         |
| 246     | Madagascar                      | Antananarivo (Tananarive) | 16             |                 | 24915           | 34                 | 6                   | 66                 | 31                            | 4                             | 28                   | 717                     | 1            | 2         |
| 247     | Malawi                          | Lilongwe                  | 329700         |                 | 17802           | 39                 | 11                  | 57                 | 80                            | 5                             | 28                   | 583                     | 1            | 2         |
| 248     | Maurice                         | Port-Louis                | 712000         |                 | 1258            | 11                 | 8                   | 74                 | 10                            | 2                             | 3                    | 125                     | 1            | 2         |
| 249     | Mayotte                         | Mamoudzou                 | 374            |                 | 240             | 27                 | 2                   | 80                 | 4                             | 4                             | 25                   | 6                       | 1            | 2         |
| 250     | Mozambique                      | Maputo                    | 102            |                 | 27781           | 38                 | 13                  | 51                 | 67                            | 5                             | 24                   | 925                     | 1            | 2         |
| 251     | Ouganda                         | Kampala                   | 268700         |                 | 41468           | 42                 | 9                   | 60                 | 52                            | 6                             | 32                   | 1000                    | 1            | 2         |
| 252     | Réunion                         | Saint-Denis               | 2512           |                 | 905             | 16                 | 5                   | 80                 | 4                             | 2                             | 11                   | 84                      | 1            | 2         |
| 253     | Rwanda                          | Kigali                    | 11400          |                 | 12760           | 33                 | 7                   | 65                 | 44                            | 4                             | 26                   | 330                     | 1            | 2         |
| 254     | Seychelles                      | Victoria                  | 950            |                 | 94              | 15                 | 8                   | 74                 | 7                             | 2                             | 5                    | 7                       | 1            | 2         |
| 255     | Somalie                         | Mogadiscio                | 71700          |                 | 11446           | 43                 | 12                  | 56                 | 73                            | 6                             | 29                   | 325                     | 1            | 2         |
| 256     | Sud Soudan                      | Djouba                    | 644329         |                 | 12531           | 35                 | 11                  | 57                 | 70                            | 5                             | 29                   | 439                     | 1            | 2         |
| 257     | Tanzanie                        | Dodoma                    | 163300         |                 | 53851           | 38                 | 8                   | 63                 | 44                            | 5                             | 29                   | 1758                    | 1            | 2         |
| 258     | Zambie                          | Lusaka                    | 912100         |                 | 16034           | 42                 | 9                   | 61                 | 59                            | 6                             | 33                   | 410                     | 1            | 2         |
| 259     | Zimbabwe                        | Harare                    | 390745         |                 | 15483           | 30                 | 8                   | 63                 | 34                            | 3                             | 28                   | 596                     | 1            | 2         |
| 260     | Angola                          | Luanda                    | 1246700        |                 | 23521           | 42                 | 13                  | 53                 | 90                            | 6                             | 30                   | 570                     | 1            | 1         |
| 261     | Cameroun                        | Yaoundé                   | 9976000        |                 | 23977           | 36                 | 11                  | 56                 | 68                            | 5                             | 25                   | 769                     | 1            | 1         |
| 262     | Centrafricaine (République)     | Bangui                    | 623000         |                 | 4898            | 33                 | 14                  | 52                 | 86                            | 4                             | 19                   | 186                     | 1            | 1         |
| 263     | Congo                           | Brazzaville               | 240            |                 | 4785            | 36                 | 10                  | 60                 | 58                            | 5                             | 24                   | 162                     | 1            | 1         |
| 264     | Congo (Rép. dém. du) (ex-Zaïre) | Brazzaville               | 240            |                 | 73172           | 41                 | 15                  | 51                 | 104                           | 6                             | 27                   | 2097                    | 1            | 1         |
| 265     | Gabon                           | Libreville                | 6              |                 | 1791            | 31                 | 9                   | 65                 | 40                            | 4                             | 23                   | 90                      | 1            | 1         |
| 266     | Guinée équatoriale              | Malabo                    | 28051          |                 | 821             | 34                 | 12                  | 54                 | 80                            | 5                             | 26                   | 23                      | 1            | 1         |
| 267     | Sao Tomé-et-Principe            | São Tomé                  | 1001           |                 | 208             | 32                 | 7                   | 67                 | 42                            | 4                             | 24                   | 7                       | 1            | 1         |
| 268     | Tchad                           | Ndjamena                  | 17400          |                 | 14009           | 44                 | 13                  | 53                 | 89                            | 6                             | 29                   | 332                     | 1            | 1         |
| 269     | Algérie                         | Alger                     | 2381740        |                 | 41316           | 23                 | 6                   | 71                 | 24                            | 3                             | 16                   | 1989                    | 1            | 3         |
| 270     | Egypte                          | Le Caire                  | 1001450        |                 | 86010           | 22                 | 6                   | 72                 | 17                            | 3                             | 15                   | 5176                    | 1            | 3         |
| 271     | Libye                           | Tripoli                   | 10400          |                 | 6395            | 19                 | 4                   | 76                 | 12                            | 2                             | 13                   | 326                     | 1            | 3         |
| 272     | Maroc                           | Rabat                     | 316            |                 | 34388           | 22                 | 6                   | 72                 | 23                            | 3                             | 12                   | 1796                    | 1            | 3         |
| 273     | Sahara occidental               | Laâyoune                  | 266000         |                 | 623             | 19                 | 6                   | 69                 | 34                            | 2                             | 31                   | 19                      | 1            | 3         |
| 274     | Soudan                          | Khartoum                  | 620            |                 | 40519           | 32                 | 8                   | 63                 | 52                            | 4                             | 23                   | 1354                    | 1            | 3         |
| 275     | Tunisie                         | Tunis                     | 10             |                 | 11351           | 17                 | 6                   | 77                 | 13                            | 2                             | 10                   | 879                     | 1            | 3         |
| 276     | Afrique du Sud                  | Pretoria                  | 1221040        |                 | 53835           | 20                 | 13                  | 58                 | 34                            | 2                             | 6                    | 3163                    | 1            | 4         |
| 277     | Botswana                        | Gaborone                  | 8512000        |                 | 2075            | 23                 | 16                  | 49                 | 28                            | 3                             | 9                    | 81                      | 1            | 4         |
| 278     | Lesotho                         | Maseru                    | 30355          |                 | 2142            | 27                 | 15                  | 50                 | 53                            | 3                             | 10                   | 90                      | 1            | 4         |
| 279     | Namibie                         | Windhoek                  | 783000         |                 | 2436            | 25                 | 7                   | 65                 | 30                            | 3                             | 18                   | 90                      | 1            | 4         |
| 280     | Swaziland                       | Eswatini                  | 17364          |                 | 1303            | 29                 | 15                  | 49                 | 60                            | 3                             | 13                   | 48                      | 1            | 4         |
| 281     | Bénin                           | Porto-Novo                | 114763         |                 | 11165           | 35                 | 9                   | 60                 | 66                            | 5                             | 26                   | 325                     | 1            | 5         |
| 282     | Burkina Faso                    | Ouagadougou               | 274000         |                 | 18420           | 39                 | 10                  | 58                 | 64                            | 5                             | 28                   | 445                     | 1            | 5         |
| 283     | Cap-Vert                        | Praia                     | 622900         |                 | 513             | 19                 | 5                   | 76                 | 15                            | 2                             | 9                    | 27                      | 1            | 5         |
| 284     | Côte d'Ivoire                   | Yamoussoukro              | 322462         |                 | 21784           | 36                 | 14                  | 52                 | 68                            | 5                             | 23                   | 693                     | 1            | 5         |
| 285     | Gambie                          | Banjul                    | 131900         |                 | 2033            | 42                 | 9                   | 60                 | 53                            | 6                             | 31                   | 47                      | 1            | 5         |
| 286     | Ghana                           | Accra                     | 2180000        |                 | 27532           | 29                 | 9                   | 62                 | 49                            | 4                             | 20                   | 948                     | 1            | 5         |
| 287     | Guinée                          | Conakry                   | 245857         |                 | 12656           | 36                 | 11                  | 57                 | 69                            | 5                             | 25                   | 397                     | 1            | 5         |
| 288     | Guinée-Bissau                   | Bissau                    | 36125          |                 | 1830            | 36                 | 12                  | 55                 | 88                            | 5                             | 23                   | 57                      | 1            | 5         |
| 289     | Libéria                         | Monrovia                  | 111369         |                 | 4615            | 34                 | 8                   | 62                 | 55                            | 5                             | 24                   | 140                     | 1            | 5         |
| 290     | Mali                            | Bamako                    | 298            |                 | 16775           | 46                 | 12                  | 56                 | 79                            | 7                             | 32                   | 444                     | 1            | 5         |
| 291     | Mauritanie                      | Nouakchott                | 1100           |                 | 4177            | 33                 | 9                   | 62                 | 69                            | 4                             | 23                   | 135                     | 1            | 5         |
| 292     | Niger                           | Niamey                    | 130000         |                 | 20033           | 49                 | 10                  | 60                 | 48                            | 7                             | 39                   | 523                     | 1            | 5         |
| 293     | Nigéria                         | Abuja                     | 923768         |                 | 188630          | 40                 | 12                  | 54                 | 68                            | 6                             | 27                   | 5140                    | 1            | 5         |
| 294     | Sénégal                         | Dakar                     | 196839         |                 | 15390           | 36                 | 7                   | 64                 | 46                            | 5                             | 28                   | 448                     | 1            | 5         |
| 295     | Sierra Leone                    | Freetown                  | 2800           |                 | 6432            | 35                 | 17                  | 46                 | 110                           | 4                             | 18                   | 172                     | 1            | 5         |
| 296     | Togo                            | Lomé                      | 127900         |                 | 7349            | 35                 | 10                  | 58                 | 62                            | 4                             | 24                   | 203                     | 1            | 5         |
| 297     | Canada                          | Ottawa                    | 4030           |                 | 36222           | 11                 | 8                   | 82                 | 4                             | 2                             | 10                   | 5929                    | 3            | NULL      |
| 298     | Etats-Unis                      | Washington                | 9831510        |                 | 327690          | 13                 | 8                   | 79                 | 6                             | 2                             | 8                    | 49223                   | 3            | NULL      |
| 299     | Biélorussie                     | Minsk                     | 207600         |                 | 9213            | 11                 | 16                  | 70                 | 5                             | 2                             | -5                   | 1292                    | 5            | 14        |
| 300     | Bulgarie                        | Sofia                     | 274200         |                 | 7057            | 9                  | 16                  | 74                 | 8                             | 2                             | -8                   | 1427                    | 5            | 14        |
| 301     | Hongrie                         | Budapest                  | 27800          |                 | 9890            | 10                 | 14                  | 75                 | 5                             | 1                             | -2                   | 1780                    | 5            | 14        |
| 302     | Moldavie                        | Chisinau                  | 375            |                 | 3413            | 12                 | 14                  | 69                 | 13                            | 1                             | -7                   | 413                     | 5            | 14        |
| 303     | Pologne                         | Varsovie                  | 300000         |                 | 38219           | 11                 | 11                  | 77                 | 5                             | 1                             | 0                    | 6059                    | 5            | 14        |
| 304     | Roumanie                        | Bucarest                  | 4000           |                 | 21516           | 10                 | 13                  | 74                 | 10                            | 1                             | -3                   | 3384                    | 5            | 14        |
| 305     | Russie                          | Moscou                    | 92100          |                 | 141729          | 12                 | 16                  | 68                 | 9                             | 2                             | -3                   | 19108                   | 5            | 14        |
| 306     | Slovaquie                       | Bratislava                | 196200         |                 | 5461            | 11                 | 11                  | 76                 | 5                             | 1                             | 1                    | 769                     | 5            | 14        |
| 307     | Tchèque (République)            | Prague                    | 78867          |                 | 10812           | 11                 | 11                  | 78                 | 2                             | 2                             | 3                    | 1953                    | 5            | 14        |
| 308     | Ukraine                         | Kiev                      | 430            |                 | 44354           | 11                 | 17                  | 69                 | 11                            | 2                             | -7                   | 6714                    | 5            | 14        |
| 309     | Anglo-Normandes (Îles)          | Saint Peter Port          | 198            |                 | 164             | 9                  | 9                   | 81                 | 8                             | 1                             | 5                    | 29                      | 5            | 16        |
| 310     | Danemark                        | Copenhague                | 751            |                 | 5684            | 11                 | 10                  | 80                 | 3                             | 2                             | 4                    | 1077                    | 5            | 16        |
| 311     | Estonie                         | Tallinn                   | 18270          |                 | 1277            | 11                 | 14                  | 75                 | 4                             | 2                             | -3                   | 238                     | 5            | 16        |
| 312     | Finlande                        | Helsinki                  | 11300          |                 | 5478            | 11                 | 10                  | 81                 | 2                             | 2                             | 3                    | 1144                    | 5            | 16        |
| 313     | Irlande                         | Dublin                    | 340            |                 | 4776            | 15                 | 6                   | 81                 | 3                             | 2                             | 10                   | 617                     | 5            | 16        |
| 314     | Islande                         | Reykjavik                 | 3288000        |                 | 340             | 14                 | 7                   | 83                 | 2                             | 2                             | 11                   | 47                      | 5            | 16        |
| 315     | Lettonie                        | Riga                      | 17820          |                 | 2021            | 11                 | 16                  | 73                 | 7                             | 2                             | -6                   | 377                     | 5            | 16        |
| 316     | Lituanie                        | Vilnius                   | 1760000        |                 | 2988            | 12                 | 14                  | 73                 | 5                             | 2                             | -4                   | 473                     | 5            | 16        |
| 317     | Norvège                         | Oslo                      | 385207         |                 | 5196            | 12                 | 8                   | 82                 | 2                             | 2                             | 10                   | 863                     | 5            | 16        |
| 318     | Royaume Uni                     | Londres                   | 243610         |                 | 64200           | 12                 | 9                   | 81                 | 4                             | 2                             | 6                    | 11745                   | 5            | 16        |
| 319     | Suède                           | Stockholm                 | 528447         |                 | 9759            | 12                 | 9                   | 82                 | 2                             | 2                             | 7                    | 1969                    | 5            | 16        |
| 320     | Albanie                         | Tirana                    | 28700          |                 | 3207            | 13                 | 7                   | 78                 | 13                            | 2                             | 3                    | 371                     | 5            | 17        |
| 321     | Bosnie-Herzégovine              | Sarajevo                  | 51209          |                 | 3814            | 9                  | 11                  | 77                 | 7                             | 1                             | -2                   | 615                     | 5            | 17        |
| 322     | Croatie                         | Zagreb                    | 23000          |                 | 4240            | 9                  | 13                  | 78                 | 5                             | 2                             | -4                   | 821                     | 5            | 17        |
| 323     | Espagne                         | Madrid                    | 1400           |                 | 47333           | 10                 | 9                   | 83                 | 3                             | 2                             | 3                    | 8748                    | 5            | 17        |
| 324     | Grèce                           | Athènes                   | 131957         |                 | 11120           | 9                  | 11                  | 81                 | 3                             | 2                             | -1                   | 2279                    | 5            | 17        |
| 325     | Italie                          | Rome                      | 435000         |                 | 61211           | 9                  | 10                  | 83                 | 2                             | 2                             | 1                    | 13442                   | 5            | 17        |
| 326     | Macédoine                       | Skopje                    | 25713          |                 | 2110            | 10                 | 10                  | 76                 | 9                             | 1                             | 0                    | 280                     | 5            | 17        |
| 327     | Malte                           | La Valette                | 1240000        |                 | 432             | 9                  | 9                   | 80                 | 4                             | 1                             | 2                    | 79                      | 5            | 17        |
| 328     | Monténégro                      | Podgorica                 | 13812          |                 | 621             | 11                 | 11                  | 75                 | 9                             | 2                             | 0                    | 88                      | 5            | 17        |
| 329     | Portugal                        | Lisbonne                  | 49             |                 | 10607           | 8                  | 10                  | 81                 | 3                             | 1                             | 0                    | 2086                    | 5            | 17        |
| 330     | Serbie                          | Belgrade                  | 21041          |                 | 9377            | 10                 | 13                  | 74                 | 10                            | 1                             | -5                   | 1451                    | 5            | 17        |
| 331     | Slovénie                        | Ljubljana                 | 20273          |                 | 2083            | 10                 | 10                  | 80                 | 3                             | 2                             | 2                    | 381                     | 5            | 17        |
| 332     | Allemagne                       | Berlin                    | 356800         |                 | 82453           | 9                  | 11                  | 81                 | 3                             | 1                             | -1                   | 17866                   | 5            | 15        |
| 333     | Autriche                        | Vienne                    | 7687000        |                 | 8589            | 10                 | 10                  | 82                 | 3                             | 2                             | 4                    | 1615                    | 5            | 15        |
| 334     | Belgique                        | Bruxelles                 | 30500          |                 | 11222           | 12                 | 10                  | 81                 | 3                             | 2                             | 3                    | 2120                    | 5            | 15        |
| 335     | France (métropolitaine)         | Paris                     | 543940         |                 | 65316           | 12                 | 9                   | 82                 | 3                             | 2                             | 5                    | 12458                   | 5            | 15        |
| 336     | Luxembourg                      | Luxembourg                | 160            |                 | 550             | 12                 | 8                   | 81                 | 2                             | 2                             | 12                   | 80                      | 5            | 15        |
| 337     | Pays-Bas                        | Amsterdam                 | 406800         |                 | 16885           | 11                 | 9                   | 81                 | 3                             | 2                             | 2                    | 3125                    | 5            | 15        |
| 338     | Suisse                          | Berne                     | 276            |                 | 8320            | 11                 | 8                   | 83                 | 3                             | 2                             | 10                   | 1530                    | 5            | 15        |
| 339     | Australie                       | Canberra                  | 2767000        |                 | 24223           | 13                 | 7                   | 83                 | 4                             | 2                             | 13                   | 3696                    | 6            | 12        |
| 340     | Nouvelle-Zélande                | Wellington                | 268021         |                 | 4641            | 13                 | 7                   | 82                 | 4                             | 2                             | 10                   | 695                     | 6            | 12        |
| 341     | Fidji                           | Suva                      | 267700         |                 | 898             | 19                 | 7                   | 70                 | 15                            | 3                             | 6                    | 54                      | 6            | 19        |
| 342     | Nouvelle-Calédonie              | Nouméa                    | 18576          |                 | 266             | 15                 | 7                   | 77                 | 12                            | 2                             | 13                   | 28                      | 6            | 19        |
| 343     | Papouasie-Nouvelle-Guinée       | 	Port Moresby             | 462840         |                 | 7788            | 28                 | 8                   | 63                 | 46                            | 4                             | 20                   | 240                     | 6            | 19        |
| 344     | Salomon (Îles)                  | Honiara                   | 28896          |                 | 596             | 29                 | 6                   | 68                 | 35                            | 4                             | 19                   | 20                      | 6            | 19        |
| 345     | Vanuatu                         | Port-Vila                 | 26             |                 | 270             | 26                 | 5                   | 72                 | 21                            | 3                             | 21                   | 11                      | 6            | 19        |
| 346     | Guam                            | Agana                     | 549            |                 | 172             | 17                 | 5                   | 80                 | 9                             | 2                             | 13                   | 16                      | 6            | 18        |
| 347     | Kiribati                        | Bairiki                   | 372000         |                 | 107             | 23                 | 6                   | 70                 | 30                            | 3                             | 15                   | 5                       | 6            | 18        |
| 348     | Micronésie (États fédérés de)   | Palikir                   | 701.9          |                 | 105             | 24                 | 6                   | 69                 | 31                            | 3                             | 8                    | 5                       | 6            | 18        |
| 349     | Polynésie française             | Papeete                   | 4167           |                 | 286             | 16                 | 6                   | 77                 | 6                             | 2                             | 10                   | 22                      | 6            | 20        |
| 350     | Samoa occidentales              | Apia                      | 2831           |                 | 195             | 25                 | 5                   | 74                 | 18                            | 4                             | 7                    | 10                      | 6            | 20        |
| 351     | Tonga                           | Nuku'alofa                | 514000         |                 | 107             | 24                 | 6                   | 73                 | 19                            | 4                             | 8                    | 6                       | 6            | 20        |
| 352     | Chine                           | Pékin                     | 9250           |                 | 1408922         | 13                 | 7                   | 76                 | 12                            | 2                             | 5                    | 138782                  | 4            | 8         |
| 353     | Chine - Hong Kong               | Victoria                  | 2755           |                 | 7365            | 9                  | 7                   | 84                 | 2                             | 1                             | 7                    | 1144                    | 4            | 8         |
| 354     | Chine - Macao                   | NULL                      | 118            |                 | 593             | 11                 | 5                   | 81                 | 4                             | 1                             | 15                   | 57                      | 4            | 8         |
| 355     | Corée du Nord                   | Pyongyang                 | 120540         |                 | 25282           | 14                 | 9                   | 71                 | 19                            | 2                             | 5                    | 2391                    | 4            | 8         |
| 356     | Corée du Sud                    | Séoul                     | 100210         |                 | 49976           | 10                 | 6                   | 82                 | 3                             | 1                             | 4                    | 6708                    | 4            | 8         |
| 357     | Japon                           | Tokyo                     | 70200          |                 | 126598          | 8                  | 11                  | 84                 | 2                             | 1                             | -2                   | 34139                   | 4            | 8         |
| 358     | Mongolie                        | Oulan-Bator               | 2              |                 | 2964            | 21                 | 7                   | 68                 | 23                            | 2                             | 14                   | 116                     | 4            | 8         |
| 359     | Taïwan                          | Taipei                    | 36197          |                 | 23467           | 9                  | 7                   | 80                 | 4                             | 1                             | 2                    | 3001                    | 4            | 8         |
| 360     | Brunei                          | Bandar Seri Begawan       | 110900         |                 | 434             | 15                 | 3                   | 79                 | 4                             | 2                             | 12                   | 23                      | 4            | 11        |
| 361     | Cambodge                        | Phnom Penh                | 475400         |                 | 15940           | 24                 | 6                   | 73                 | 35                            | 3                             | 16                   | 925                     | 4            | 11        |
| 362     | Indonésie                       | Jakarta                   | 1905           |                 | 258553          | 18                 | 6                   | 71                 | 23                            | 2                             | 11                   | 14426                   | 4            | 11        |
| 363     | Laos                            | Vientiane                 | 582600         |                 | 7146            | 25                 | 6                   | 70                 | 30                            | 3                             | 18                   | 281                     | 4            | 11        |
| 364     | Malaisie                        | Kuala Lumpur              | 587000         |                 | 31106           | 18                 | 5                   | 76                 | 4                             | 2                             | 15                   | 1851                    | 4            | 11        |
| 365     | Myanmar (Birmanie)              | Naypyidaw                 | 676578         |                 | 54591           | 16                 | 9                   | 66                 | 46                            | 2                             | 8                    | 3063                    | 4            | 11        |
| 366     | Philippines                     | Manille                   | 1285000        |                 | 103509          | 24                 | 6                   | 69                 | 20                            | 3                             | 17                   | 4366                    | 4            | 11        |
| 367     | Singapour                       | Singapour                 | 970            |                 | 5717            | 10                 | 5                   | 83                 | 2                             | 1                             | 17                   | 668                     | 4            | 11        |
| 368     | Thaïlande                       | Bangkok                   | 513120         |                 | 67541           | 10                 | 8                   | 75                 | 9                             | 1                             | 2                    | 7342                    | 4            | 11        |
| 369     | Timor-Est                       | Díli                      | 15006          |                 | 1194            | 36                 | 5                   | 69                 | 33                            | 5                             | 18                   | 42                      | 4            | 11        |
| 370     | Viêt Nam                        | Hanoï                     | 331690         |                 | 94191           | 15                 | 6                   | 76                 | 13                            | 2                             | 8                    | 6580                    | 4            | 11        |
| 371     | Afghanistan                     | Kaboul                    | 647497         |                 | 32730           | 31                 | 7                   | 62                 | 61                            | 4                             | 22                   | 823                     | 4            | 10        |
| 372     | Bangladesh                      | Dacca                     | 144000         |                 | 162285          | 19                 | 6                   | 72                 | 27                            | 2                             | 12                   | 7987                    | 4            | 10        |
| 373     | Bhoutan                         | Thimphou                  | 53             |                 | 787             | 19                 | 6                   | 70                 | 25                            | 2                             | 13                   | 40                      | 4            | 10        |
| 374     | Inde                            | New Delhi                 | 112100         |                 | 1297075         | 20                 | 8                   | 67                 | 39                            | 2                             | 11                   | 72780                   | 4            | 10        |
| 375     | Iran                            | Téhéran                   | 150            |                 | 80460           | 18                 | 5                   | 75                 | 13                            | 2                             | 12                   | 4582                    | 4            | 10        |
| 376     | Kazakhstan                      | Nour-Soultan              | 20770          |                 | 16931           | 19                 | 10                  | 67                 | 23                            | 2                             | 9                    | 1168                    | 4            | 10        |
| 377     | Kirgizistan                     | Bichkek                   | 199900         |                 | 5795            | 26                 | 7                   | 68                 | 31                            | 3                             | 16                   | 241                     | 4            | 10        |
| 378     | Maldives                        | Malé                      | 118500         |                 | 364             | 20                 | 3                   | 79                 | 8                             | 2                             | 17                   | 18                      | 4            | 10        |
| 379     | Népal                           | Katmandou                 | 147181         |                 | 28757           | 20                 | 7                   | 70                 | 30                            | 2                             | 11                   | 1561                    | 4            | 10        |
| 380     | Ouzbékistan                     | Tachkent                  | 448900         |                 | 30087           | 20                 | 7                   | 69                 | 42                            | 2                             | 12                   | 1327                    | 4            | 10        |
| 381     | Pakistan                        | Islamabad                 | 236000         |                 | 191177          | 24                 | 7                   | 67                 | 61                            | 3                             | 16                   | 8501                    | 4            | 10        |
| 382     | Sri Lanka                       | Sri Jayewardenepura-Kotte | 2506000        |                 | 21771           | 17                 | 7                   | 75                 | 8                             | 2                             | 7                    | 2017                    | 4            | 10        |
| 383     | Tadjikistan                     | Douchanbé                 | 41200          |                 | 8811            | 32                 | 6                   | 68                 | 54                            | 4                             | 23                   | 281                     | 4            | 10        |
| 384     | Turkménistan                    | Achgabat                  | 491210         |                 | 5439            | 21                 | 8                   | 66                 | 44                            | 2                             | 12                   | 231                     | 4            | 10        |
| 385     | Arabie saoudite                 | Riyad                     | 440            |                 | 30414           | 18                 | 3                   | 76                 | 10                            | 2                             | 17                   | 958                     | 4            | 9         |
| 386     | Arménie                         | Erevan                    | 29743          |                 | 2992            | 13                 | 9                   | 75                 | 18                            | 2                             | 1                    | 317                     | 4            | 9         |
| 387     | Azerbaïdjan                     | Bakou                     | 86600          |                 | 9706            | 17                 | 7                   | 71                 | 37                            | 2                             | 9                    | 556                     | 4            | 9         |
| 388     | Bahreïn                         | Manama                    | 760            |                 | 1381            | 14                 | 2                   | 77                 | 6                             | 2                             | 16                   | 32                      | 4            | 9         |
| 389     | Chypre                          | Nicosie                   | 1139000        |                 | 1176            | 11                 | 7                   | 80                 | 3                             | 1                             | 10                   | 154                     | 4            | 9         |
| 390     | Emirats Arabes Unis             | Abou Dabi                 | 83600          |                 | 9756            | 12                 | 1                   | 77                 | 5                             | 2                             | 20                   | 55                      | 4            | 9         |
| 391     | Georgie                         | Tbilissi                  | 69700          |                 | 4286            | 13                 | 12                  | 75                 | 18                            | 2                             | -5                   | 641                     | 4            | 9         |
| 392     | Irak                            | Bagdad                    | 93100          |                 | 36752           | 30                 | 5                   | 70                 | 26                            | 4                             | 27                   | 1181                    | 4            | 9         |
| 393     | Israël                          | Jérusalem                 | 22145          |                 | 8028            | 19                 | 6                   | 82                 | 3                             | 3                             | 14                   | 891                     | 4            | 9         |
| 394     | Jordanie                        | Amman                     | 103000         |                 | 7820            | 25                 | 4                   | 74                 | 15                            | 3                             | 14                   | 292                     | 4            | 9         |
| 395     | Koweït                          | Koweït                    | 17818          |                 | 3680            | 20                 | 3                   | 75                 | 8                             | 3                             | 25                   | 91                      | 4            | 9         |
| 396     | Liban                           | Beyrouth                  | 236800         |                 | 5075            | 14                 | 5                   | 81                 | 7                             | 1                             | -1                   | 465                     | 4            | 9         |
| 397     | Oman                            | Mascate                   | 19060          |                 | 4312            | 19                 | 3                   | 77                 | 6                             | 3                             | 29                   | 131                     | 4            | 9         |
| 398     | Palestine                       | Ramallah                  | 6020           |                 | 4663            | 30                 | 4                   | 74                 | 18                            | 4                             | 25                   | 145                     | 4            | 9         |
| 399     | Qatar                           | Doha                      | 312700         |                 | 2415            | 10                 | 1                   | 79                 | 6                             | 2                             | 23                   | 23                      | 4            | 9         |
| 400     | Syrie                           | Damas                     | 449900         |                 | 22775           | 23                 | 4                   | 75                 | 16                            | 3                             | 26                   | 1006                    | 4            | 9         |
| 401     | Turquie                         | Ankara                    | 5100           |                 | 77485           | 16                 | 6                   | 76                 | 10                            | 2                             | 10                   | 6133                    | 4            | 9         |
| 402     | Yémen                           | Sanaa                     | 555000         |                 | 26107           | 30                 | 7                   | 64                 | 53                            | 4                             | 22                   | 782                     | 4            | 9         |
