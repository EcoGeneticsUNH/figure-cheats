# Custom maps -- make sure to run the theme_ecogen code before this to utilize the theme functions.

# Load required packages
library(ggmap)
library(tidyverse)

# Register api key for stadiamaps
register_stadiamaps("ed8988df-e4ec-4f72-b2a4-0e09af8c8886")

# Map coding -- put coordinates in bbox = c(), bottom left and upper right coordinates
GBE_map <- get_stadiamap(bbox = c(-70.921099,43.045919,-70.829538, 43.138), maptype = "stamen_toner_lite", zoom = 13, scale = "auto") %>%
  ggmap()+
  # Point 1 coordinates
  geom_point(aes(x = -70.8659, y = 43.097), data = NULL, 
             alpha = 0.5, color = "#40E0D0", size = 5, pch= 19)+
  # Point 1 label
  annotate('text', x = -70.86, y = 43.063, label = 'NI', 
           colour = I("black"), size = 4, fontface = "bold")+
  # Great Bay and little bay labels
  annotate('text', x = -70.862, y = 43.105, label = 'Little Bay', 
           colour = I("black"), size = 4.5, fontface = "italic")+
  annotate('text', x = -70.88, y = 43.073, label = 'Great Bay', 
           colour = I("black"), size = 4.5, fontface = "italic")+
  # Change axes labels
  labs(x = 'Longitude', y = 'Latitude')+
  # Add in custom lab theme
  theme_ecogen()+
  # Add in scale bar -- x.min/max and y.min/max change the position, dist changes the scale
  ggsn::scalebar(x.min = -70.893, x.max = -70.868, 
                 y.min = 43.049, y.max = 43.06, dist_unit = "km", 
                 dist = 0.5, transform = TRUE, 
                 model = "WGS84", height = 0.1, 
                 st.dist = 0.1, st.size = 3, border.size = 0.3)

# View map
GBE_map