# BI_Project_Summer2022

<b>BodyFat dataset analysis and comparison with BMI range categorizing </b>

Requester: Marina Manulik
Date: Jun 30, 2022
Audience (intended users): public
Requested go live date: August 30, 2022


Problem Statement:
How categorizing of body fat corelates with categorizing of BMI index


Business Justification:

The analyses of the dataset provided with dimensions Fat Rage, Health Range, Weight Status (BMI)and facts(metrics) - Density, Age,	Weight,	Height,	Neck, Chest,Abdomen, Hip,	Thigh,	Knee,	Ankle,	Biceps,	Forearm,	Wrist. Success will be measured by showing if there are any notable tendency or difference between Fat Rage, Health Range, Weight Status (BM) categorizing.

<pre>

In a given dataset next columns was added in MySQL workbench:

 - Siri index = (495 /density) - 450)
 - Brozek index = (4.57 /density) - 4.142) * 100)
 - BMI = (weight * 703) / (height * height)
 - Weight status (BMI) - underweight/healthy weight/overweight/obesity
 - fat_range - dangerously low/poor/good/excellent/dangerously heigh
 - health_range = non-healthy/ healthy

</pre>
Cross-sectional analysis of distribution BMI and BodyFat ranges https://public.tableau.com/views/Cross-sectionalanalysisofdistributionBMIandBodyFatranges_/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link



Comparison of the effectiveness of body mass index and body fat percentage in defining body composition.
A. R. Goonasegaran, Fatin Nabila, Nurul Shuhada Shuhada
Published 1 June 2012
Medicine
Singapore medical journal
INTRODUCTION Body mass index (BMI) has limited diagnostic performance due to its inability to discriminate between fat and lean mass. 
This study was conducted to compare the effectiveness of body fat percentage (BFP) against BMI in defining body composition. 


https://pubmed.ncbi.nlm.nih.gov/22711041/
 

Data Source 
- Sourse:
The data was provided by Dr. A. Garth Fisher, Human
Performance Research Center, Brigham Young University, Provo, Utah
84602, who gave permission to freely distribute the data and use them
for non-commercial purposes.  Reference to the data is made in Penrose,
et al. (1985).
- Body Fat Prediction Dataset:
https://www.kaggle.com/datasets/fedesoriano/body-fat-prediction-dataset

- Body fat percentage chart:
https://www.medicalnewstoday.com/articles/body-fat-percentage-chart#men

- Body mass index as a measure of body fatness: age- and sex-specific prediction formulas:
https://www.cambridge.org/core/journals/british-journal-of-nutrition/article/body-mass-index-as-a-measure-of-body-fatness-age-and-sexspecific-prediction-formulas/9C03B18E1A0E4CDB0441644EE64D9AA2

- Body fat percentage:
https://en.wikipedia.org/wiki/Body_fat_percentage

- Accuracy of Siri and Brozek equations in the percent body fat estimation in older adults:
https://pubmed.ncbi.nlm.nih.gov/21085903/

- Article that motivated me on that project 
https://straighthealth.com/you-cant-handle-the-bmi-truth/

