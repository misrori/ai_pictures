
library(magick)
artist <- read.csv('artist_500.csv')
artist$name <- gsub(' inspired', '', sapply(strsplit(artist$promt, ' by '), '[[', 2))

for (i in 1:500) {
  
  ph <- image_read(paste0('artists_500/',i,'.png'))
  
  ph <- image_annotate(ph, artist$name[i], color = "white", size = 30,  gravity = "southwest")
  image_write(ph, path = paste0('annotated/', i, '.png'), format = "png")

}
# create video, -r is the frame per second
# ffmpeg -r 3 -i '%d.png' -c:v libx264 out.mp4 -i MP3FILE.mp3

