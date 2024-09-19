# TP Pokémons


## Introduction 


Le but du TP est de découvrir le fonctionnement d'une base de données en effectuant des requêtes SQL simples. Ensuite vous devrez être capable de créer votre propre base de donnée, en ajoutant des tables, en les modifiants et en les supprimant. Tout en sachant comment ajouter vous même manuellement des données à l'intérieur des tables. 


## Création de la base de donnée 


1 - Lire le cahier des charges 
2 - Avec le cahier des charges, faire le diagramme UML des tables 
3 - Ajouter les différentes colonnes pour chaque table (nom + type)
4 - Lier les tables entre elles 

5 - Pour chaque table, créer les requêtes SQL de création des tables
6 - Ajouter les clés étrangères entre les tables


## Ajouter des données


7 - Ajouter des types de pokémons (eau, feu, ...)
8 - Ajouter des pokémons (salameche, pickachu, bulbizarre, carapuce, ...)
9 - Ajouter des dresseurs (Jean-michel, Romuald, Jacques, ...)
10 - Ajouter des arènes (mettre des noms aléatoires)


## Lire les données 


11 - Tester les requêtes SQL suivantes : 

- Récupérer le nom de tous les Pokémon.	
- Récupérer l’ID et le nom de tous les Pokémon.
- Récupérer toutes les colonnes de la table pokemons.
- Utiliser des alias pour renommer les colonnes dans les résultats.
- Récupérer les 10 premiers Pokémon.
- Récupérer 10 Pokémon, en sautant les 10 premiers.
- Récupérer tous les Pokémon, triés par leur nom en ordre croissant.
- Récupérer tous les Pokémon, triés par leur nom en ordre décroissant.
- Récupérer le Pokémon ayant un pokedex_id de 42.
- Récupérer les Pokémon dont le pokedex_id est supérieur à 10 avec une limit de 10
- Récupérer les Pokémon ayant un pokedex_id de 42, 69 ou 99.
- Récupérer les Pokémon ayant un pokedex_id compris entre 10 et 20.
- Récupérer les Pokémon ayant un pokedex_id de 42 ou de 69.
- Récupérer les Pokémon dont le nom est exactement “Pikachu”.
- Récupérer les Pokémon dont le nom se termine par “chu”.
- Récupérer les Pokémon dont le nom commence par “Fl”.
- Récupérer les Pokémon dont le nom contient “ch”.
- Récupérer le pokémon qui à le plus de PV
- Filtrer les pokémons qui ont le type "eau"


## Lier les pokémons entre eux 


12 - Lier les pokémons avec leurs types
13 - Lier les pokemons aux dresseurs


## Lire les données (suite)


14 - Tester les requêtes SQL suivantes : 

- Récuperer le nom des Pokémon et leur type en joignant les tables pokemons et types.
- Récupérer les Pokémon de type “Feu” (en faisant le tri via le nom présent dans la table type).
- Récuperer les Pokémon avec leur type, triés par le nom du type.


## Importer une base de donnée


15 - Supprimer toutes vos tables 
16 - Importer le fichier bdd.sql (ce fichier est sur github)


## Lire les données (suite)


- Compter le Nombre de Pokémon par Type
- Trouver le Nombre Total de Pokémon
- Trouver le Nombre Moyen de Points de Vie (HP) par Type
- Trouver les trois types ayant le plus de Pokémon.
- Identifier le Pokémon qui a le plus grand nombre d’attaques
- Trouver en quelle année il y à le plus de combats
- Trouver le pokémon qui est le plus souvent dans une équipe
- Trouver les pokémons les moins utilisés dans les équipes 
- Faire le classement des arènes les plus dure à battre
- Retrouver la somme que le dresseur n°5 à dans son inventaire (en faisant le calcul des transactions)
- Trouver les objets les plus achetés 
- Trouver les objets les moins achetés 
- Trouver le pokémon le plus fort 





# TP Pokémons 2

- Lister le nom de tout les dresseurs inscrits (il ne faut pas de doublons dans la liste)
- Lister les arènes créées avant l’année 2014
- Afficher les objets et leur prix
- Afficher tous les objets d’une certaine catégorie, par exemple ‘Potion’
- Trouver le nombre de dresseurs inscrits
- Trouver toutes les consoles différentes possédées par les dresseurs
- Afficher les Pokémon et leur indice de combat (attaque + défense)
- Trouver les Pokémon avec un rapport attaque/défense supérieur à 1.2
- Calculer l’âge des dresseurs en années (approximation)
- Selectionner le nom, poid et taille des pokémon ordonnés par taille de façon croissante ET par poids de façon décroissante
- Lister les noms des Pokémon stockés dans l’équipe d’un dresseur 
- Afficher les transactions de type ‘Achat’