setwd("/Users/parakawa/Documents/Sorbonne/RESYS/Projet")

# Instalar le package minet s'il n'est pas déjà installé
if (!requireNamespace("minet", quietly = TRUE)) {
  install.packages("minet")
}

library(minet)
library(igraph)

# Identificar les packages chargés
loaded_packages <- .packages()

# Supprimer tous les objets sauf les packages
rm(list = setdiff(ls(), loaded_packages))  # Supprime tous les objets sauf les packages
gc()  # Réalise un nettoyage de la mémoire

# Lire la matrice de cohérence
coherence <- read.csv("covariance_matrix_alc_after_beta.csv", header = TRUE)
coherence_matrix <- as.matrix(coherence)

# Nombres des électrodes
electrode_names <- c('FP1', 'FP2', 'F7', 'F8', 'AF1', 'AF2', 'FZ', 'F4', 'F3', 'FC6', 
                     'FC5', 'FC2', 'FC1', 'T8', 'T7', 'CZ', 'C3', 'C4', 'CP5', 
                     'CP6', 'CP1', 'CP2', 'P3', 'P4', 'PZ', 'P8', 'P7', 'PO2', 
                     'PO1', 'O2', 'O1', 'AF7', 'AF8', 'F5', 'F6', 'FT7', 'FT8', 
                     'FPZ', 'FC4', 'FC3', 'C6', 'C5', 'F2', 'F1', 'TP8', 'TP7', 
                     'AFZ', 'CP3', 'CP4', 'P5', 'P6', 'C1', 'C2', 'PO7', 'PO8', 
                     'FCZ', 'POZ', 'OZ', 'P2', 'P1', 'CPZ')

# Créer le réseau avec ARACNE
aracne_network <- aracne(coherence_matrix)

# Convertir le réseau en objet igraph
igraph_network <- graph_from_adjacency_matrix(aracne_network, mode = "undirected", weighted = TRUE, diag = FALSE)

# Renommer les sommets avec les noms d'électrodes
V(igraph_network)$name <- electrode_names

# Visualiser le réseau
plot(igraph_network, 
     main = "covariance_matrix_alc_after_beta", 
     vertex.size = 12, 
     vertex.label.cex = 0.7, 
     edge.width = E(igraph_network)$weight, 
     layout = layout_with_fr)


# Sauvegarder l'image du réseau en format PNG
png("covariance_matrix_alc_after_beta.png", width = 800, height = 800)
plot(igraph_network, 
     main = "covariance_matrix_alc_after_beta", 
     vertex.size = 5, 
     vertex.label.cex = 0.7, 
     edge.width = E(igraph_network)$weight, 
     layout = layout_with_fr)
dev.off()  # Fermer le périphérique graphique


