# Schéma de la Base de Données E-Commerce

## Diagramme des Relations

```
┌─────────────────┐
│   CATEGORIES    │
├─────────────────┤
│ id_categorie PK │◄─────┐
│ nom             │      │
│ description     │      │
│ categorie_      │      │
│   parent_id  FK │──┐   │
└─────────────────┘  │   │
         ▲           │   │
         │           └───┘
         │
         │
┌─────────────────┐       ┌─────────────────┐
│    VENDEURS     │       │  UTILISATEURS   │
├─────────────────┤       ├─────────────────┤
│ id_vendeur   PK │       │ id_utilisateur PK│
│ nom             │       │ email           │
│ email           │       │ mot_de_passe    │
│ telephone       │       │ nom             │
│ date_inscription│       │ prenom          │
│ note_moyenne    │       │ date_naissance  │
│ statut          │       │ date_inscription│
└─────────────────┘       │ derniere_       │
         ▲                │   connexion     │
         │                │ statut          │
         │                └─────────────────┘
         │                         ▲
         │                         │
         │          ┌──────────────┼──────────────┐
         │          │              │              │
         │          │              │              │
┌─────────────────┐│     ┌────────────────┐ ┌───────────────┐
│    PRODUITS     ││     │   ADRESSES_    │ │    MOYENS_    │
├─────────────────┤│     │   LIVRAISON    │ │   PAIEMENT    │
│ id_produit   PK ││     ├────────────────┤ ├───────────────┤
│ nom             ││     │ id_adresse  PK │ │ id_paiement PK│
│ description     ││     │ id_utilisateur │ │ id_utilisateur│
│ prix            ││     │        FK      │ │         FK    │
│ quantite_stock  ││     │ nom_complet    │ │ type_paiement │
│ id_categorie FK │┘     │ adresse        │ │ derniers_     │
│ id_vendeur   FK │──────│ ville          │ │   chiffres    │
│ date_ajout      │      │ code_postal    │ │ date_         │
│ note_moyenne    │      │ pays           │ │   expiration  │
│ poids           │      │ telephone      │ │ par_defaut    │
│ dimensions      │      │ par_defaut     │ └───────────────┘
└─────────────────┘      └────────────────┘          ▲
         ▲                        ▲                  │
         │                        │                  │
         │                        │                  │
    ┌────┼────┬──────────┐        │                  │
    │    │    │          │        │                  │
    │    │    │          │        │                  │
┌───▼────┴───┐│  ┌──-─────▼────┐   │                 │
│   PANIER   ││  │  PROMOTIONS │   │                 │
├────────────┤│  ├───-─────────┤   │                 │
│ id_panier  ││  │ id_promotion│   │                 │
│    PK      ││  │      PK     │   │                 │
│ id_        ││  │  code_promo │   │                 │
│ utilisateur││  │  description│   │                 │
│    FK      ││  │  type_      │   │                 │
│ id_produit ││  │   reduction │   │                 │
│    FK      ││  │  valeur_    │   │                 │
│ quantite   ││  │   reduction │   │                 │
│ date_ajout ││  │  date_debut │   │                 │
└────────────┘│  │  date_fin   │   │                 │
             │   │  id_        │   │                 │
             │   │   categorie │   │                 │
             │   │     FK      │   │                 │
┌────────────▼┐  │  utilisation│   │                 │
│    AVIS     │  │      _max   │   │                 │
├─────────────┤  └──-──────────┘   │                 │
│ id_avis  PK │          ▲         │                 │
│ id_         │          │         │                 │
│ utilisateur │          │         │                 │
│    FK       │          │         │                 │
│ id_produit  │          │         │                 │
│    FK       │          │         │                 │
│ note        │          │         │                 │
│ commentaire │          │         │                 │
│ date_       │          │         │                 │
│ publication │          │         │                 │
└─────────────┘     ┌────┴─────────▼──────────┐      │
                    │      COMMANDES          │      │
                    ├─────────────────────────┤      │
                    │ id_commande         PK  │      │
                    │ id_utilisateur      FK  │      │
                    │ id_adresse_livraison FK │      │
                    │ id_paiement         FK  │──────┘
                    │ date_commande           │
                    │ date_livraison          │
                    │ statut                  │
                    │ montant_total           │
                    │ id_promotion        FK  │
                    │ frais_livraison         │
                    └─────────────────────────┘
                              ▲
                              │
                              │
                    ┌─────────▼──────────┐
                    │ LIGNES_COMMANDE    │
                    ├────────────────────┤
                    │ id_ligne       PK  │
                    │ id_commande    FK  │
                    │ id_produit     FK  │
                    │ quantite           │
                    │ prix_unitaire      │
                    └────────────────────┘
```

## Description des Tables

### UTILISATEURS
**Rôle** : Stocke les informations des clients de la plateforme

**Champs principaux** :
- `id_utilisateur` : Identifiant unique (PK)
- `email` : Email de connexion (UNIQUE)
- `nom`, `prenom` : Identité
- `date_naissance` : Pour calculer l'âge
- `date_inscription` : Date de création du compte
- `statut` : Actif ou Suspendu

**Relations** :
- ➡️ 1-N vers `adresses_livraison`
- ➡️ 1-N vers `moyens_paiement`
- ➡️ 1-N vers `commandes`
- ➡️ 1-N vers `panier`
- ➡️ 1-N vers `avis`

---

### VENDEURS
**Rôle** : Représente les vendeurs sur la marketplace

**Champs principaux** :
- `id_vendeur` : Identifiant unique (PK)
- `nom` : Nom du vendeur/boutique
- `email`, `telephone` : Contact
- `note_moyenne` : Note basée sur les avis
- `statut` : Vérifié, En attente, Suspendu

**Relations** :
- ➡️ 1-N vers `produits`

---

### PRODUITS
**Rôle** : Catalogue des articles en vente

**Champs principaux** :
- `id_produit` : Identifiant unique (PK)
- `nom`, `description` : Informations produit
- `prix` : Prix unitaire
- `quantite_stock` : Stock disponible
- `note_moyenne` : Note moyenne des avis
- `poids`, `dimensions` : Caractéristiques physiques

**Relations** :
- ⬅️ N-1 vers `categories` (FK: id_categorie)
- ⬅️ N-1 vers `vendeurs` (FK: id_vendeur)
- ➡️ 1-N vers `lignes_commande`
- ➡️ 1-N vers `panier`
- ➡️ 1-N vers `avis`

---

### CATEGORIES
**Rôle** : Organisation hiérarchique du catalogue

**Champs principaux** :
- `id_categorie` : Identifiant unique (PK)
- `nom` : Nom de la catégorie
- `description` : Description
- `categorie_parent_id` : Pour créer une hiérarchie (FK récursive)

**Relations** :
- ⬅️ N-1 vers elle-même (sous-catégories)
- ➡️ 1-N vers `produits`
- ➡️ 1-N vers `promotions`

---

### COMMANDES
**Rôle** : Enregistrement des achats

**Champs principaux** :
- `id_commande` : Identifiant unique (PK)
- `date_commande` : Date de la commande
- `date_livraison` : Date de livraison
- `statut` : En attente, Expédiée, Livrée, Annulée
- `montant_total` : Montant TTC
- `frais_livraison` : Coût de livraison

**Relations** :
- ⬅️ N-1 vers `utilisateurs` (FK: id_utilisateur)
- ⬅️ N-1 vers `adresses_livraison` (FK: id_adresse_livraison)
- ⬅️ N-1 vers `moyens_paiement` (FK: id_paiement)
- ⬅️ N-1 vers `promotions` (FK: id_promotion)
- ➡️ 1-N vers `lignes_commande`

---

### LIGNES_COMMANDE
**Rôle** : Détail des produits dans chaque commande

**Champs principaux** :
- `id_ligne` : Identifiant unique (PK)
- `quantite` : Nombre d'articles
- `prix_unitaire` : Prix au moment de la commande

**Relations** :
- ⬅️ N-1 vers `commandes` (FK: id_commande)
- ⬅️ N-1 vers `produits` (FK: id_produit)

---

### ADRESSES_LIVRAISON
**Rôle** : Adresses de livraison des utilisateurs

**Champs principaux** :
- `id_adresse` : Identifiant unique (PK)
- `nom_complet`, `adresse`, `ville`, `code_postal`, `pays`
- `telephone` : Contact pour la livraison
- `par_defaut` : Adresse par défaut

**Relations** :
- ⬅️ N-1 vers `utilisateurs` (FK: id_utilisateur)
- ➡️ 1-N vers `commandes`

---

### MOYENS_PAIEMENT
**Rôle** : Moyens de paiement enregistrés

**Champs principaux** :
- `id_paiement` : Identifiant unique (PK)
- `type_paiement` : Carte bancaire, PayPal, Virement
- `derniers_chiffres` : 4 derniers chiffres de la carte
- `date_expiration` : Date d'expiration
- `par_defaut` : Moyen de paiement par défaut

**Relations** :
- ⬅️ N-1 vers `utilisateurs` (FK: id_utilisateur)
- ➡️ 1-N vers `commandes`

---

### PANIER
**Rôle** : Articles actuellement dans les paniers

**Champs principaux** :
- `id_panier` : Identifiant unique (PK)
- `quantite` : Nombre d'articles
- `date_ajout` : Date d'ajout au panier

**Relations** :
- ⬅️ N-1 vers `utilisateurs` (FK: id_utilisateur)
- ⬅️ N-1 vers `produits` (FK: id_produit)

---

### AVIS
**Rôle** : Commentaires et notes sur les produits

**Champs principaux** :
- `id_avis` : Identifiant unique (PK)
- `note` : Note de 1 à 5 étoiles
- `commentaire` : Texte de l'avis
- `date_publication` : Date de publication

**Relations** :
- ⬅️ N-1 vers `utilisateurs` (FK: id_utilisateur)
- ⬅️ N-1 vers `produits` (FK: id_produit)

---

### PROMOTIONS
**Rôle** : Codes promo et réductions

**Champs principaux** :
- `id_promotion` : Identifiant unique (PK)
- `code_promo` : Code à saisir (UNIQUE)
- `type_reduction` : Pourcentage ou Montant fixe
- `valeur_reduction` : Valeur de la réduction
- `date_debut`, `date_fin` : Période de validité
- `utilisation_max` : Nombre max d'utilisations

**Relations** :
- ⬅️ N-1 vers `categories` (FK: id_categorie) - optionnel
- ➡️ 1-N vers `commandes`

---

## Cardinalités

| Relation | Type | Description |
|----------|------|-------------|
| UTILISATEURS → ADRESSES_LIVRAISON | 1-N | Un utilisateur peut avoir plusieurs adresses |
| UTILISATEURS → MOYENS_PAIEMENT | 1-N | Un utilisateur peut avoir plusieurs moyens de paiement |
| UTILISATEURS → COMMANDES | 1-N | Un utilisateur peut passer plusieurs commandes |
| UTILISATEURS → PANIER | 1-N | Un utilisateur a un panier avec plusieurs articles |
| UTILISATEURS → AVIS | 1-N | Un utilisateur peut laisser plusieurs avis |
| VENDEURS → PRODUITS | 1-N | Un vendeur propose plusieurs produits |
| CATEGORIES → PRODUITS | 1-N | Une catégorie contient plusieurs produits |
| CATEGORIES → CATEGORIES | 1-N | Hiérarchie de catégories |
| PRODUITS → LIGNES_COMMANDE | 1-N | Un produit peut être dans plusieurs commandes |
| PRODUITS → PANIER | 1-N | Un produit peut être dans plusieurs paniers |
| PRODUITS → AVIS | 1-N | Un produit peut avoir plusieurs avis |
| COMMANDES → LIGNES_COMMANDE | 1-N | Une commande contient plusieurs lignes |
| PROMOTIONS → COMMANDES | 1-N | Une promotion peut être utilisée plusieurs fois |

---

## Points d'attention

1. **Dénormalisation** : `note_moyenne` est stockée dans `produits` et `vendeurs` pour optimiser les performances (plutôt que de recalculer à chaque fois)
2. **Soft delete** : Le statut permet de désactiver des comptes sans supprimer les données
3. **Historique** : Les prix sont copiés dans `lignes_commande` pour garder un historique fidèle
4. **Flexibilité** : `categorie_parent_id` permet une hiérarchie illimitée de catégories
5. **Sécurité** : Les `derniers_chiffres` plutôt que le numéro complet pour les cartes bancaires

