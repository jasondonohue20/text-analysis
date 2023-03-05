# text-analysis
# Introduction
- I will analyze what the most common issues are in companies


# Dictionary 
1. Issue: different issues reported by a customer
2. Comapny: Specific comapny related to the issues 
3. State: Where the customer is from 
4. Sentiment: Positive + negative

# Cleaning
1. Removed rows that I didn't use
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
1. shows the most used negative words
![Rplot05](https://user-images.githubusercontent.com/113206712/222989262-5682cedd-1a58-48f6-af64-5a67821664e4.png)


![Rplot03](https://user-images.githubusercontent.com/113206712/222854581-f06da9ae-8d48-470f-ac38-f7be090b20d3.png)
- Both of these graphs show the most used negative word. 
- The word cloud allows you to see what the words are but the bar graph allows you to see how much 
- I used a max of 60 words in the word cloud so it would fit on the screen
- I used top_n(20) in my bar graph so you can tell what the total negative words are
- Debts and incorrect are the most common words
- Not many issues are repeated

2. shows the bottom 20 sentiment companies

![Rplot02](https://user-images.githubusercontent.com/113206712/222854573-6e0dcdf6-8756-4be6-8896-ddf6b097b24f.png)

- Combined postive and negative words
- I used "bing" to figure out the total sentiment
- I took the lowest 20 for the bar graph to show the companies with the worst sentiment top_n(-20)
- Experian has the worst score under -2000
- multiple companies are negative


 

# graph #1/ word cloud code

![64BA5F0E-DC97-49C1-9963-14303DACECE0_4_5005_c](https://user-images.githubusercontent.com/113206712/222989667-bdf26025-5ec3-445c-bfb0-bcd410a0d946.jpeg)


![B3E3907C-89A3-44E6-A663-1A481F09F9B5](https://user-images.githubusercontent.com/113206712/222989712-e547a5b8-63c0-46cd-8c17-365bd2c9adfa.jpeg)


# graph #2 code 

![03175C49-F904-4A21-AC20-D6C9F427F83E](https://user-images.githubusercontent.com/113206712/222989803-87fdf5f1-589e-4169-b470-43ff0892b275.jpeg)

# shiny app

![3FFDA2ED-FA29-4C94-99DE-17A800379880](https://user-images.githubusercontent.com/113206712/222988774-5a3207dd-a43b-4d75-8575-44f4800dd9c8.jpeg)
 relate

- In the input section the user has to choose up to 20 companies that they want to see 
- 20 is the limit so the data isn't clustered
- In the output section of the code I have the graph changing based on what the user inputs by using input$n
- I used a bar graph because I thought it was the easiest way to see the total number of issues for each company
- Bank of America is the leader in complaints
- The companies that have complaints is a lot closer then the type of complaints
- different companies get the same kind of complaints



# code for shiny app

![49826F3A-B351-4BAF-94E3-01DFDE9C0098](https://user-images.githubusercontent.com/113206712/222989007-5a6d1619-18f4-4c30-8fbe-509211fa57b5.jpeg)


