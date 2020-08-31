# Heart-Disease-Analysis: Project Goals 
* Determine whether or not a patient's gender increases/decreases their odds of having heart disease
* Is age a significant factor in determining if a patient has heart disease
* Do patients with higher cholesteral levels have a higher chance of heart disease
* Are patients with higher levels of chest pain more likely to suffer from heart disease

## Data Cleaning
Unfortunately, the dataset collected from Kaggle was not as clean as I hoped for. Thus, the following changes below were made to the data: 

  * Removed rows which had the number of major vessels as 4 (3 major vessels was considered the max)
  * Created a new column with the correct target values (i.e. previous target value of 0 was considered as a patient with heart disease; now target value of 1 means  heart disease)
  * Removed patients who were age 34 or younger and 74 or older 
  * Dropped rows where thal levels were 0 
  * Converted factor variables into factor data type (previous data type was int)
  
Data source and variable descriptions can be found [here](https://www.kaggle.com/ronitf/heart-disease-uci)

## Exploratory Data Analysis

The plots below seem to suggest that male patients are more likely to have a heart disease (HD) than female patients. Similarly, the second plot also suggests that male patients are subject to higher levels of chest pain than female patients; howver, this is probably due to the imbalance in the dataset between males and femaale patients. Moreover, if we take a look at the chest pain levels and its relationship with HD presence, we see something quite interesting. Conventional wisdom suggests that if a patient is suffering from higher levels of chest pain, then perhaps they might be more likely to have a HD. However, this is may not be the case; the 3<sup>rd</sup> plot shows that there are more patients with HD at lower levels of chest pain.

<p float="left">
<img src="imgs/gender plot.png"  width = 310/>

<img src="imgs/chest pain levels.png"  width = 310/>

<img src="imgs/chest pain hd.png"  width = 310/>
</p>

 Additionally, taking a look at the following plot below, it would appear that heart disease might be more common amongst older patients.

<img src="imgs/age boxplot.png"  width = 400/>


## Modeling and Results 

For this dataset, I decided to run a simple logistic model. The response variable will be the `target` variable and the covariates used are `age`, `sex`, `number of major vessels`, `restecg`, `restbps`, `exercise induced angina`, `thal`, `chest pain`, `cholesteral`

Below shows a summary of the model:

<img src="imgs/summary.PNG"  width = 500/>

## Conclusion

Overall, the results from the model summary seems to mostly agree with my previous observations from the plots. At a significance level of 5%, the results seem to suggest that age doesn't significantly increase a patients odds of having a heart disease(as shown by a high p-value of 0.972). However, this may also be due to the nature of the data; most of of the patients in this study were in their mid adult lives (50-60). In addition, the model summary table suggests that a patient's gender seems to have a significant effect on their odds of heart disease. In fact, if a patient is male, then they were more likely to have a heart disease. 

On the other hand, patients with higher levels of chest pain did not have greater chances of having a heart disease. To me, this was the most interesting result from the study as it was entirely different from what I was expecting when I first saw the data. Next, I took a look at the effects from a patient's cholesteral levels. It would appear that a patient's cholesteral level does increase their odds of having a heart disease by about 0.5% . But like the age variable, the increase is not significant at the 5% level and as a result, cholesteral shouldn't have much impact on the odds of a patient having a heart disease.

