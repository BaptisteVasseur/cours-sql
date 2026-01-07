-- Base de données E-Commerce PostgreSQL
-- Création des tables et insertion de données

-- Table des catégories
CREATE TABLE categories (
    id_categorie SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    categorie_parent_id INTEGER REFERENCES categories(id_categorie)
);

-- Table des vendeurs
CREATE TABLE vendeurs (
    id_vendeur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    date_inscription DATE NOT NULL DEFAULT CURRENT_DATE,
    note_moyenne DECIMAL(3,2),
    statut VARCHAR(20) DEFAULT 'En attente' CHECK (statut IN ('Vérifié', 'En attente', 'Suspendu'))
);

-- Table des utilisateurs
CREATE TABLE utilisateurs (
    id_utilisateur SERIAL PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    derniere_connexion TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'Actif' CHECK (statut IN ('Actif', 'Suspendu'))
);

-- Table des adresses de livraison
CREATE TABLE adresses_livraison (
    id_adresse SERIAL PRIMARY KEY,
    id_utilisateur INTEGER REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE,
    nom_complet VARCHAR(200) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    code_postal VARCHAR(10) NOT NULL,
    pays VARCHAR(100) DEFAULT 'France',
    telephone VARCHAR(20),
    par_defaut BOOLEAN DEFAULT FALSE
);

-- Table des moyens de paiement
CREATE TABLE moyens_paiement (
    id_paiement SERIAL PRIMARY KEY,
    id_utilisateur INTEGER REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE,
    type_paiement VARCHAR(50) NOT NULL CHECK (type_paiement IN ('Carte bancaire', 'PayPal', 'Virement')),
    derniers_chiffres VARCHAR(4),
    date_expiration DATE,
    par_defaut BOOLEAN DEFAULT FALSE
);

-- Table des produits
CREATE TABLE produits (
    id_produit SERIAL PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    description TEXT,
    prix DECIMAL(10,2) NOT NULL,
    quantite_stock INTEGER NOT NULL DEFAULT 0,
    id_categorie INTEGER REFERENCES categories(id_categorie),
    id_vendeur INTEGER REFERENCES vendeurs(id_vendeur),
    date_ajout DATE DEFAULT CURRENT_DATE,
    note_moyenne DECIMAL(3,2),
    poids DECIMAL(8,2),
    dimensions VARCHAR(50)
);

-- Table des promotions
CREATE TABLE promotions (
    id_promotion SERIAL PRIMARY KEY,
    code_promo VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    type_reduction VARCHAR(20) CHECK (type_reduction IN ('Pourcentage', 'Montant fixe')),
    valeur_reduction DECIMAL(10,2) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    id_categorie INTEGER REFERENCES categories(id_categorie),
    utilisation_max INTEGER
);

-- Table des commandes
CREATE TABLE commandes (
    id_commande SERIAL PRIMARY KEY,
    id_utilisateur INTEGER REFERENCES utilisateurs(id_utilisateur),
    id_adresse_livraison INTEGER REFERENCES adresses_livraison(id_adresse),
    id_paiement INTEGER REFERENCES moyens_paiement(id_paiement),
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_livraison DATE,
    statut VARCHAR(20) DEFAULT 'En attente' CHECK (statut IN ('En attente', 'Expédiée', 'Livrée', 'Annulée')),
    montant_total DECIMAL(10,2) NOT NULL,
    id_promotion INTEGER REFERENCES promotions(id_promotion),
    frais_livraison DECIMAL(10,2) DEFAULT 0
);

-- Table des lignes de commande
CREATE TABLE lignes_commande (
    id_ligne SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commandes(id_commande) ON DELETE CASCADE,
    id_produit INTEGER REFERENCES produits(id_produit),
    quantite INTEGER NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL
);

-- Table du panier
CREATE TABLE panier (
    id_panier SERIAL PRIMARY KEY,
    id_utilisateur INTEGER REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE,
    id_produit INTEGER REFERENCES produits(id_produit) ON DELETE CASCADE,
    quantite INTEGER NOT NULL DEFAULT 1,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des avis
CREATE TABLE avis (
    id_avis SERIAL PRIMARY KEY,
    id_utilisateur INTEGER REFERENCES utilisateurs(id_utilisateur),
    id_produit INTEGER REFERENCES produits(id_produit),
    note INTEGER NOT NULL CHECK (note >= 1 AND note <= 5),
    commentaire TEXT,
    date_publication TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des données

-- Catégories
INSERT INTO categories (nom, description, categorie_parent_id) VALUES
('Électronique', 'Tous les produits électroniques', NULL),
('Smartphones', 'Téléphones mobiles et accessoires', 1),
('Ordinateurs', 'PC portables et fixes', 1),
('Mode', 'Vêtements et accessoires', NULL),
('Vêtements Homme', 'Mode masculine', 4),
('Vêtements Femme', 'Mode féminine', 4),
('Maison', 'Articles pour la maison', NULL),
('Cuisine', 'Ustensiles et électroménager', 7),
('Décoration', 'Objets décoratifs', 7),
('Sport', 'Équipements sportifs', NULL),
('Fitness', 'Matériel de musculation', 10),
('Outdoor', 'Équipement extérieur', 10),
('Livres', 'Livres et magazines', NULL),
('Jouets', 'Jeux et jouets', NULL),
('Beauté', 'Produits de beauté et cosmétiques', NULL);

-- Vendeurs
INSERT INTO vendeurs (nom, email, telephone, date_inscription, note_moyenne, statut) VALUES
('TechStore', 'contact@techstore.fr', '0102030405', '2020-01-15', 4.5, 'Vérifié'),
('ModeFashion', 'info@modefashion.fr', '0203040506', '2020-03-20', 4.2, 'Vérifié'),
('HomeDecor', 'contact@homedecor.fr', '0304050607', '2021-06-10', 4.7, 'Vérifié'),
('SportPro', 'contact@sportpro.fr', '0405060708', '2021-09-01', 4.3, 'Vérifié'),
('BeautyWorld', 'info@beautyworld.fr', '0506070809', '2022-02-14', 4.1, 'Vérifié'),
('BookLovers', 'contact@booklovers.fr', '0607080910', '2022-05-20', 4.6, 'Vérifié'),
('ToysRus', 'info@toysrus.fr', '0708091011', '2022-08-30', 4.4, 'Vérifié'),
('GreenMarket', 'contact@greenmarket.fr', '0809101112', '2023-01-10', 4.0, 'En attente'),
('LuxuryBrand', 'info@luxurybrand.fr', '0910111213', '2023-04-15', 4.8, 'Vérifié'),
('BudgetStore', 'contact@budgetstore.fr', '1011121314', '2023-07-01', 3.9, 'Vérifié');

-- Utilisateurs
INSERT INTO utilisateurs (email, mot_de_passe, nom, prenom, date_naissance, date_inscription, derniere_connexion, statut) VALUES
('jean.dupont@email.fr', 'hash123', 'Dupont', 'Jean', '1985-05-15', '2022-01-10 10:00:00', '2025-01-05 14:30:00', 'Actif'),
('marie.martin@email.fr', 'hash456', 'Martin', 'Marie', '1990-08-22', '2022-03-15 11:00:00', '2025-01-06 09:15:00', 'Actif'),
('pierre.bernard@email.fr', 'hash789', 'Bernard', 'Pierre', '1978-12-03', '2022-06-20 14:00:00', '2025-01-04 16:45:00', 'Actif'),
('sophie.dubois@email.fr', 'hash321', 'Dubois', 'Sophie', '1995-03-18', '2022-09-05 09:30:00', '2025-01-06 11:00:00', 'Actif'),
('thomas.laurent@email.fr', 'hash654', 'Laurent', 'Thomas', '1988-07-30', '2023-01-12 15:00:00', '2025-01-03 20:30:00', 'Actif'),
('julie.simon@email.fr', 'hash987', 'Simon', 'Julie', '1992-11-25', '2023-04-08 10:30:00', '2025-01-06 08:00:00', 'Actif'),
('lucas.leroy@email.fr', 'hash147', 'Leroy', 'Lucas', '1987-02-14', '2023-07-22 16:00:00', '2025-01-05 19:15:00', 'Actif'),
('emma.moreau@email.fr', 'hash258', 'Moreau', 'Emma', '1993-09-07', '2023-10-30 12:00:00', '2025-01-06 07:30:00', 'Actif'),
('antoine.garcia@email.fr', 'hash369', 'Garcia', 'Antoine', '1980-06-12', '2024-02-14 11:00:00', '2025-01-02 13:00:00', 'Actif'),
('lea.martinez@email.fr', 'hash741', 'Martinez', 'Lea', '1996-01-28', '2024-05-19 13:30:00', '2025-01-06 10:00:00', 'Actif');

-- Adresses de livraison
INSERT INTO adresses_livraison (id_utilisateur, nom_complet, adresse, ville, code_postal, pays, telephone, par_defaut) VALUES
(1, 'Jean Dupont', '15 Rue de la République', 'Paris', '75001', 'France', '0601020304', TRUE),
(1, 'Jean Dupont', '42 Avenue des Champs', 'Lyon', '69001', 'France', '0601020304', FALSE),
(2, 'Marie Martin', '8 Boulevard Voltaire', 'Marseille', '13001', 'France', '0602030405', TRUE),
(3, 'Pierre Bernard', '23 Rue du Commerce', 'Toulouse', '31000', 'France', '0603040506', TRUE),
(4, 'Sophie Dubois', '56 Avenue Jean Jaurès', 'Nice', '06000', 'France', '0604050607', TRUE),
(5, 'Thomas Laurent', '12 Rue Nationale', 'Lille', '59000', 'France', '0605060708', TRUE),
(6, 'Julie Simon', '78 Boulevard de la Liberté', 'Bordeaux', '33000', 'France', '0606070809', TRUE),
(7, 'Lucas Leroy', '34 Rue Victor Hugo', 'Nantes', '44000', 'France', '0607080910', TRUE),
(8, 'Emma Moreau', '91 Avenue de la Gare', 'Strasbourg', '67000', 'France', '0608091011', TRUE),
(9, 'Antoine Garcia', '5 Place de la Mairie', 'Montpellier', '34000', 'France', '0609101112', TRUE),
(10, 'Lea Martinez', '67 Rue du Port', 'Rennes', '35000', 'France', '0610111213', TRUE);

-- Moyens de paiement
INSERT INTO moyens_paiement (id_utilisateur, type_paiement, derniers_chiffres, date_expiration, par_defaut) VALUES
(1, 'Carte bancaire', '1234', '2026-12-31', TRUE),
(2, 'PayPal', NULL, NULL, TRUE),
(3, 'Carte bancaire', '5678', '2027-06-30', TRUE),
(4, 'Carte bancaire', '9012', '2026-03-31', TRUE),
(5, 'PayPal', NULL, NULL, TRUE),
(6, 'Carte bancaire', '3456', '2027-09-30', TRUE),
(7, 'Carte bancaire', '7890', '2026-11-30', TRUE),
(8, 'PayPal', NULL, NULL, TRUE),
(9, 'Carte bancaire', '2345', '2027-01-31', TRUE),
(10, 'Carte bancaire', '6789', '2026-08-31', TRUE);

-- Produits
INSERT INTO produits (nom, description, prix, quantite_stock, id_categorie, id_vendeur, date_ajout, note_moyenne, poids, dimensions) VALUES
('iPhone 15 Pro', 'Smartphone Apple dernière génération', 1199.00, 50, 2, 1, '2023-09-15', 4.8, 0.187, '146.6x70.6x8.25mm'),
('Samsung Galaxy S24', 'Smartphone Samsung haut de gamme', 999.00, 75, 2, 1, '2024-01-20', 4.6, 0.195, '147x70.6x7.6mm'),
('MacBook Air M2', 'Ordinateur portable Apple', 1499.00, 30, 3, 1, '2023-06-10', 4.9, 1.24, '304x212x16mm'),
('Dell XPS 15', 'PC portable haute performance', 1799.00, 20, 3, 1, '2023-08-15', 4.7, 1.86, '344x230x18mm'),
('Jean Levi''s 501', 'Jean classique homme', 89.90, 200, 5, 2, '2023-01-05', 4.5, 0.5, 'Taille 32-42'),
('Robe d''été Zara', 'Robe légère pour femme', 49.90, 150, 6, 2, '2024-03-20', 4.3, 0.3, 'Taille S-XL'),
('Canapé 3 places', 'Canapé confortable en tissu', 599.00, 15, 7, 3, '2023-05-12', 4.4, 85, '210x90x80cm'),
('Table de cuisine', 'Table en bois massif 6 personnes', 349.00, 25, 8, 3, '2023-07-18', 4.6, 42, '160x90x75cm'),
('Tapis persan', 'Tapis décoratif 200x300cm', 299.00, 40, 9, 3, '2023-09-22', 4.2, 15, '200x300cm'),
('Tapis de yoga', 'Tapis antidérapant 180x60cm', 29.90, 300, 11, 4, '2023-02-14', 4.7, 1.2, '180x60x0.6cm'),
('Haltères 10kg', 'Paire d''haltères ajustables', 89.00, 100, 11, 4, '2023-04-10', 4.5, 20, '40x20x20cm'),
('Vélo de route', 'Vélo de course professionnel', 1299.00, 12, 12, 4, '2023-06-05', 4.8, 9.5, '170x100x50cm'),
('Crème hydratante', 'Crème visage 50ml', 24.90, 500, 15, 5, '2023-03-08', 4.4, 0.05, '5x5x10cm'),
('Parfum Chanel N°5', 'Parfum femme 100ml', 139.00, 80, 15, 9, '2023-11-20', 4.9, 0.1, '8x8x15cm'),
('Harry Potter - Coffret', 'Coffret complet 7 livres', 79.90, 60, 13, 6, '2023-01-15', 4.9, 3.5, '25x20x15cm'),
('Le Seigneur des Anneaux', 'Trilogie complète', 59.90, 45, 13, 6, '2023-02-20', 4.8, 2.8, '23x18x12cm'),
('LEGO Star Wars', 'Set Millennium Falcon', 159.90, 35, 14, 7, '2023-12-01', 4.7, 2.5, '48x38x9cm'),
('Poupée Barbie', 'Barbie fashionista', 29.90, 200, 14, 7, '2023-10-10', 4.3, 0.3, '30x10x6cm'),
('Montre connectée', 'Smartwatch sport GPS', 249.00, 90, 1, 1, '2024-01-10', 4.5, 0.05, '44x38x11mm'),
('Casque Bluetooth', 'Casque audio sans fil', 79.90, 150, 1, 1, '2023-08-25', 4.6, 0.25, '18x16x8cm'),
('Chaussures de running', 'Baskets Nike Air Zoom', 129.00, 120, 10, 4, '2023-07-15', 4.7, 0.6, 'Pointure 38-46'),
('Sac à dos randonnée', 'Sac 40L imperméable', 89.00, 65, 12, 4, '2023-09-05', 4.4, 1.8, '55x30x25cm'),
('Machine à café', 'Cafetière expresso automatique', 399.00, 40, 8, 3, '2023-04-22', 4.5, 7.5, '35x25x30cm'),
('Aspirateur robot', 'Robot aspirateur connecté', 299.00, 55, 7, 3, '2023-10-18', 4.3, 3.5, '35x35x10cm'),
('Lampe de bureau LED', 'Lampe tactile rechargeable', 39.90, 180, 9, 3, '2023-06-30', 4.6, 0.8, '40x15x15cm');

-- Promotions
INSERT INTO promotions (code_promo, description, type_reduction, valeur_reduction, date_debut, date_fin, id_categorie, utilisation_max) VALUES
('WINTER2025', 'Soldes d''hiver 2025', 'Pourcentage', 20, '2025-01-07', '2025-02-07', NULL, 1000),
('TECH50', 'Réduction sur électronique', 'Montant fixe', 50, '2024-12-01', '2025-01-31', 1, 500),
('FASHION15', 'Promo mode', 'Pourcentage', 15, '2025-01-01', '2025-01-31', 4, 300),
('SPORT20', 'Promotion sport', 'Pourcentage', 20, '2025-01-05', '2025-02-05', 10, 200),
('WELCOME10', 'Bienvenue nouveau client', 'Pourcentage', 10, '2024-01-01', '2025-12-31', NULL, NULL),
('BLACKFRIDAY', 'Black Friday', 'Pourcentage', 30, '2024-11-29', '2024-11-29', NULL, 2000),
('NOEL25', 'Promotion Noël', 'Pourcentage', 25, '2024-12-20', '2024-12-31', NULL, 1500),
('LIVRE5', 'Réduction livres', 'Montant fixe', 5, '2025-01-01', '2025-03-31', 13, 400);

-- Commandes
INSERT INTO commandes (id_utilisateur, id_adresse_livraison, id_paiement, date_commande, date_livraison, statut, montant_total, id_promotion, frais_livraison) VALUES
(1, 1, 1, '2024-12-15 10:30:00', '2024-12-18', 'Livrée', 1249.00, 2, 4.90),
(1, 1, 1, '2025-01-03 14:20:00', NULL, 'En attente', 349.00, 1, 9.90),
(2, 3, 2, '2024-12-20 16:45:00', '2024-12-23', 'Livrée', 89.90, NULL, 4.90),
(3, 4, 3, '2024-12-22 09:15:00', '2024-12-27', 'Livrée', 1799.00, NULL, 0.00),
(4, 5, 4, '2024-12-28 11:30:00', '2025-01-02', 'Livrée', 199.80, 3, 4.90),
(5, 6, 5, '2025-01-02 15:00:00', NULL, 'Expédiée', 1299.00, 4, 0.00),
(6, 7, 6, '2025-01-04 10:10:00', NULL, 'En attente', 139.90, NULL, 4.90),
(7, 8, 7, '2024-12-18 13:25:00', '2024-12-21', 'Livrée', 159.90, NULL, 4.90),
(8, 9, 8, '2024-12-30 17:40:00', '2025-01-04', 'Livrée', 399.00, 1, 0.00),
(9, 10, 9, '2025-01-01 12:00:00', NULL, 'Expédiée', 249.00, 5, 4.90),
(10, 11, 10, '2025-01-05 09:30:00', NULL, 'En attente', 129.00, 4, 4.90),
(1, 2, 1, '2024-11-29 08:00:00', '2024-12-03', 'Livrée', 1049.30, 6, 4.90),
(2, 3, 2, '2024-12-25 14:30:00', '2024-12-29', 'Livrée', 74.90, 7, 4.90),
(3, 4, 3, '2025-01-02 16:20:00', NULL, 'Expédiée', 698.00, 1, 9.90),
(5, 6, 5, '2024-12-10 11:45:00', '2024-12-14', 'Livrée', 89.00, NULL, 4.90);

-- Lignes de commande
INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire) VALUES
(1, 1, 1, 1199.00),
(1, 20, 1, 79.90),
(2, 8, 1, 349.00),
(3, 5, 1, 89.90),
(4, 4, 1, 1799.00),
(5, 6, 2, 49.90),
(5, 13, 4, 24.90),
(6, 12, 1, 1299.00),
(7, 14, 1, 139.00),
(8, 17, 1, 159.90),
(9, 23, 1, 399.00),
(10, 19, 1, 249.00),
(11, 21, 1, 129.00),
(12, 3, 1, 1499.00),
(13, 18, 1, 29.90),
(13, 10, 1, 29.90),
(14, 7, 1, 599.00),
(14, 13, 4, 24.90),
(15, 11, 1, 89.00);

-- Panier (articles actuellement dans le panier)
INSERT INTO panier (id_utilisateur, id_produit, quantite, date_ajout) VALUES
(1, 15, 1, '2025-01-06 10:00:00'),
(2, 22, 1, '2025-01-06 11:30:00'),
(3, 24, 1, '2025-01-05 14:20:00'),
(4, 9, 1, '2025-01-06 09:15:00'),
(5, 16, 1, '2025-01-04 16:45:00'),
(6, 25, 2, '2025-01-06 08:30:00');

-- Avis
INSERT INTO avis (id_utilisateur, id_produit, note, commentaire, date_publication) VALUES
(1, 1, 5, 'Excellent smartphone, très rapide et bel écran !', '2024-12-20 15:00:00'),
(1, 20, 4, 'Bon casque pour le prix, son correct', '2024-12-21 10:30:00'),
(2, 5, 5, 'Jean de très bonne qualité, taille parfaitement', '2024-12-25 14:00:00'),
(3, 4, 5, 'PC portable exceptionnel, parfait pour le travail', '2024-12-28 11:00:00'),
(4, 6, 4, 'Jolie robe, tissu agréable', '2025-01-04 16:30:00'),
(4, 13, 5, 'Crème très efficace, peau douce', '2025-01-05 09:00:00'),
(5, 12, 5, 'Vélo parfait, très léger et performant', '2025-01-04 18:00:00'),
(6, 14, 5, 'Le parfum est magnifique, tient toute la journée', '2025-01-05 12:00:00'),
(7, 17, 5, 'LEGO de qualité, construction passionnante', '2024-12-22 15:30:00'),
(8, 23, 4, 'Bonne machine à café, café délicieux', '2025-01-05 10:00:00'),
(9, 19, 4, 'Montre pratique avec de nombreuses fonctionnalités', '2025-01-03 14:00:00'),
(1, 3, 5, 'MacBook exceptionnel, silence et performance', '2024-12-05 16:00:00'),
(2, 18, 3, 'Poupée correcte mais cher pour la qualité', '2024-12-30 11:00:00'),
(3, 7, 5, 'Canapé très confortable, excellent rapport qualité-prix', '2025-01-04 13:00:00'),
(5, 11, 4, 'Haltères solides, pratiques pour s''entraîner', '2024-12-15 17:00:00'),
(1, 1, 4, 'Très bon produit mais un peu cher', '2024-12-22 12:00:00'),
(2, 5, 5, 'Parfait, je recommande', '2024-12-26 10:00:00'),
(6, 14, 5, 'Mon parfum préféré', '2025-01-06 08:00:00');

-- Création d'index pour optimiser les performances
CREATE INDEX idx_produits_categorie ON produits(id_categorie);
CREATE INDEX idx_produits_vendeur ON produits(id_vendeur);
CREATE INDEX idx_commandes_utilisateur ON commandes(id_utilisateur);
CREATE INDEX idx_commandes_date ON commandes(date_commande);
CREATE INDEX idx_lignes_commande_produit ON lignes_commande(id_produit);
CREATE INDEX idx_avis_produit ON avis(id_produit);
CREATE INDEX idx_avis_utilisateur ON avis(id_utilisateur);


