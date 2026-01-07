# TP E-Commerce

## Partie 1 : Requêtes de base

- Récupérer le nom de tous les produits
> Il faut préciser qu'on ne veut avoir que la colonne 'nom'

- Récupérer l'ID et le nom de tous les utilisateurs
> Il faut en plus du nom, ajouter la colonne id_utilisateur

- Récupérer toutes les colonnes de la table produits
> Pour ne pas préciser toutes les colonnes, on peut remplacer par une *

- Utiliser des alias pour renommer les colonnes dans les résultats
> Pour renommer une colonne, on peut utiliser AS

- Récupérer les 15 premiers produits
> Pour récupérer les 15 premiers résultats, on veut LIMITer le nombre de lignes à 15

- Récupérer 10 produits, en sautant les 5 premiers
> Pour sauter les 5 premiers éléments il faut utiliser l'OFFSET

- Récupérer tous les produits, triés par leur prix en ordre croissant
> On veut ordonner par une colonne (ORDER BY) de façon croissante (en anglais ASCend)

- Récupérer tous les produits, triés par leur nom en ordre décroissant
> On veut ordonner par une colonne (ORDER BY) de façon décroissante (en anglais DESCend)

- Récupérer le produit ayant un id_produit de 10
> On veut rajouter une condition, ça se fait dans un WHERE (on veut que l'id_produit soit ÉGAL à 10)

- Récupérer les produits dont le prix est supérieur à 100€ avec une limite de 20
> Dans la condition, on veut que le prix soit > à 100 avec une LIMITe de 20

- Récupérer les produits ayant un id_produit de 5, 10 ou 15
> On veut que l'id_produit soit dans (en anglais IN) la liste

- Récupérer les produits ayant un prix compris entre 50€ et 150€
> On peut utiliser BETWEEN pour exprimer un intervalle

- Récupérer les produits dont le nom contient "iPhone" ou "Samsung"
> On veut que ce soit "iPhone" ou (OR) "Samsung"

- Récupérer les produits dont le nom commence par "Mac"
> Il va falloir utiliser LIKE avec un % (le % représente n'importe quel caractère)

- Récupérer les produits dont la description contient le mot "portable"
> Utiliser LIKE avec des % avant et après le mot

- Récupérer le produit le plus cher
> Et si on récupérait les produits en les ordonnant par prix de façon décroissante et en ne récupérant qu'1 résultat ?

## Partie 2 : Fonctions d'agrégation et filtres

- Lister tous les vendeurs (sans doublons)
> On veut que des valeurs DISTINCTes

- Lister les commandes passées après le 1er janvier 2025
> Il faut comparer la date_commande avec une date spécifique

- Afficher les produits avec leur prix TTC (TVA à 20%)
> Dans les SELECT, tu peux faire des calculs : prix * 1.20

- Afficher tous les produits d'une catégorie spécifique (ex: 'Électronique')
> Utiliser une jointure avec la table categories et filtrer sur le nom

- Trouver le nombre total d'utilisateurs inscrits
> Il va falloir COUNTer le nombre d'id_utilisateur

- Trouver tous les statuts de commandes différents
> Sélectionner dans la bonne table avec DISTINCT

- Afficher les produits et leur marge théorique (prix × 0.3)
> Tu peux créer une colonne calculée dans le SELECT

- Trouver les produits avec un stock inférieur à 50
> Ajouter une condition WHERE sur quantite_stock

- Calculer l'ancienneté des utilisateurs en années (approximation)
> Faire la soustraction EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date_inscription)

- Sélectionner le nom, prix et quantité en stock des produits ordonnés par prix décroissant ET par stock croissant
> Dans ton ORDER BY tu peux avoir plusieurs colonnes avec des ordres différents

- Lister les noms des produits qui sont dans un panier
> Il faut faire une jointure entre panier et produits

- Afficher les commandes avec le statut 'Livrée'
> Simple condition WHERE sur le champ statut

- Compter le nombre de produits par catégorie
> Utiliser GROUP BY sur id_categorie et COUNT(*)

## Partie 3 : Jointures et agrégations avancées

- Récupérer le nom des produits avec leur catégorie en joignant les tables
> Faire un JOIN entre produits et categories

- Récupérer les produits de la catégorie "Électronique" (via jointure)
> Faire une jointure et ajouter une condition WHERE sur le nom de la catégorie

- Récupérer les produits avec leur catégorie, triés par le nom de la catégorie
> Jointure avec un ORDER BY sur le nom de la catégorie

- Compter le nombre de produits par catégorie
> GROUP BY sur la catégorie et COUNT des produits

- Trouver le prix moyen des produits par catégorie
> GROUP BY sur la catégorie et AVG(prix)

- Trouver les 3 catégories ayant le plus de produits
> GROUP BY, COUNT, ORDER BY décroissant et LIMIT 3

- Trouver en quel mois il y a le plus de commandes
> Extraire le mois avec EXTRACT(MONTH FROM date_commande), GROUP BY et COUNT

- Trouver le produit le plus commandé (le plus vendu)
> Joindre lignes_commande et produits, sommer les quantités, trier et limiter à 1

- Trouver les produits jamais commandés
> LEFT JOIN entre produits et lignes_commande, filtrer avec WHERE IS NULL

- Faire le classement des vendeurs par nombre de produits vendus
> Joindre vendeurs, produits et lignes_commande, faire un SUM des quantités et GROUP BY vendeur

- Calculer le montant total des commandes par utilisateur
> GROUP BY sur id_utilisateur et SUM(montant_total)

- Trouver les produits avec leurs avis (note et commentaire)
> Jointure entre produits et avis

- Compter le nombre total de commandes par utilisateur
> GROUP BY sur id_utilisateur et COUNT des commandes

- Trouver l'utilisateur qui a dépensé le plus d'argent
> SUM(montant_total) par utilisateur, ORDER BY décroissant, LIMIT 1

## Partie 4 : Requêtes complexes

- Afficher les utilisateurs avec leur adresse de livraison par défaut
> Jointure entre utilisateurs et adresses_livraison avec condition WHERE par_defaut = TRUE

- Calculer le chiffre d'affaires total de chaque vendeur
> Joindre vendeurs, produits, lignes_commande et calculer SUM(prix_unitaire * quantite)

- Trouver les produits qui ont une note moyenne supérieure à 4.5
> GROUP BY sur id_produit avec AVG(note), utiliser HAVING pour filtrer

- Afficher les commandes avec le nombre de produits différents commandés
> Joindre commandes et lignes_commande, GROUP BY commande et COUNT(DISTINCT id_produit)

- Lister les utilisateurs qui ont laissé au moins un avis
> DISTINCT sur les utilisateurs qui sont dans la table avis

- Trouver les catégories dont le prix moyen des produits est supérieur à 200€
> GROUP BY catégorie, AVG(prix) et HAVING AVG(prix) > 200

- Calculer le nombre d'avis par produit et afficher les 5 produits les plus commentés
> GROUP BY produit, COUNT des avis, ORDER BY décroissant, LIMIT 5

- Trouver les promotions encore valides aujourd'hui
> WHERE date_debut <= CURRENT_DATE AND date_fin >= CURRENT_DATE

- Afficher les produits en rupture de stock (quantité = 0)
> Simple WHERE quantite_stock = 0

- Calculer le montant moyen des commandes par statut
> GROUP BY statut et AVG(montant_total)

- Trouver les utilisateurs inscrits depuis plus de 2 ans
> WHERE date_inscription < CURRENT_DATE - INTERVAL '2 years'

- Lister les vendeurs qui ont vendu au moins 10 produits différents
> Joindre produits et vendeurs, COUNT(DISTINCT id_produit) et HAVING >= 10

- Afficher les commandes livrées en moins de 5 jours
> WHERE statut = 'Livrée' AND (date_livraison - date_commande::date) < 5

- Trouver le jour de la semaine où il y a le plus de commandes
> EXTRACT(DOW FROM date_commande) pour obtenir le jour, GROUP BY et COUNT

## Partie 5 : Requêtes avancées et analytiques

- Afficher les noms d'utilisateurs en majuscule avec leur email en minuscule
> Utiliser UPPER() et LOWER()

- Calculer le panier moyen par utilisateur (montant total / nombre de commandes)
> SUM(montant_total) / COUNT(*) par utilisateur avec GROUP BY

- Trouver le trimestre de l'année avec le plus de chiffre d'affaires
> EXTRACT(QUARTER FROM date_commande), SUM(montant_total), GROUP BY et ORDER BY

- Afficher les produits avec leur catégorie de prix ('Budget' si < 50€, 'Moyen' si entre 50€ et 200€, 'Premium' si > 200€)
> Utiliser CASE WHEN avec des conditions sur le prix

- Trouver les utilisateurs qui n'ont jamais passé de commande
> LEFT JOIN entre utilisateurs et commandes, WHERE id_commande IS NULL

- Calculer le taux de satisfaction par catégorie (moyenne des notes des avis)
> Joindre produits, categories et avis, GROUP BY catégorie, AVG(note)

- Afficher les produits qui ont reçu au moins 3 avis
> GROUP BY produit sur la table avis, HAVING COUNT(*) >= 3

- Trouver les utilisateurs qui ont commandé dans au moins 3 catégories différentes
> Joindre commandes, lignes_commande, produits, categories, GROUP BY utilisateur, HAVING COUNT(DISTINCT id_categorie) >= 3

- Calculer le taux d'utilisation des promotions (pourcentage de commandes avec promo)
> COUNT avec CASE WHEN pour compter les commandes avec promo, diviser par COUNT total, multiplier par 100

- Afficher les 5 produits les plus rentables (prix × quantité vendue)
> Joindre produits et lignes_commande, calculer SUM(prix_unitaire * quantite), ORDER BY décroissant, LIMIT 5

- Trouver les vendeurs dont aucun produit n'a été commandé
> LEFT JOIN entre vendeurs, produits et lignes_commande, WHERE id_ligne IS NULL

- Calculer la valeur moyenne du panier par mois
> EXTRACT(MONTH FROM date_commande), AVG(montant_total), GROUP BY mois

- Afficher les produits ajoutés au catalogue depuis moins de 6 mois
> WHERE date_ajout > CURRENT_DATE - INTERVAL '6 months'

- Trouver les paires de produits souvent commandés ensemble
> Self-join sur lignes_commande avec même id_commande, GROUP BY sur les paires, COUNT pour trouver les plus fréquentes

- Calculer le montant total des commandes en attente par vendeur
> Joindre vendeurs, produits, lignes_commande et commandes, WHERE statut = 'En attente', SUM et GROUP BY vendeur


