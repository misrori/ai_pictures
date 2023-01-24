# library(rvest)
# t <- read_html('https://mpost.io/best-100-stable-diffusion-prompts-the-most-beautiful-ai-text-to-image-prompts/')
# 
# all <- t %>% html_nodes('.wp-block-image img') %>% html_attr('alt')
# 
# darabok  <- unlist(strsplit(all, ','))
# 
# osszes <- darabok[nchar(darabok)>10 & nchar(darabok)<40]

df <- readLines('artists.txt')
df <- df[grepl(',', df)]

artists <- sapply(strsplit(df, ','), '[[', 1)
artists <- sample(artists, 500)

t <- paste(
  sample( c(rep('photo of misrori person ', 8), rep('portrai photo of misrori person', 5) ), 1),
  'by', artists, 'inspired by ', artists, 'designed by', artists, ' digital art, 8k resulotion, higly detailed, sharp focus, elegant, digital painting, artstation, concept art, smooth, illustration'
)
t
# 
# promts <- c()
# for (i in 1:100) {
#   t <- paste(
#     sample( c(rep('photo of misrori person ', 8), rep('portrai photo of misrori person', 5) ), 1),
#     'inspired by ',
#     paste(sample(artists, sample(1)), collapse = ', ') ,
#     collapse = ' '
#   )
#   promts <- c(promts,t)
# }
library(stringr)

all_promt <- data.frame('promt'= t)
all_promt$id <- str_pad(1:500, 3, pad = "0")

write.csv(all_promt, 'all_promts_v2.csv', row.names = F)




