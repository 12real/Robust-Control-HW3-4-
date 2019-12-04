# Robust-Control-HW3&4
鲁棒控制作业三和作业四
## HW 3 (DGKF法设计磁盘控制器)
### 1.程序代码
 DGKF_LMI.m
### 2.1控制器传递函数
  G =  
 ####  1.361e05 s^7 + 6.837e11 s^6 + 1.632e16 s^5 + 6.453e20 s^4 + 6.966e24 s^3 + 1.183e29 s^2+ 1.303e32 s + 1.613e34   
 ----------------------------------------------------------------------------------------------------------------------         
 #### s^8 + 3.429e06 s^7 + 4.813e11 s^6 + 3.532e16 s^5 + 1.448e21 s^4 + 2.595e25 s^3 + 2.53e29 s^2 + 1.456e33 s + 1.457e29
### 2.2控制器波特图
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/DGKF_K_bode.png) 
### 3.相关性能曲线
#### （1）阶跃响应曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/DGKF_step_response.png) 
#### （2）干扰响应曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/DGKF_step_disturb_response.png) 
#### （3）其他相关曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/DGKF_robust.png) 

## HW 4（LMI设计磁盘控制器）
### 1.1控制器传递函数
  G =                                                                      
 ####  0.04095 s^7 + 2.058e05 s^6 + 4.893e09 s^5 + 1.939e14 s^4 + 2.089e18 s^3 + 3.559e22 s^2 + 3.924e25 s + 4.897e27
  --------------------------------------------------------------------------------------------------------------------
 ####  s^7 + 1.433e05 s^6 + 1.059e10 s^5 + 4.352e14 s^4 + 7.805e18 s^3 + 7.612e22 s^2 + 4.385e26 s - 4.795e22
### 1.2控制器波特图
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/LMI_K_bode.png) 
### 2.控制器差异比较
 从图中我们可以看到，由LMI和DGKF法所算出的控制器K在低频阶段几乎完全一致，但是在高频段时，DGKF法所计算出的控制器增益明显下降，而LMI则几乎保持不变
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/LMI_DGKF_diff.png) 
### 3.相关性能曲线
#### （1）阶跃响应曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/LMI_step_response.png) 
#### （2）干扰响应曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/LMI_step_disturb_response.png) 
#### （3）其他相关曲线
![image](https://github.com/12real/Robust-Control-HW3-4-/blob/master/LMI_robust.png) 


## 《鲁棒控制》课程建议


