# Imbalanced-Datasets
In this Repo, I will show how to go about working with class imbalance problems by employing different techniques.
1. Working with Credit Card Dataset that can be found here: https://www.kaggle.com/dalpozz/creditcardfraud

About the Dataset: This dataset contains unlabelled data i.e. the feautres( columns ) are anonymized and the data inside them is a result of PCA (Principal Component Analysis) of original feautres. Since, the feautres are anonymized, there is no scope of feautre engineering. PCA transformation ensures that these feautres are the best representative of the original dataset and also, there are no missing values to deal with. So, let's start.

We will be applying treebag to train our model before applying SMOTE and after applying SMOTE and see the results.

About SMOTE: Synthetic Minority Oversampling Technique is used to create synthtic examples of the minority class. You can refer this paper https://www.jair.org/media/953/live-953-2037-jair.pdf on how does it work internally. Once, there is enough balance between both the classes, an algorithm can be applied to train our model on training set and then we can test our model on the testing dataset. Now, we should keep in mind that whenever we are testing our model for an imbalanced dataset then AUC (Area under the curve) which is a representative of ROC( Reciever Operating Characteristics ) is the best way to measure the model affectiveness. AUC values range between 0.5 to 1. 0.5 being that the model is predicting randomly and 1 being that the model is perfect. We, will try to get as close to 1 as possible.  


