## BI_Mentorship_Program_Summer2022
***
<b>BodyFat dataset analysis and comparison with BMI range categorizing </b>
***

Requester: Marina Manulik
Date: Jun 30, 2022 </p>
Audience (intended users): public </p>
Requested go live date: August 30, 2022


Problem Statement:
How categorizing of body fat correspond with categorizing of BMI index based on the data set with 252 observations


Business Justification:

The analysis of the dataset provided with dimensions and facts(metrics) : Fat Rage, Health Range, Weight Status (BMI), Density, Age,	Weight,	Height,	Neck, Chest,Abdomen, Hip,	Thigh,	Knee,	Ankle,	Biceps,	Forearm,	Wrist. Success will be measured by showing if there are any notable tendency in corresponding between Fat Rage, Health Range, Weight Status (BM) categorizing.

<pre>

In a given raw dataset next columns was added in MySQL workbench and saved as new table modified_bodyfat:

 - Siri index = (495 /density) - 450)
 - Brozek index = (4.57 /density) - 4.142) * 100)
 - BMI = (weight * 703) / (height * height)
 - Weight status (BMI) - underweight/healthy weight/overweight/obesity
 - fat_range - dangerously low/poor/good/excellent/dangerously heigh
 - health_range = non-healthy/ healthy

</pre>
Visualization:
Cross-sectional analysis of distribution BMI and BodyFat ranges https://public.tableau.com/views/Cross-sectionalanalysisofdistributionBMIandBodyFatranges_/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link

***
<b>Inspiration</b>

Comparison of the effectiveness of body mass index and body fat percentage in defining body composition.
A. R. Goonasegaran, Fatin Nabila, Nurul Shuhada Shuhada
Published 1 June 2012
Medicine
Singapore medical journal
INTRODUCTION Body mass index (BMI) has limited diagnostic performance due to its inability to discriminate between fat and lean mass. 
These factors are relevant to overall health and assessing body fat. For example, the BMI of a person with high bone density and muscle mass may indicate they have high body fat. 
Also, BMI cannot assess where fat is in the body. The location of body fat is also relevant to overall health. For example, fat around the abdomen has higher health risks than fat in other areas.
There are many limitations to BMI and measuring body fat. Having a high body fat percentage or BMI does not always lead to health problems. However, this method does still provide a quick and useful clinical tool to assess health risks.

Reference: https://www.medicalnewstoday.com/articles/body-fat-percentage-chart#limitations
https://pubmed.ncbi.nlm.nih.gov/22711041/

***

<b>Findings</b> 
On the given data set I found the noticible difference between ranges for BMI and FatIndex. 
There is <b> 13% </b> cases with obesity status according BMI range over <b>18.7%</b> cases with dangerously high level of Fat Index
There is <b> 43.40% </b> cases with overweight status according BMI range persons over <b> 28.2%</b> poor/fair Fat Index.
There is <b> 43.40% </b> cases with normal weight status according BMI range over <b>46.2%</b>  exellent Fat Index. 
There is  <b> 0.39% </b> cases with underweight status according BMI range over <b>9.56%</b>  dangerously low Fat Index. 

***
<b>Data Source </b> 
***
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

For a man, 2–5% fat is essential, 2–24% fat is considered healthy, and more than 25% classifies as obesity (https://goshenhealth.com/blog-articles/february-2017/bmi-vs-body-fat-which-number-is-more-important)

<b>Notice: My works was based on given data set (251 observants) and results cannot be generalized to the entire population without further rigorous investigation. Average body fat percentages vary across race and ethnicity and cannot be used separetly for body shape </b>



Findings: As we can see on visualisation there is notisble difference between ranges for FatIndex. bodyfat Siri_indx

