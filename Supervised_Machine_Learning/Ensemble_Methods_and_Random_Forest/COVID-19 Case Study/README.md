# COVID-19 Case Study
* This is a case study I did using a patient cohort dataset from COVID-19 from the country of South Korea.
* The notebook demonstrates exploratory data analysis, data wrangling and pre-processing and building and evaluating a Random Forest Classifier machine learning model.
* The target predictor variable is "State" which is either:
      * "isolated"
      * "released"
      * "deceased"
* The target variable had significant imbalance in the classes with more "isolated" patients than the other 2 classes.
* The age group variable also demonstrated a bimodal distribution with more patients likely to be between age 20 and 45. This data is obviously authentic as we know that South Korea as of August 2023 only had 0.5% of the worldwide death rate for COVID-19 and only 1.76% of that was age 70 and older. By contrast, data as of May 2023 shows the USA has 16.9% of the worldwide fatality rate for COVID-19 and 53.6% of worldwide death rate is elderly patients age 70 and older.
    * Source: https://www.statista.com/statistics/1254488/us-share-of-total-covid-deaths-by-age-group/
    * Source: https://www.statista.com/statistics/1105088/south-korea-coronavirus-mortality-rate-by-age/
* Thus it is no surprise that the outcome of this classification case study was that patients in South Korea were predicted to be younger and more likely to be isolated. However, due to significant imbalance in the target variable classes, the classifier model did predict more false positive deceased cases which demonstrates how target class imbalance can cause inaccurate final predictions.
