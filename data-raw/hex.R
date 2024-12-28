## Code to generate the packages' hex logo

# Load the necessary libraries
library(hexSticker)
library(showtext)

# Load the inter font
font_add_google("Inter", "inter", regular.wt = 800)
showtext_auto()

# Create the hex logo
sticker(ggplot2::ggplot() + ggplot2::theme_void(), 
        package="MAPE", p_size=24, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        p_family = "inter", p_color = "#a86a24", h_fill = "#FAFAFA", h_color = "#d2852d",
        filename="inst/imgs/hex.png")
