# -*- coding: utf-8 -*-
"""
Created on Sat Sep  5 20:29:36 2020

@author: soumyajyoti
"""

#Split data in 3:1:1 ratio(Train: test: validation)#

import os , shutil ,random 
import math as m

dest_path = '/media/soumyajyoti/fnac/Original/' ## Destination Path- Splited Dataset saved Path 
src_path = '/media/soumyajyoti/fnac/Data/' ## Undivided Original Data source Path: "./Data/" path has the folder only class wise

src_list=os.listdir(src_path)

for j in src_list:
    class_path=src_path+'/'+j+'/'
    class_list=os.listdir(class_path)
    random.shuffle(class_list)
    n=len(class_list)
    t_l=m.ceil((3/5)*n)
    v_l=m.ceil((4/5)*n)
    for i,file in enumerate(class_list):
        folder = file[0:1]
        file_name = file
        if i < t_l:
            if not os.path.exists (dest_path+'/train/'+j) :
                os.makedirs(dest_path+'/train/'+j)             
            shutil.copyfile( class_path+file , dest_path+'/train/'+j+'/'+file_name)
        elif t_l< i < v_l :
            if not os.path.exists (dest_path+'/validation/'+j) :
                os.makedirs(dest_path+'/validation/'+j)             
            shutil.copyfile( class_path + file , dest_path+'/validation/'+j+'/'+file_name)
        else :
            if not os.path.exists (dest_path+'/test/'+j) :
                os.makedirs(dest_path+'/test/'+j)             
            shutil.copyfile(class_path + file , dest_path+'/test/'+j+'/'+file_name)
        
    




