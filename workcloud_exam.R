setwd("C:/Users/Rafael Liel/Desktop/DM101-Assignments/Lab Exam")

feedback <- readLines("feedback.txt", encoding = "UTF-8")

if(length(feedback) == 0){
  feedback <- readLines("feedback.txt", encoding = "UTF-16")
}
feedback <- feedback[nchar(feedback) > 0]
if(length(feedback) == 0){
  stop("feedback.txt is empty or not readable. Check the file!")
}

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

corpus <- VCorpus(VectorSource(feedback))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)

tdm <- TermDocumentMatrix(corpus)
if(nrow(tdm) == 0){
  stop("No terms found after preprocessing!")
}

m <- as.matrix(tdm)
freq <- sort(rowSums(m), decreasing = TRUE)
freq_df <- data.frame(word = names(freq), freq = freq, row.names = NULL)

print(head(freq_df, 10))

freq_df_main <- subset(freq_df, freq >= 2)
if(nrow(freq_df_main) == 0){
  stop("No words meet min.freq=2. Lower min.freq or check your data.")
}

png("wordcloud_exam.png", width = 800, height = 600)
wordcloud(words = freq_df_main$word,
          freq = freq_df_main$freq,
          min.freq = 2,
          max.words = 1000,
          random.order = FALSE,
          scale = c(4, 0.5),
          colors = brewer.pal(8, "Dark2"))
dev.off()

rare_df <- subset(freq_df, freq == 1)
if(nrow(rare_df) < 5){
  rare_df <- tail(freq_df, 5)
}

png("wordcloud_rare.png", width = 800, height = 600)
wordcloud(words = rare_df$word,
          freq = rare_df$freq,
          min.freq = 1,
          max.words = 5,
          random.order = FALSE,
          scale = c(3, 0.4),
          colors = brewer.pal(8, "Dark2"))
dev.off()
