library(geobr)
library(dplyr)
library(ggplot2)

estados <- read_state()

doenças$Territorialidades
estados$name_state

doenças <- doenças[-c(1,29,30,31),]

sim <- estados$name_state %in% doenças$Territorialidades

sum(sim)

estados$name_state[!sim]

estados$name_state[c(11,18,19,23,24)] <- c("Rio Grande do Norte", 
                                           "Espírito Santo", "Rio de Janeiro",
                                           "Rio Grande do Sul", 
                                           "Mato Grosso do Sul")


estados <- estados[order(estados$name_state),]

doenças <- doenças[order(doenças$Territorialidades),]

names(doenças)

estados$taxa <- doenças$"% de internações por doenças relacionadas ao saneamento ambiental inadequado 2013"

names(estados)

estados|>
  ggplot()+
  geom_sf(aes(fill=taxa))+
  theme_void()+
  scale_fill_gradient(high =  "brown", low = "lightsalmon")+
  labs(title = 'Taxas de Internações por saneamento inadequado no Brasil', subtitle = "Dados de 2013")+
  geom_sf_text(aes(label = abbrev_state), 
               size = 3,
               color = "black",  
               check_overlap = TRUE)
