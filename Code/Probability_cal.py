#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug 22 14:57:22 2022

@author: soumyajyoti
"""


## Class specific probability distribution value Evaluation ##

import csv
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import torchvision.datasets as datasets
from torch.autograd import Variable
from torch.utils.data import DataLoader
import matplotlib.pyplot as plt
import numpy as np
import torchvision.models as models
import pandas as pd
import os
torch.cuda.set_device(0)

c1=[]
c2=[]
model_name='resnet18' ## CNN Model Name ##
d='Original' ## For ROI, Write 'ROI' ##
k='' ## "Train"/ "Test"/ "Validation" ##

# Paths

path = './fnac/Original/train/' #Dataset Path#
save_path='./Probability/' ## Saved Path ##

if not os.path.exists (save_path) :
    os.makedirs(save_path)   

h,w = 224,224 ## Height and Width  

# TRANSFORM
transform = transforms.Compose([
		   transforms.Resize((h,w)),
		   transforms.ToTensor(),
		   transforms.Normalize(mean = [ 0.5, 0.5, 0.5 ],
				        std = [ 0.5, 0.5, 0.5 ]),
                          ])
     
# Loading data from a image folder

data = datasets.ImageFolder(path ,transform)
data_loader = DataLoader(data, batch_size=1, shuffle=False, num_workers=2)
net = torch.load("best trained model path")
net=net.eval()
net =  net.cuda()
optimizer = optim.Adam(net.parameters(),lr=0.001)
for i,batch in enumerate(data_loader):
        net=net.train(False) 
       
        inputs, labels = batch
        inputs, labels = inputs.cuda(), labels.cuda()
       
        inputs, labels = Variable(inputs), Variable(labels) 
       
        outputs = net(inputs)
        New_prob = F.softmax(outputs)
        c1.append(New_prob[0][0].item())
        c2.append(New_prob[0][1].item())

c1_df=pd.DataFrame(c1)
c2_df=pd.DataFrame(c2)

c1_df.to_csv(save_path+model_name+'_'+d+'_'+k+'_B.csv', index=False, header=False)
c2_df.to_csv(save_path+model_name+'_'+d+'_'+k+'_M.csv', index=False, header=False)

