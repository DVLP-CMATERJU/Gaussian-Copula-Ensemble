# EC2: A Copula based Ensemble of CNNs for Malignancy Identification in Breast Histopathology and Cytology Images

This is the official code release for the paper titled -

**_"EC2: A Copula based Ensemble of CNNs for Malignancy Identification in Breast Histopathology and Cytology Images"_**

*Copyright 2022, Soumyajyoti Dey, Shyamali Mitra, Sukanta Chakraborty, Debashri Mondal, Mita Nasipuri and Nibaran Das, All rights reserved.*

## Abstract of the Paper
In the present work, we have explored the potential of Copula-based ensemble of CNNs over individual classifiers for malignancy identification in histopathology and cytology images. The Copula-based model that integrates three best performing CNN architectures, namely, DenseNet-161/201, ResNet- 101/34, InceptionNet-V3 is proposed. Also, the limitation of small dataset is circumvented using a Fuzzy template based data augmentation technique that intelligently selects multiple region of interests (ROIs) from an image. The proposed framework of data augmentation amalgamated with the ensemble technique showed a gratifying performance in malignancy prediction surpassing the individual CNN’s performance on breast cytology and histopathology datasets. The proposed method has achieved accuracies of 84.37%, 97.32%, 91.67% on the JUCYT, BreakHis and BI datasets respectively. This automated technique will serve as a useful guide to the pathologist in delivering the appropriate diagnostic decision in reduced time and effort. 

## Repository Descriptions
Dataset Description

```

Dataset_Name
   |-- Original
       |-- Train
           |-- Benign
           |-- Malignant
       |-- Test
           |-- Benign
           |-- Malignant
       |-- Validation
           |-- Benign
           |-- Malignant
   |-- Mask
       |-- Train
           |-- Benign
           |-- Malignant
       |-- Test
           |-- Benign
           |-- Malignant
       |-- Validation
           |-- Benign
           |-- Malignant
   |-- ROI
       |-- Train
           |-- Benign
           |-- Malignant
       |-- Test
           |-- Benign
           |-- Malignant
       |-- Validation
           |-- Benign
           |-- Malignant
```


### External Packages Required
* Numpy 1.14.2
* PIL 5.0.0
* Scipy 1.0.0
* Matplotlib 2.1.2
* Pytorch 0.4.0
* MATLAB-2018b

