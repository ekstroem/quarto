#library("extrafont")
#loadfonts()

library("ggplot2")
library("ggthemr")
library("ragg")
library("ggtext")


# Set options about figure size and transparent background
knitr::opts_chunk$set(dev.args=list(bg="transparent"), fig.width=20, fig.height=11.25)


ku_colours <- c('#eeeeee', # White
                "#8282ff", # Blue b9b9ff
                "#ff7979", # Red
                '#f2f200', # Yellow
                "#0bff06", # Green
                "#eca8e5", # Magenta
                "#ffad5b"  # Brownish
                )


get_theme_palette <- function() {

    ggthemr::define_palette(
        swatch = ku_colours,
        gradient = c(lower = "#377EB8", upper = "#E41A1C")
    )
    
}

######
#
# Fonts
# Set the default font for graphics
#default_font_name <- "Lato"
#default_font_name <- "Alegreya" ;      default_font_size <- 30
#default_font_name <- "Alegreya Sans" ; default_font_size <- 32

default_font_name <- "Komika Jam" ;   default_font_size <- 38 ; default_font_title_size <- round(default_font_size*1.4)

#library("systemfonts")
#register_variant(
#  name = ""
#)



ggthemr::ggthemr(get_theme_palette())

scale_colour_discrete <- function(...) scale_colour_manual(values=ku_colours)

# scale_colour_manual(values=ku_colours)


theme_ku_quarto <- function() {
    ggplot2::theme_grey(base_size=default_font_size) +
        theme(text = element_text(family=default_font_name, colour="#eeeeee"),   # Handwritten font with ÆØÅ
              line = element_line(colour = "#eeeeee", size = 1, linetype = 1, lineend = "butt"),
              rect = element_rect(fill = "#16161d", colour = "#eeeeee", size = 0.5, linetype = 1),
              panel.background = element_rect(fill = "transparent", colour = NA), # bg of the panel
              plot.background = element_rect(fill = "transparent", colour = NA), # bg of the plot

              axis.text = element_text(colour="#eeeeee", size=default_font_size),   # Colour of axis labels
              axis.line = element_line(size=2, colour="#dddddd"),                   # Colour of axis lines

              plot.title=element_markdown(size=default_font_title_size),
              plot.subtitle= element_markdown(colour="#bbbbbb"),
              plot.caption = element_markdown(colour="#bbbbbb"),
	      
              panel.grid.major.y = element_line(size=1, colour="#232323"), # Gridlines inside picture
              panel.grid.major.x = element_blank(),	                   # 
              panel.grid.minor = element_blank(),
              panel.border = element_blank(),

              legend.position = "none",    # Default no legend
              legend.key = element_rect(fill="#16161d", colour=NA)              
         )
}




theme_set(
  theme_ku_quarto()
)


update_geom_defaults("text", list(family = theme_get()$text$family,
                                  size = default_font_size* 5/14)    # This horrible hack is because one size unit is in pixels and the other is in mm
				  )

