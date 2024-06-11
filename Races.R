# Load libraries
library(ggplot2)
library(tidyverse)

# Load dataset
f1_races <- races
head(f1_races)
attach(f1_races)

# Check the number of entries and columns
nrow(f1_races)
ncol(f1_races)

# Round of races in each year
ggplot(f1_races, aes(x = year)) +
  geom_bar(fill = "chocolate1", color = "grey") +
  geom_text(stat = 'count', aes(label = ..count..), vjust = -0.5, size = 3) +
  labs(title = "Round of races in each year", x = "Year", y = "Count") +
  theme_minimal()

# Number of grand prix attended from 1950 to 2023
grand_prix_counts <- f1_races %>%
  group_by(name) %>%
  summarise(count = n())

ggplot(grand_prix_counts, aes(x = reorder(name, count), y = count)) +
  geom_bar(stat = "identity", fill = "chocolate1", color = "grey") +
  geom_text(aes(label = count), hjust = -0.1, size = 3) +
  coord_flip() +
  labs(title = "Grand Prix attended from 1950-2023", x = "Grand Prix", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))