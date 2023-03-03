library(readxl)
library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)
library(ggrepel)
library(stringr)
library(tidytext)
library(textdata)
library(janeaustenr)
library(tidyr)
library(shiny)
get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc")

rm(list = ls())

setwd("~/Desktop/data 332/text analysis")

df <- read.csv("Consumer_Complaints.csv")

saveRDS(df, file = "Consumer_Complaints.rds")


df <- readRDS("Consumer_Complaints.rds")

df2 <- df %>% select(-c(Consumer.complaint.narrative, Company.public.response, Consumer.consent.provided.))

df2 <- df2[1:50000, ]


df2_review <- df2 %>%
  unnest_tokens(word, Issue) %>%
  anti_join(stop_words) 

df2_review %>%
  count(word) %>%
  arrange(desc(n))



nrc_negative <- get_sentiments("nrc") %>% 
  filter(sentiment == "negative")

df2_review2 <- df2_review %>%
  inner_join(nrc_negative) %>%
  count(word, sort = TRUE)


#shows the most used negative word
df2_review2 %>% top_n(20) %>% ggplot(aes(word, n)) + geom_col() + xlab(NULL) + coord_flip()

df3 <- df2 %>%
  select(Issue, State, Company)

df3review <- df3 %>% 
  count(Company, sort = TRUE) 

#shows the company with the most complaints
df3review %>%  top_n(20) %>% ggplot(aes(Company, n)) + geom_col() + xlab(NULL) + coord_flip()


problems_bing <- df2_review %>%
  inner_join(get_sentiments("bing")) 
  

problem_sentiment <- problems_bing %>%
  count(Company, word, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)

#shows the bottom 20 sentiment companies
problem_sentiment %>%  top_n(-20) %>% ggplot(aes(Company, sentiment)) + geom_col() + xlab(NULL) + coord_flip()  



dataset<- df3
column_names<-colnames(dataset) #for input selections

ui<-fluidPage( 
  
  titlePanel(title = "Companies Issues"),

  
  fluidRow(
    column(2,
           selectInput('X', 'Choose X',column_names,column_names[1]),
           selectInput('Y', 'Choose Y',column_names,column_names[3]),
           selectInput('Splitby', 'Split By', column_names,column_names[2])
    ),
    column(4,plotOutput('plot_01')),
    column(6,DT::dataTableOutput("table_01", width = "100%"))
  )
  
  
)

server<-function(input,output){
  

  
  output$table_01<-DT::renderDataTable(dataset[,c(input$X,input$Y,input$Splitby)],options = list(pageLength = 4))
}

shinyApp(ui=ui, server=server)




  

  



                       
