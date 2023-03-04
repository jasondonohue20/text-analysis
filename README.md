# text-analysis
#Introduction
- I will analyze what the most common issues are in companies


# Dictionary 
1. Issue: different issues reported by a customer
2. Comapny: Specific comapny related to the issues 
3. State: Where the customer is from 
4. Sentiment: Positive + negative

# Cleaning
1. Removed rows that I didn't use
2. Cut the data down to 50000 columns
- df2 <- df2[1:50000, ]
3. took the top 20 for each graph
- top_n(20)
- top_n(-20)

# Data Summary
  Issue : State : Company
  1. Managing the loan or lease : VA : Wells Fargo & Company

  2. Using a debit or ATM card : CA : Wells Fargo & Company

  3. Account opening, closing, or management : NY : Santander Bank US

   4. Deposits and withdrawals : GA : Wells Fargo & Company

  5. Loan servicing, payments, escrow account : CT : Franklin Credit Management

  6. Deposits and withdrawals : TX : Bank of America
  
   7. Cont'd attempts collect debt not owed : VA : NRA Group, LLC

  8. Cont'd attempts collect debt not owed : FL : SunTrust Banks, Inc.

  9. Billing statement : OH : Citibank

  10. Loan servicing, payments, escrow account : NV : Wells Fargo & Company

  11. Loan modification,collection,foreclosure : NC : Bank of America

  12. Loan servicing, payments, escrow account : CA : JPMorgan Chase & Co.

  13. Loan modification,collection,foreclosure : CA : Citibank

  14. Communication tactics : PA : Asset Management Professionals, LLC

  15. Communication tactics : PA : Wells Fargo & Company

  16. Loan modification,collection,foreclosure : NY : JPMorgan Chase & Co.

  17. Loan modification,collection,foreclosure : FL : Ocwen

  18. Loan modification,collection,foreclosure : NY : JPMorgan Chase & Co.

  19. Loan servicing, payments, escrow account : NJ : Citibank

  20. APR or interest rate : WA : Synchrony Financial


# Data Analysis
1. shows the company with the most complaints

![Rplot04](https://user-images.githubusercontent.com/113206712/222854806-aa75652d-9789-483d-9345-2eb3ea3a76dd.png)
- Bank of America is the leader in complaints
- The companies that have complaints is a lot closer then the type of complaints
- different companies get the same kind of complaints

2. shows the most used negative word

![Rplot03](https://user-images.githubusercontent.com/113206712/222854581-f06da9ae-8d48-470f-ac38-f7be090b20d3.png)
- Debts and incorrect are the most common words
- Not many issues are repeated

3. shows the bottom 20 sentiment companies

![Rplot02](https://user-images.githubusercontent.com/113206712/222854573-6e0dcdf6-8756-4be6-8896-ddf6b097b24f.png)

- Combined postive and negative words
- Experian has the worst score under -2000
- multiple comanies are negative


 

# graph #1 code

df3 <- df2 %>%
  select(Issue, State, Company)

df3review <- df3 %>% 
  count(Company, sort = TRUE) 


df3review %>%  top_n(20) %>% ggplot(aes(Company, n)) + geom_col() + xlab(NULL) + coord_flip()


# graph #2 code 

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



df2_review2 %>% top_n(20) %>% ggplot(aes(word, n)) + geom_col() + xlab(NULL) + coord_flip()


# graph #3 code

problems_bing <- df2_review %>%
  inner_join(get_sentiments("bing")) 
  

problem_sentiment <- problems_bing %>%
  count(Company, word, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)


problem_sentiment %>%  top_n(-20) %>% ggplot(aes(Company, sentiment)) + geom_col() + xlab(NULL) + coord_flip()  


