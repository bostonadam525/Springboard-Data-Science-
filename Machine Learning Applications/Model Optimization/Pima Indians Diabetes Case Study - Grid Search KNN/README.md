# Pima Indians Diabetes Case Study
* This case study is all about using grid searches to identify the optimal parameters for a machine learning algorithm. To complere this case study, you'll use the Pima Indian diabetes dataset from Kaggle and KNN. Follow along with the preprocessing steps of this case study.

## Background
* (written by Adam Lang, Springboard Data Science Fellow)
* The Pima Indians are known to have the world's highest reported incidence of diabetes. Since 1965, the Pima Indian population has participated in a longitudinal epidemiological study of diabetes and its complications. Usually the examinations include a medical history for diabetes and other health related issues. The Pima Indian populations of Arizona and Mexico continue to be studied to compare the effects of genetics vs. environment and socio-economic factors (Schulz et al. 2015).
### Review of Previous Studies on the Pima Indian Diabetes Database
* One of the original papers published on results from this database focused on the correlation between the prevalence of hypertension and glucose tolerance. In particular the authors had performed a longitudinal analyses of data from 188 Pima Indian children ages 5 to 9 years who had return follow-up examinations between ages 18-24 and revealed no relationship between insulin concentration and blood pressure in either sex (de Courten et al. 1996).
* This study also looked at criteria for diabetes diagnosis especially the relationship between hypertension which is defined as a systolic pressure of >= 140 mmHg and a diastolic blood pressure of >= 90 mmHg. The study examined the relationship between insulin and blood pressure in 188 Pima children. The longitudinal analyses of this cohort revealed no relationship between insulin concentration and blood pressure in either sex.
Diastolic blood pressure is a major variable in this dataset and very often studied in diabetics. This is because diabetics are at a higher risk for left ventricular diastolic dysfunction which leads to a lower diastolic blood pressure or diastolic hypotension. This can also be caused by hypertension usually identified by a higher systolic blood pressure and we know that hypertension is very common in diabetic patients. It is also caused by calcifications in the heart leading to poor filling of the heart ventricles. It is also caused by diabetic nephropathy which often leads to kidney failure and poor circulation resulting in heart failure (de Boer et al. 2017).

* Another study from 2019 looked at the same female only cohort as the dataset we are about to analze and utilize Machine Learning algorithms to predict diabetes. We should use their results as our hypothesis for what we will find. We would assume that our results would be the same or at least similar depending on the sample size we use vs. their sample size and our data modeling approaches vs. theirs.

  * Sample size: 768 Pima Indian women
  * 500 with diabetes
  * 268 without diabetes
  * Age 21 and over
  * Diabetes was diagnosed based on the World Health Organization criteria (i.e., if the 2-hour post-load plasma glucose was at least 200 mg/dl at any survey examination or if found during routine medical care).
* They used 8 variables:
1) age
2) ever pregnant
3) number of pregnancies
4) 2 hour serum insulin (mu U/ml),
5) Body Mass Index (BMI) (weight in kg/(height in m)^2,
6) diastolic blood pressure (mm Hg) (BP),
7) plasma glucose concentration a 2-hour glucose tolerance test
8) triceps skin-fold thickness (mm).

* Bashir et al. 2019 concluded the following:
  * Pima Indian women were at a higher risk for contracting diabetes if they were:
    * younger in age
    * normal body weight (normal BMI)
    * have a fewer number of children (less pregnancies)
    * with hypotension, low or normal diastolic blood pressures
  * Pima Indian women were at lower risk for contracting diabetes if they were:
    * older age
    * overweight
    * with more children (more pregnancies)
    * hypertension (higher diastolic pressure)
* The authors also concluded that genetics or hereditary factors are therefore more likely to contribute to diabetes onset in the Pimas offspring generation.
  
## Hypothesis and Predictions
* Based on these previous studies conducted on the Pima Indian database mentioned above, we should see similar results. However, if our sample size is smaller then we may see different results. Let's find out.
