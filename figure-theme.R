theme_alyssa <- function(){
  theme_classic()+
    theme(axis.title = element_text(size = 16), 
          axis.text.x = element_text(size=14, color="black"), 
          axis.ticks = element_line (colour = "black", size = 1),  
          axis.line = element_line(color = "black", size = 1),
          axis.text.y = element_text(size = 14, color = 'black'))
}