# TP Pokémons

## Partie 1 

- Récupérer le nom de tous les Pokémon.	
> Il faut préviser qu'on ne veux avoir que la colonne 'nom'

- Récupérer l’ID et le nom de tous les Pokémon.
> Il faut en plus du nom, ajouter la colonne pokedex_id

- Récupérer toutes les colonnes de la table pokemons.
> Pour ne pas préciser toutes les colonnes qu'il existe, on peux remplacer les colonnes par une *

- Utiliser des alias pour renommer les colonnes dans les résultats.
> Pour renommer une colonne, on peut utiliser AS

- Récupérer les 10 premiers Pokémon.
> Pour récupérer les 10 premiers résultat, on veux LIMITer les nombre de lignes à 10

- Récupérer 10 Pokémon, en sautant les 10 premiers.
> Pour sauter les 10 premiers éléments il faut utiliser l'OFFSET 

- Récupérer tous les Pokémon, triés par leur nom en ordre croissant.
> On veux ordonner par une colonne (ORDER BY) de façon croissante (en anglais ASCend)

- Récupérer tous les Pokémon, triés par leur nom en ordre décroissant.
> On veux ordonner par une colonne (ORDER BY) de façon décroissante (en anglais DESCend)

- Récupérer le Pokémon ayant un pokedex_id de 42.
> On veux rajouter une condition, ça ça se fait dans un WHERE (on veux que le pokedex_id soit EGALE à 42)

- Récupérer les Pokémon dont le pokedex_id est supérieur à 10 avec une limit de 10
> Dans la condition, on veux que le pokedex_id soit < ou > à 10 ? avec une LIMITe de 10

- Récupérer les Pokémon ayant un pokedex_id de 42 ou de 69.
> On veux que ce soit 42 ou (en anglais OR) 69

- Récupérer les Pokémon ayant un pokedex_id de 42, 69, 79, 89, 99, 109, 119 ou 99.
> On veux que le pokedex_id soit dans (en anglais IN) la liste

- Récupérer les Pokémon ayant un pokedex_id compris entre 10 et 20.
> On veux que ce soit > 10 ET < 20 

- Récupérer les Pokémon dont le nom est exactement “Pikachu”.
> On veux que le nom soit EGALE à Pikachu

- Récupérer les Pokémon dont le nom se termine par “chu”.
> Il va falloir utiliser les LIKE avec des % (faut regarder sur internet dans la doc)

- Récupérer les Pokémon dont le nom commence par “Fl”. ( Fl comme le F et le L de Florizarre)
> Ici c'est pareil, sauf que la position du % va changer

- Récupérer les Pokémon dont le nom contient “ch”.
> Ici, on va rajouter un autre %

- Récupérer le pokémon qui à le plus de PV
> Et si on récupérez les pokémons en les ordonnants par leurs PV de façon décroissante et en ne récupérant que 1 résultats ?

## Partie 2 : 

- Lister le nom de tous les surnoms des pokemons dans pokemon_stocke_dans_pc (il ne faut pas de doublons dans la liste, donc si on à 2 pokémons avec le surnom Baptiste, il faut que Baptiste ne soit qu'une seule fois dans la liste)
> On veux que des valeurs DISTINCTes 

- Lister les arènes créées avant l’année 2014
> Il faut récupérer que l'année avec une fonction 

- Afficher les objets et leur prix
> Rien de compliqué, faut juste regarder dans la bonne table et mettre les bonnes colonnes 

- Afficher tous les objets d’une certaine catégorie, par exemple ‘Potion’
> Là ça ce complique (ou pas). Spoiler : pas besoin de faire de JOIN

- Trouver le nombre de dresseurs inscrits
> Il va falloir COUNTé le nombre de nom (ou de pokedex_id si tu préfères) ?

- Trouver toutes les consoles différentes possédées par les dresseurs
> Faut selectioner dans la bonne table, les bonnes colonnes et comme pour le prénom, ne pas avoir de doublons sur le nom de la console 

- Afficher les Pokémon et leur indice de combat (attaque + défense)
> Dans les SELECT, au lieu de récupérer des colonnes qui existent dans la base de donnée, tu peux aussi faire tes propres colonnes temporaires et faire des calculs, genre au lieu de récupérer "nom, pokedex_id" tu peux récupérer "attaque + defense"

- Trouver les Pokémon avec un rapport attaque/défense supérieur à 1.2
> Si les additions ça fonctionne pour selectionner des colonnes, ça marche peut-être aussi dans le where ?

- Selectionner le nom, poid et taille des pokémon ordonnés par taille de façon croissante ET par poids de façon décroissante
> Dans ton ORDER BY tu peux avoir plusieurs colonnes

- Lister les noms des Pokémon stockés dans l’équipe d’un dresseur 
> Il faut faire une requête dans la table pokemon_stocke_dans_equipe et faire une jointure sur id_pokemon de la table pour récupérer le pokémon associé

- Afficher les transactions de type ‘Achat’
> Celle là elle est donnée, faut juste faire une condition sur le champs 'type' sans rien faire d'autre (c'est pour te repose un peu elle)

- Calculer l’âge des dresseurs en années (approximation)
> La c'est carrément plus chaud ! Faut faire comme pour les requêtes au dessus (créer une fausse colonne), sauf qu'au lieu de faire une division, il faut faire une soustraction de l'année de NOW() (NOW() = la date d'aujoud'hui avec jour/mois/année) et de l'année de la date_naissance (qui est une date avec un jour/mois/année). Spoiler pour récupérer que l'année dans une date tu dois utiliser la fonction YEAR() (Par exemple YEAR(NOW()) te donne l'année en cours)

## Partie 3 : 

- Récuperer le nom des Pokémon et leur type en joignant les tables pokemons et types.
> Faut faire une jointure

- Récupérer les Pokémon de type “Feu” (en faisant le tri via le nom présent dans la table type).
> Faut faire aussi une jointure mais cette fois-ci en ajoutant une condition 

- Récuperer les Pokémon avec leur type, triés par le nom du type.
> Encore plus simple, juste avec un order 

- Compter le Nombre de Pokémon par Type
> Tu vas devoir GROUPer des résultats par le type et COUNTer 

- Trouver le Nombre Moyen de Points de Vie (HP) par Type
> Pareil tu vas devoir GROUPer des résultats par le type et faire la moyenne (AVeraGe en anglais)

- Trouver les trois types ayant le plus de Pokémon.
> Il va falloir utiliser GROUP BY, COUNT et ORDER BY pour classer les types, puis limiter les résultats avec LIMIT.

- Trouver en quelle année il y a le plus de combats
> Extraire l'année de la date du combat et utiliser GROUP BY et COUNT

- Trouver le pokémon qui est le plus souvent dans une équipe
> Compter combien de fois chaque Pokémon apparaît dans une équipe et trier pour trouver le plus fréquent.

- Trouver les pokémons les moins utilisés dans les équipes 
> La même requête que celle au dessus mais avec un ORDER différent

- Faire le classement des arènes les plus dure à battre (donc en fonction du ratio combats/défaites)
> Utiliser COUNT pour compter le nombre de victoires et de défaites par arène, puis calculer le ratio. (Le plus compliqué c'est que Defaire et Victoire sont stockés comme VARCHAR donc il faut convertir ça en INT avec CASE WHEN)

- Retrouver la somme que le dresseur n°5 à dans son inventaire (en faisant le calcul des transactions)
> Utiliser une fonction d’agrégation SUM pour additionner les montants des transactions du dresseur n°5

- Trouver l'évolution de chaque pokémon de mon équipe 
> Plus simple pour se remettre des requêtes hardcore d'avant : il faut joindre les tables des évolutions et des pokémons, en filtrant par l’équipe du dresseur.

- Compter le nombre total de pokémon par dresseur (ceux dans le pc et ceux dans l'équipe)
> Faire une requête pour compter les Pokémon stockés dans le PC et ceux dans l’équipe, puis une somme des deux résultats (il faut faire un premierselect)

- Trouver le dresseur le plus fort en combat multijoueurs
> Calculer le ration nombre de victoire/ nombre de defaite par joueur 
