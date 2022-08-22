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
from argparse import ArgumentParser
import os

parser = ArgumentParser()


parser.add_argument('--path', required=True, type=str) ## Root Path ##
parser.add_argument('--dataset_name', required=True, type=str) ## Dataset Name(Example: breakhis, jucyt,bi) ##
parser.add_argument('--dist', required=True, type=str) ## Data Type(Example: Original, ROI) ##
parser.add_argument('--model_name', required=True, type=str) ## CNN Model Name(Example: resnet18. densenet161, inceptionv3)
parser.add_argument('--no_class', required=True, type=int) ## No of Classes ##
parser.add_argument('--epoch', required=True, type=int) ## No of Epoch ##

args = parser.parse_args()

# Paths

train_path = args.path+'/'+args.dataset_name+'/'+args.dist+'/train/'  
validation_path=args.path+'/'+args.dataset_name+'/'+args.dist+'/validation/'

print(train_path,validation_path)

# Data Loading

if args.model_name=='resnet18':
    h,w=224,224
    net= models.resnet18()
    net.fc=nn.Linear(net.fc.in_features,args.no_class)
elif args.model_name=='resnet34':
    h,w=224,224
    net= models.resnet34()
    net.fc=nn.Linear(net.fc.in_features,args.no_class)
elif args.model_name=='resnet50':
    h,w=224,224
    net= models.resnet50()
    net.fc=nn.Linear(net.fc.in_features,args.no_class)
elif args.model_name=='resnet101':
    h,w=224,224
    net= models.resnet101()
    net.fc=nn.Linear(net.fc.in_features,args.no_class)
elif args.model_name=='resnet152':
    h,w=224,224
    net= models.resnet152()
    net.fc=nn.Linear(net.fc.in_features,args.no_class)
elif args.model_name=='densenet121':
    h,w=224,224
    net= models.densenet121()
    net.classifier=nn.Linear(net.classifier.in_features,args.no_class)
elif args.model_name=='densenet161':
    h,w=224,224
    net= models.densenet161()
    net.classifier=nn.Linear(net.classifier.in_features,args.no_class)
elif args.model_name=='densenet169':
    h,w=224,224
    net= models.densenet169()
    net.classifier=nn.Linear(net.classifier.in_features,args.no_class)
elif args.model_name=='densenet201':
    h,w=224,224
    net= models.densenet201()
    net.classifier=nn.Linear(net.classifier.in_features,args.no_class)

elif args.model_name=='inception-v3':
    h,w=299,299
    net= models.inception_v3()
    net.AuxLogits.fc = nn.Linear(768,args.no_class)
    net.fc = nn.Linear(2048,args.no_class)


# TRANSFORM
transform =transforms.Compose([
           transforms.Resize((h,w)),
           transforms.ToTensor(),
		   transforms.Normalize(mean = [ 0.5, 0.5, 0.5 ],
				        std = [ 0.5, 0.5, 0.5]),])
                        
# Loading data from a image folder

train_data = datasets.ImageFolder(train_path ,transform)
validation_data = datasets.ImageFolder(validation_path , transform)
                            
                                       
train_loader = DataLoader(train_data, batch_size=8, shuffle=True, num_workers=2)

validation_loader = DataLoader(validation_data , batch_size=1, shuffle=True ,num_workers=2)

classes = ('B','M')

net = net.cuda()       
criterion = nn.NLLLoss(size_average = True)
optimizer = optim.Adam(net.parameters(),lr=0.0001)

train_loss_vs_epoch=[]
validation_loss_vs_epoch=[]
save_path=os.makedirs(args.path+'/model')
print("Start Training for "+args.model_name) 
print(net)

# Training the network 

min_validation = 9999
for epoch in range(args.epoch) :  
    train_loss = 0.0
 
    for i,batch in enumerate(train_loader,0):
        net=net.train(True) # Training Mode
      
        inputs, labels = batch
        inputs, labels = inputs.cuda(), labels.cuda()
     
        inputs, labels = Variable(inputs), Variable(labels) 
      
       
    
        optimizer.zero_grad()
     
        outputs = net(inputs)
        loss = criterion(F.log_softmax(outputs), labels)
       
        loss.backward()
        optimizer.step()

        train_loss += loss.item()
    train_loss_vs_epoch.append(train_loss/len(train_loader))

   

    
    validation_loss = 0.0
    for batch in validation_loader :
        net = net.train(False)
        inputs, labels = batch

        inputs, labels = inputs.cuda(),labels.cuda();
        inputs, labels = Variable(inputs), Variable(labels) 
        outputs = net(inputs)
        loss = criterion(outputs, labels)        
        validation_loss += loss.item()
     
    validation_loss_vs_epoch.append(validation_loss/len(validation_loader))  
     
     
    plt.plot(train_loss_vs_epoch,'r',validation_loss_vs_epoch,'b')
    plt.savefig('plot'+args.model_name+"_"+args.dataset_name+"_"+args.dist+"_"+'.png')
    
    if validation_loss < min_validation :
        min_validation = validation_loss
        torch.save(net,save_path+'/'+args.model_name+"_"+args.dataset_name+"_"+args.dist+"_"+'.pt');
        print('model saved')

    print('[epoch: %d] train loss: %.6f, val loss= %0.6f' %(epoch+1, train_loss/len(train_loader), validation_loss/len(validation_loader)))
        
print('Finished Training')
 


    
    
    
    
    
    
    
    
    
    
    
    
    

  





