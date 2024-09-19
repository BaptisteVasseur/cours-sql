# TP Pokémons

## Partie 1 

- Récupérer le nom de tous les Pokémon.	
> SELECT nom FROM pokemons;

- Récupérer l’ID et le nom de tous les Pokémon.
> SELECT pokedex_id, nom FROM pokemons;

- Récupérer toutes les colonnes de la table pokemons.
> SELECT * FROM pokemons;

- Utiliser des alias pour renommer les colonnes dans les résultats.
> SELECT nom AS "Nom du Pokémon", pv AS "Points de Vie" FROM pokemons;

- Récupérer les 10 premiers Pokémon.
> SELECT * FROM pokemons LIMIT 10;

- Récupérer 10 Pokémon, en sautant les 10 premiers.
> SELECT * FROM pokemons LIMIT 10 OFFSET 10;

- Récupérer tous les Pokémon, triés par leur nom en ordre croissant.
> SELECT * FROM pokemons ORDER BY nom ASC;

- Récupérer tous les Pokémon, triés par leur nom en ordre décroissant.
> SELECT * FROM pokemons ORDER BY nom DESC;

- Récupérer le Pokémon ayant un pokedex_id de 42.
> SELECT * FROM pokemons WHERE pokedex_id = 42;

- Récupérer les Pokémon dont le pokedex_id est supérieur à 10 avec une limit de 10
> SELECT * FROM pokemons WHERE pokedex_id > 10 LIMIT 10;

- Récupérer les Pokémon ayant un pokedex_id de 42 ou de 69.
> SELECT * FROM pokemons WHERE pokedex_id = 42 or pokedex_id = 69;

- Récupérer les Pokémon ayant un pokedex_id de 42, 69, 79, 89, 99, 109, 119 ou 99.
> SELECT * FROM pokemons WHERE pokedex_id IN (42, 69, 79, 89, 99, 109, 119, 99);

- Récupérer les Pokémon ayant un pokedex_id compris entre 10 et 20.
> SELECT * FROM pokemons WHERE pokedex_id BETWEEN 10 AND 20;
> SELECT * FROM pokemons WHERE pokedex_id > 10 AND pokedex_id > 20;

- Récupérer les Pokémon dont le nom est exactement “Pikachu”.
> SELECT * FROM pokemons WHERE nom = 'Pikachu';

- Récupérer les Pokémon dont le nom se termine par “chu”.
> SELECT * FROM pokemons WHERE nom LIKE '%chu';

- Récupérer les Pokémon dont le nom commence par “Fl”. ( Fl comme le F et le L de Florizarre)
> SELECT * FROM pokemons WHERE nom LIKE 'Fl%';

- Récupérer les Pokémon dont le nom contient “ch”.
> SELECT * FROM pokemons WHERE nom LIKE '%ch%';

- Récupérer le pokémon qui à le plus de PV
> SELECT * FROM pokemons ORDER BY pv DESC LIMIT 1;

## Partie 2 : 

- Lister le nom de tous les surnoms des pokemons dans pokemon_stocke_dans_pc (il ne faut pas de doublons dans la liste, donc si on à 2 pokémons avec le surnom PikaPika, il faut que PikaPika ne soit qu'une seule fois dans la liste)
> SELECT DISTINCT surnom FROM pokemon_stocke_dans_pc;

- Lister les arènes créées avant l’année 2014
> SELECT * FROM arenes WHERE YEAR(date_creation) < 2014;

- Afficher les objets et leur prix
> SELECT nom, prix FROM objets;

- Afficher tous les objets d’une certaine catégorie, par exemple ‘Potion’
> SELECT * FROM objets WHERE categorie = 'Potion';

- Trouver le nombre de dresseurs inscrits
> SELECT COUNT(\*) AS nombre_dresseurs FROM dresseur;

- Trouver toutes les consoles différentes possédées par les dresseurs
> SELECT DISTINCT console FROM dresseur;

- Afficher les Pokémon et leur indice de combat (attaque + défense)
> SELECT nom, (attaque + defense) AS indice_combat FROM pokemons;

- Trouver les Pokémon avec un rapport attaque/défense supérieur à 1.2
> SELECT nom FROM pokemons WHERE (attaque / defense) > 1.2;

- Selectionner le nom, poid et taille des pokémon ordonnés par taille de façon croissante ET par poids de façon décroissante
> SELECT nom, poids, taille FROM pokemons ORDER BY taille ASC, poids DESC;

- Lister les noms des Pokémon stockés dans l’équipe d’un dresseur 
> SELECT p.nom FROM pokemon_stocke_dans_equipe pse JOIN pokemons p ON pse.id_pokemon = p.pokedex_id WHERE pse.id_dresseur = XXX; XXX = numéro du dresseur

- Afficher les transactions de type ‘Achat’
> SELECT * FROM transactions WHERE type = 'Achat';

- Calculer l’âge des dresseurs en années (approximation)
> SELECT prenom, YEAR(NOW()) - YEAR(date_naissance) AS age FROM dresseur;

## Partie 3 : 

- Récuperer le nom des Pokémon et leur type en joignant les tables pokemons et types.
> SELECT p.nom, t.nom AS type FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id JOIN types t ON pt.type = t.nom;

- Récupérer les Pokémon de type “Feu” (en faisant le tri via le nom présent dans la table type).
> SELECT p.nom FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id WHERE pt.type = 'Feu';

- Récuperer les Pokémon avec leur type, triés par le nom du type.
> SELECT p.nom, t.nom AS type FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id JOIN types t ON pt.type = t.nom ORDER BY t.nom;

- Compter le Nombre de Pokémon par Type
> SELECT t.nom AS type, COUNT(p.pokedex_id) AS nombre_pokemons FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id JOIN types t ON pt.type = t.nom GROUP BY t.nom;

- Trouver le Nombre Moyen de Points de Vie (HP) par Type
> SELECT t.nom AS type, AVG(p.pv) AS moyenne_pv FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id JOIN types t ON pt.type = t.nom GROUP BY t.nom;

- Trouver les trois types ayant le plus de Pokémon.
> SELECT t.nom AS type, COUNT(p.pokedex_id) AS nombre_pokemons FROM pokemons p JOIN pokemon_types pt ON p.pokedex_id = pt.pokedex_id JOIN types t ON pt.type = t.nom GROUP BY t.nom ORDER BY nombre_pokemons DESC LIMIT 3;

- Trouver en quelle année il y a le plus de combats
> SELECT YEAR(date_combat) AS annee, COUNT(\*) AS nombre_combats FROM combats GROUP BY annee ORDER BY nombre_combats DESC LIMIT 1;

- Trouver le pokémon qui est le plus souvent dans une équipe
> SELECT p.nom, COUNT(pse.id_pokemon) AS occurrences FROM pokemon_stocke_dans_equipe pse JOIN pokemons p ON pse.id_pokemon = p.pokedex_id GROUP BY pse.id_pokemon ORDER BY occurrences DESC LIMIT 1;

- Trouver les pokémons les moins utilisés dans les équipes 
> SELECT p.nom, COUNT(pse.id_pokemon) AS occurrences FROM pokemon_stocke_dans_equipe pse JOIN pokemons p ON pse.id_pokemon = p.pokedex_id GROUP BY pse.id_pokemon ORDER BY occurrences ASC LIMIT 1;

- Faire le classement des arènes les plus dure à battre (donc en fonction du ratio combats/défaites)
> SELECT a.nom, SUM(CASE WHEN ca.resultat = 'Défaite' THEN 1 ELSE 0 END) / COUNT(ca.id) AS ratio_defaite FROM arenes a JOIN combats_arenes ca ON a.id = ca.id_arene GROUP BY a.nom ORDER BY ratio_defaite DESC;

- Retrouver la somme que le dresseur n°5 à dans son inventaire (en faisant le calcul des transactions)
> SELECT SUM(montant) AS total_montant FROM transactions WHERE id_dresseur = 5;

- Trouver l'évolution de chaque pokémon de mon équipe 
> SELECT pe.id_pokemon, p.nom, e.evolution_id, p2.nom AS evolution FROM pokemon_stocke_dans_equipe pe JOIN evolutions e ON pe.id_pokemon = e.pokedex_id JOIN pokemons p ON pe.id_pokemon = p.pokedex_id JOIN pokemons p2 ON e.evolution_id = p2.pokedex_id WHERE pe.id_dresseur = XXX; -- XXX = numéro du dresseur

- Compter le nombre total de pokémon par dresseur (ceux dans le pc et ceux dans l'équipe)
> SELECT d.prenom, 
>       (SELECT COUNT(\*) FROM pokemon_stocke_dans_pc pc WHERE pc.id_dresseur = d.id) +
>       (SELECT COUNT(\*) FROM pokemon_stocke_dans_equipe pe WHERE pe.id_dresseur = d.id) AS total_pokemons
> FROM dresseur d;

- Trouver le dresseur le plus fort en combat multijoueurs
> SELECT d.prenom, COUNT(c.id) AS nombre_combats, SUM(CASE WHEN c.resultat = 'Victoire' THEN 1 ELSE 0 END) AS victoires FROM dresseur d JOIN combats c ON d.id = c.id_dresseur1 OR d.id = c.id_dresseur2 GROUP BY d.prenom ORDER BY victoires DESC, nombre_combats DESC LIMIT 1;
