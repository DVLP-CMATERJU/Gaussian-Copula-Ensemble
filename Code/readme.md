
* Split Dataset into train, test and validation: ```Run python3 data_separation.py```
* Train CNN Models(ResNet, DenseNet, InceptionNet): ```Run python3 train_cnn.py --path "/media/soumyajyoti/" --dataset_name "fnac" --dist "Original" --model_name "resnet18" --no_class 2 --epoch 200```
* Class specific probability distribution value evaluation: ``` Run Probability_cal.py ```
* Segmentation Mask Preparation: ```Run "./Copula_Ensemble/demo.m"```
* ROI Extraction from Original Image: ``` Run "./ROI_Extraction/demo.m"```
* Proposed Ensemble Model: ```Run "./Copula_Ensemble/demo.m"```


