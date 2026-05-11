-- Space Defender
-- Irene Verdejo
CREATE DATABASE IF NOT EXISTS spacedefender;

USE spacedefender;
CREATE TABLE usuaris (
    id_usuari INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE partides (
    id_partida INT PRIMARY KEY AUTO_INCREMENT,
    id_usuari INT NOT NULL,
    data_inici TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fin TIMESTAMP NULL,
    temps_supervivencia INT DEFAULT 0, -- segons
    FOREIGN KEY (id_usuari) REFERENCES usuaris(id_usuari)
);
CREATE TABLE puntuacions (
    id_puntuacio INT PRIMARY KEY AUTO_INCREMENT,
    id_partida INT NOT NULL,
    puntuacio INT NOT NULL DEFAULT 0,
    nivell_max INT DEFAULT 1,
    enemics_derrotats INT DEFAULT 0,
    data_partida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_partida) REFERENCES partides(id_partida)
);
INSERT INTO usuaris (nom, email, password_hash) VALUES 
('Irene', 'iverdejoh2324@politecnics.barcelona', SHA2('051271', 256)),
('JugadorProva', 'ireneverdejohernandez@gmail.com', SHA2('051271', 256));

-- Vista de Prova
CREATE VIEW ranking_global AS
SELECT 
    u.nom,
    p.puntuacio,
    p.nivell_max,
    p.enemics_derrotats,
    pa.temps_supervivencia,
    ROW_NUMBER() OVER (ORDER BY p.puntuacio DESC) as posicio
FROM puntuacions p
JOIN partides pa ON p.id_partida = pa.id_partida
JOIN usuaris u ON pa.id_usuari = u.id_usuari
ORDER BY p.puntuacio DESC;