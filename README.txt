TP Cassandra — RSI3 — Windows 11
Prérequis : Docker Desktop avec moteur Linux/WSL2, PowerShell, 8 Go RAM recommandés.
Démarrage dans ce dossier :
  docker compose up -d
  docker compose ps
  docker exec -it cassandra1 nodetool status
Attendre que les trois nœuds apparaissent UN (Up/Normal). Premier démarrage : plusieurs minutes.
Ouvrir CQL :
  docker exec -it cassandra1 cqlsh
Le port CQL du nœud 1 est exposé sur localhost:9042.
Arrêt sans effacer les données : docker compose stop
Reprise : docker compose start
Suppression des conteneurs/réseau en conservant les volumes : docker compose down
Réinitialisation complète, efface les données : docker compose down -v
Note : les 3 nœuds sont des conteneurs sur un seul PC ; ce TP simule le cluster mais pas la tolérance à la panne de l'hôte.
