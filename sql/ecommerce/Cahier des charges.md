# Cahier des Charges : Plateforme E-Commerce - Gestion des Données

## 1. Contexte du Projet

Le projet consiste à concevoir un système de gestion de données pour une plateforme e-commerce de type marketplace (Amazon, Cdiscount). La plateforme permettra aux clients d'acheter des produits auprès de différents vendeurs, de gérer leurs commandes, de laisser des avis, et de bénéficier de promotions.

## 2. Objectifs

La plateforme doit fournir une expérience d'achat complète où les utilisateurs peuvent :

- Parcourir et rechercher des produits dans différentes catégories.
- Ajouter des produits à leur panier et passer des commandes.
- Gérer plusieurs adresses de livraison et moyens de paiement.
- Consulter l'historique de leurs commandes et suivre leur statut.
- Laisser des avis et des notes sur les produits achetés.
- Bénéficier de promotions et de codes promo.

## 3. Description Fonctionnelle

### 3.1 Gestion des Utilisateurs

Chaque utilisateur possède un compte avec des informations personnelles :

- Email et mot de passe pour l'authentification.
- Nom, prénom et date de naissance.
- Date d'inscription et dernière connexion.
- Statut du compte (actif, suspendu).

Les utilisateurs peuvent gérer plusieurs adresses de livraison, chacune contenant une adresse complète avec ville, code postal, pays, et numéro de téléphone.

### 3.2 Catalogue de Produits

La plateforme propose un large catalogue de produits organisés en catégories hiérarchiques :

- Chaque produit possède un nom, une description, un prix, une quantité en stock.
- Les produits appartiennent à une catégorie (Électronique, Mode, Maison, etc.).
- Chaque produit est vendu par un vendeur spécifique.
- Les produits peuvent avoir une note moyenne basée sur les avis clients.

### 3.3 Gestion des Catégories

Les catégories permettent d'organiser le catalogue :

- Catégories principales (Électronique, Mode, Maison, Sport, etc.).
- Sous-catégories possibles (ex : Smartphones dans Électronique).
- Description de chaque catégorie.

### 3.4 Gestion des Vendeurs

La plateforme fonctionne comme une marketplace avec plusieurs vendeurs :

- Informations du vendeur (nom, email, téléphone).
- Date d'inscription du vendeur.
- Note moyenne du vendeur basée sur les avis.
- Statut du vendeur (vérifié, en attente, suspendu).

### 3.5 Panier et Commandes

Les clients peuvent ajouter des produits à leur panier avant de passer commande :

- Le panier stocke temporairement les produits sélectionnés.
- Lors du passage de commande, le panier est transformé en commande.
- Chaque commande contient plusieurs lignes de commande (produits + quantités).
- Les commandes ont un statut (En attente, Expédiée, Livrée, Annulée).
- Suivi de la date de commande et de livraison.

### 3.6 Moyens de Paiement

Les utilisateurs peuvent enregistrer plusieurs moyens de paiement :

- Type de paiement (Carte bancaire, PayPal, Virement).
- Pour les cartes : 4 derniers chiffres et date d'expiration.
- Définir un moyen de paiement par défaut.

### 3.7 Avis et Notes

Après réception d'un produit, les clients peuvent laisser un avis :

- Note de 1 à 5 étoiles.
- Commentaire textuel.
- Date de publication de l'avis.
- Lien vers le produit et l'utilisateur.

### 3.8 Promotions

La plateforme propose différents types de promotions :

- Pourcentage de réduction ou montant fixe.
- Code promo à saisir lors de la commande.
- Date de début et de fin de validité.
- Application possible sur des catégories spécifiques ou tous les produits.

### 3.9 Historique et Transactions

Le système doit enregistrer :

- L'historique complet des commandes par utilisateur.
- Les montants totaux des commandes.
- Les dates de paiement et de livraison.
- Les retours et remboursements éventuels.

## 4. Exigences Techniques

Le système doit :

- Offrir une interface utilisateur intuitive pour la navigation dans le catalogue.
- Permettre une recherche rapide et un filtrage des produits (par prix, catégorie, vendeur, note).
- Assurer la gestion en temps réel des stocks.
- Garantir la sécurité des données personnelles et des moyens de paiement.
- Supporter un grand nombre de transactions simultanées.
- Générer des rapports de ventes pour les vendeurs.

## 5. Évolution et Maintenance

La plateforme doit être conçue pour permettre des extensions futures :

- Ajout de nouvelles catégories de produits.
- Intégration de nouveaux moyens de paiement.
- Programme de fidélité pour les clients réguliers.
- Système de recommandations personnalisées.
- Gestion des retours et des remboursements.
- Messagerie entre acheteurs et vendeurs.

## 6. Sécurité et Confidentialité

Le système doit respecter les normes de sécurité en vigueur (RGPD) pour protéger :

- Les données personnelles des utilisateurs.
- Les informations de paiement.
- L'historique d'achat.
- Les mots de passe (hashage obligatoire).

## 7. Performance et Scalabilité

La plateforme doit être capable de :

- Gérer des pics de trafic (soldes, Black Friday).
- Indexer efficacement les produits pour des recherches rapides.
- Optimiser les requêtes pour afficher rapidement les pages produits.
- Mettre en cache les données fréquemment consultées.

