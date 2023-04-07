# Stat405Project

Data:
https://www.kaggle.com/datasets/jeffsinsel/nyc-fhvhv-data

### Proposal- Returnables
* code to read data; 
* descriptions of the variables
* statistical methods
* computational steps you will use
* link to your github repository. 
* Turn in a proposal.html (knitted from proposal.Rmd or from some
other source) or a proposal.pdf.

### Computation
1. Data Collection- pull Data from Kaggle (wget)
2. Data Cleaning- Convert all Parquet files to CSV (Create some metrics for data conversion to ensure that no data is lost)
3. _Potentially some Feature Engineering_
4. Questions- begin to create code to address questions
* Pick one question for proposal

*Alternatively we could manipulate the Parquet files in their current state, but that could be risky as we have less familiarity 


Potential Project Focus/Questions:

- Focus on Lyft vs. Uber
    - Which has the higher prices/more likely to surge price?
    - Which finds driver faster/arrives faster?
    - Focus on drivers:
        - Which app pays drivers more?
        - Are Uber or Lyft drivers more likely to get a tip?
- Focus on Supply/Demand
    - When are prices surging and why?
    - Where in NYC are Ubers/Lyfts being called most frequently?
    - Are there any areas that drivers avoid/cancel more frequently?
    - How long (distance and time) are most trips?
- Focus on Driver Compensation
    - How many rides does the average driver do in a day?
    - How much are they making?
    - Do drivers that drive more often get more tips?
- Ride Identification
    - Which license plates are the most frequent drivers?
    - What time in the day do high frequency cars drive?
    - When do low frequency cars drive in the day?
   
