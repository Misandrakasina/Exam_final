-- ===============================================
-- INSERTION DES DONNÉES DE TEST - BNGRC
-- ===============================================

-- 1. Insertion des sinistres
INSERT INTO `BNGRC_sinistre` (`id_sinistre`, `nom`, `description`) VALUES
(1, 'Tremblement de terre', 'Séisme de magnitude 6.5 affectant la région Nord'),
(2, 'Inondations', 'Crues exceptionnelles du fleuve principal'),
(3, 'Sécheresse', 'Période prolongée sans précipitations');

-- 2. Insertion des villes
INSERT INTO `BNGRC_ville` (`id_ville`, `nom`, `id_sinistre`) VALUES
(1, 'Port-au-Prince', 1),
(2, 'Cap-Haïtien', 1),
(3, 'Gonaïves', 2),
(4, 'Les Cayes', 3),
(5, 'Jérémie', 3);

-- 3. Insertion des régions
INSERT INTO `BNGRC_region` (`id_region`, `nom`, `id_ville`) VALUES
(1, 'Ouest', 1),
(2, 'Nord', 2),
(3, 'Artibonite', 3),
(4, 'Sud', 4),
(5, 'Tana', 5);

-- 4. Insertion des catégories
INSERT INTO `BNGRC_categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Nature'),
(2, 'Matériel'),
(3, 'Argent');

-- 5. Insertion des types de besoins avec prix unitaires
INSERT INTO `BNGRC_type_besoin` (`id_type_besoin`, `libelle`, `id_categorie`, `prix_unitaire`) VALUES
-- Catégorie Nature
(1, 'Riz', 1, 2.50),
(2, 'Huile de cuisine', 1, 8.00),
(3, 'Sucre', 1, 1.80),
(4, 'Farine', 1, 3.20),
(5, 'Lait en poudre', 1, 5.50),

-- Catégorie Matériel
(6, 'Tentes', 2, 45.00),
(7, 'Couvertures', 2, 12.00),
(8, 'Seaux', 2, 5.00),
(9, 'Lampes torches', 2, 8.50),
(10, 'Cordes', 2, 6.00),
(11, 'Clous', 2, 0.10),
(12, 'Téléphones', 2, 150.00),

-- 6. Insertion des besoins par ville
INSERT INTO `BNGRC_besoin` (`id_besoin`, `id_ville`, `id_type_besoin`) VALUES
(1, 1, 1),   -- Port-au-Prince: Riz
(2, 1, 6),   -- Port-au-Prince: Tentes
(3, 1, 13),  -- Port-au-Prince: Argent général
(4, 2, 2),   -- Cap-Haïtien: Huile
(5, 2, 7),   -- Cap-Haïtien: Couvertures
(6, 3, 3),   -- Gonaïves: Sucre
(7, 3, 8),   -- Gonaïves: Seaux
(8, 4, 4),   -- Les Cayes: Farine
(9, 4, 14),  -- Les Cayes: Argent pour médicaments
(10, 5, 5),  -- Jérémie: Lait en poudre
(11, 5, 15); -- Jérémie: Argent pour reconstruction

-- 7. Insertion des dons
INSERT INTO `BNGRC_dons` (`id_dons`, `date_dons`, `id_type_besoin`) VALUES
(1, '2025-01-10', 1),   -- Don de riz
(2, '2025-01-12', 2),   -- Don d'huile
(3, '2025-01-15', 6),   -- Don de tentes
(4, '2025-01-16', 13),  -- Don d'argent général
(5, '2025-01-18', 7),   -- Don de couvertures
(6, '2025-01-20', 3),   -- Don de sucre
(7, '2025-01-22', 8),   -- Don de seaux
(8, '2025-01-25', 14),  -- Don d'argent pour médicaments
(9, '2025-01-28', 4),   -- Don de farine
(10, '2025-02-01', 15); -- Don d'argent pour reconstruction

-- 8. Insertion des attributions (liaison entre besoins et dons)
INSERT INTO `BNGRC_attribution` (`id_attribution`, `id_besoin`, `id_dons`) VALUES
(1, 1, 1),    -- Besoin Riz (Port-au-Prince) <- Don Riz
(2, 2, 3),    -- Besoin Tentes (Port-au-Prince) <- Don Tentes
(3, 3, 4),    -- Besoin Argent général (Port-au-Prince) <- Don Argent général
(4, 4, 2),    -- Besoin Huile (Cap-Haïtien) <- Don Huile
(5, 5, 5),    -- Besoin Couvertures (Cap-Haïtien) <- Don Couvertures
(6, 6, 6),    -- Besoin Sucre (Gonaïves) <- Don Sucre
(7, 7, 7),    -- Besoin Seaux (Gonaïves) <- Don Seaux
(8, 8, 9),    -- Besoin Farine (Les Cayes) <- Don Farine
(9, 9, 8),    -- Besoin Argent médicaments (Les Cayes) <- Don Argent médicaments
(10, 10, 1),  -- Besoin Lait (Jérémie) <- Don Riz (réattribution)
(11, 11, 10); -- Besoin Argent reconstruction (Jérémie) <- Don Argent reconstruction
