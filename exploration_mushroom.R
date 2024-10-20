setwd("/Users/parakawa/Documents/Sorbonne/RESYS/Projet/")

mushroom <- read.csv("MushroomDataset/secondary_data.csv", header = TRUE, sep = ";")

# Vérifier les dimensions après la suppression pour s'assurer que le nombre de lignes et de colonnes est correct
dim(mushroom)

# Afficher les premières lignes pour vérifier les modifications
head(mushroom)

# Afficher les dernières lignes du DataFrame pour voir la fin des données
tail(mushroom)

# Voir la structure du dataset (type des variables)
str(mushroom)

# Obtenir un résumé statistique des variables
summary(mushroom)

# Afficher les noms des colonnes
colnames(mushroom)
library(dplyr)

# Échantillonnage stratifié de 2000 champignons en respectant la proportion de chaque classe (poisonous ou edible)
set.seed(123)  # Fixer la graine pour garantir la reproductibilité
mushroom_sample <- mushroom %>%
  group_by(class) %>%
  sample_n(2000 * (n() / nrow(mushroom)))

# Sauvegarder l'échantillon dans un nouveau fichier CSV
write.csv(mushroom_sample, "MushroomDataset/mushroom_sample_2000.csv", row.names = FALSE)

# Afficher les premières lignes pour vérifier
head(mushroom_sample)

# Distribution des variables nominales
library(ggplot2)
ggplot(mushroom_sample, aes(x = cap.shape)) + geom_bar() + ggtitle("Distribution des formes de chapeau")

# Histogramme pour les variables métriques
ggplot(mushroom_sample, aes(x = cap.diameter)) + geom_histogram(bins = 30) + ggtitle("Distribution du diamètre du chapeau")





mushroom1 <- read.csv("mushroom_primary/agaricus-lepiota.data", header = FALSE, sep = ",")

# Vérifier les dimensions après la suppression pour s'assurer que le nombre de lignes et de colonnes est correct
dim(mushroom1)

# Afficher les premières lignes pour vérifier les modifications
head(mushroom1)

# Afficher les dernières lignes du DataFrame pour voir la fin des données
tail(mushroom1)



