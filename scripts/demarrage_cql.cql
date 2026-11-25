CREATE KEYSPACE IF NOT EXISTS rsi3_bibliotheque
WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': 3}
AND durable_writes = true;

USE rsi3_bibliotheque;

CREATE TABLE IF NOT EXISTS livres_par_auteur (
  id_auteur int,
  isbn text,
  nom_auteur text,
  prenom_auteur text,
  titre text,
  PRIMARY KEY ((id_auteur), isbn)
) WITH CLUSTERING ORDER BY (isbn ASC);

INSERT INTO livres_par_auteur (id_auteur, isbn, nom_auteur, prenom_auteur, titre)
VALUES (154, '2154889522', 'Goscinny', 'Rene', 'Asterix et Cleopatre');
INSERT INTO livres_par_auteur (id_auteur, isbn, nom_auteur, prenom_auteur, titre)
VALUES (987, '2154889589', 'Bruchez', 'Rudi', 'NoSQL');
INSERT INTO livres_par_auteur (id_auteur, isbn, nom_auteur, prenom_auteur, titre)
VALUES (987, '2154889597', 'Bruchez', 'Rudi', 'Bases de donnees distribuees');

SELECT * FROM livres_par_auteur WHERE id_auteur = 987;

CREATE TABLE IF NOT EXISTS ventes_par_livre (
  isbn text,
  date_vente date,
  id_vente int,
  quantite int,
  montant decimal,
  PRIMARY KEY ((isbn), date_vente, id_vente)
) WITH CLUSTERING ORDER BY (date_vente DESC, id_vente ASC);

INSERT INTO ventes_par_livre (isbn, date_vente, id_vente, quantite, montant)
VALUES ('2154889589', '2017-06-02', 12, 1, 35.00);
INSERT INTO ventes_par_livre (isbn, date_vente, id_vente, quantite, montant)
VALUES ('2154889589', '2017-09-12', 20, 2, 70.00);

SELECT * FROM ventes_par_livre WHERE isbn = '2154889589';
