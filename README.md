# Stat405Project

Data:
https://www.kaggle.com/datasets/jeffsinsel/nyc-fhvhv-data

How to clone:
git clone git@github.com:jmbost20/Stat405Project.git
*run this on terminal/ command line

### Questions
- **How do you make use of/download R packages on the HPC. Arrow
 in particular.**
- **Check that github is shared**
 

## Timeline

- April 23rd: figure out basic paths for answering assigned questions in Rstudio
- April 27th: complete Parallelization
- May 1st: Have everything turned in


## Final

##### TURN IN:
- Code
- Report (750 pages) [intro, body, conclusion]
- Presentation (~4 Minutes)
- Peer Review

### Work Split
There are 2 things we need to be working on- Exploratory analysis on the dummy data set and parallelization work using HPC. We should be working on these in tandem.

#### Parallization
- Data Download w wget
- Converting parquet to CSV
- Running all exploratory analysis across all files

#### Exploratory Analysis
- Questions
	-What values produce the most profit for the driver? 
	1. Does a particular company/app have better payed drivers? -Jonah
	2. Is any particular time of year better than another? -Abhi
	3. Does length of trip actually have an affect on profit? -Peter
	4. Does the time of year affect profit? -Charlie



# Previous
## Proposal- Returnables
- [X] code to read data; 
- [X] descriptions of the variables
- [X] statistical methods
- [X] computational steps you will use

### Computation

1. Data Collection- pull Data from Kaggle (wget)
2. Data Cleaning- Convert all Parquet files to CSV (Create some metrics for data conversion to ensure that no data is lost)
3. _Potentially some Feature Engineering_
4. Questions- begin to create code to address questions
* Pick one question for proposal

### Potential Project Focus/Questions:

- Focus on Lyft vs. Uber
    - Which has the higher prices/more likely to surge price?
    - Which finds driver faster/arrives faster?
    - Focus on drivers:
        - Which app pays drivers more?
        - Are Uber or Lyft drivers more likely to get a tip?
- Focus on Supply/Demand
    - When are prices surging and why?
	-any particular regions?
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
   
