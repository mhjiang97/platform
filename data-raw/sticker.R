library(hexSticker)
library(showtext)
font_add_google("Gochi Hand", "gochi")
showtext_auto()
img <- "sticker.png"
sticker(
  img, package = "platform", p_size = 8, s_x = 1, s_y = 0.9, s_width = .5, s_height = .1,
  h_size = .5, h_fill = "#DEB887", p_color = "#FF8C00", h_color = "#BC8F8F", p_family = "gochi",
  filename = "sticker.svg"
)
