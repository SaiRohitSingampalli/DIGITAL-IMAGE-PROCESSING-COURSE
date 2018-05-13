clc;clear all;
source_dir='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\UCIDdirectory';
mkdir dest_dir_90; 
mkdir dest_dir_70;
mkdir dest_dir_50;
mkdir residual_dir;
mkdir dest_dir_med;
mkdir dest_dir_med90;
mkdir dest_dir_med70;
mkdir dest_dir_med50;
mkdir dest_dir_mat1;
mkdir dest_dir_mat2;
mkdir dest_dir_mat3;
mkdir dest_dir_mat4;
mkdir dest_dir_mat5;
mkdir dest_dir_mat6;
mkdir dest_dir_mat7;
mkdir dest_dir_mat8;
mkdir features;
dest_dir_90='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_90';
dest_dir_70='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_70';
dest_dir_50='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_50';
residual_dir='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\residual_dir';
images=dir([source_dir '/*.tif']);
dest_dir_med ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_med';
dest_dir_med90='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_med90' ;
dest_dir_med70='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_med70' ;
dest_dir_med50='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_med50' ;
dest_dir_mat8 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat8\';
dest_dir_mat1 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat1\';
dest_dir_mat2 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat2\';
dest_dir_mat3 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat3\';
dest_dir_mat4 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat4\';
dest_dir_mat5 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat5\';
dest_dir_mat6 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat6\';
dest_dir_mat7 ='C:\Users\Sai\Documents\MATLAB\DIP PROJECT\dest_dir_mat7\';
features = 'C:\Users\Sai\Documents\MATLAB\DIP PROJECT\features\';
disp('Compression initiated ...')
compress(source_dir,dest_dir_90,dest_dir_70,dest_dir_50,images);
disp('Median photos are being generated..')
median(source_dir,dest_dir_med,dest_dir_90,dest_dir_med90,dest_dir_70,dest_dir_med70,dest_dir_50,dest_dir_med50,images);
disp('Residual image generation initiated  ...')
residual(source_dir,dest_dir_mat1,images);
residual(dest_dir_90,dest_dir_mat2,images);
residual(dest_dir_70,dest_dir_mat3,images);
residual(dest_dir_50,dest_dir_mat4,images);
residualgray(dest_dir_med,dest_dir_mat5,images);
residualgray(dest_dir_med90,dest_dir_mat6,images);
residualgray(dest_dir_med70,dest_dir_mat7,images);
residualgray(dest_dir_med50,dest_dir_mat8,images);
disp('Features extraction initiated ...')
% features(dest_dir_mat1,images);
% disp('end')
% features(dest_dir_mat2,images);
% features(dest_dir_mat3,images);
% features(dest_dir_mat4,images);
% features(dest_dir_mat5,images);
% features(dest_dir_mat6,images);
% features(dest_dir_mat7,images);
% features(dest_dir_mat8,images);
% p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
%1
source=dest_dir_mat1;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg1(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat1 = strcat(features,'new_avg1.mat');
save(a_residual_mat1,'new_avg1')




source=dest_dir_mat2;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg2(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat2 = strcat(features,'new_avg2.mat');
save(a_residual_mat2,'new_avg2')




source=dest_dir_mat3;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg3(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat3 = strcat(features,'new_avg3.mat');
save(a_residual_mat3,'new_avg3')



source=dest_dir_mat4;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg4(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat4 = strcat(features,'new_avg4.mat');
save(a_residual_mat4,'new_avg4')



source=dest_dir_mat5;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg5(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat5 = strcat(features,'new_avg5.mat');
save(a_residual_mat5,'new_avg5')



source=dest_dir_mat6;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg6(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat6 = strcat(features,'new_avg6.mat');
save(a_residual_mat6,'new_avg6')






source=dest_dir_mat7;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg7(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat7 = strcat(features,'new_avg7.mat');
save(a_residual_mat7,'new_avg7')




source=dest_dir_mat8;
for iii=1:length(images)
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)
     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2  
                       if ((res(l,m)==j)&&(res(l-1,m)==i))
                          x=x+1;
                       end
                       if ( (res(l,m)==j)&&(res(l-1,m)==i )&&(res(l+1,m)==k))
                          y=y+1;  
                       end 
                       if ((res(l,m)==j)&&(res(l+1,m)==i))
                          xx=xx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l+1,m)==i )&&(res(l-1,m)==k))
                          yy=yy+1;  
                       end 
                       if ((res(l,m-1)==j)&&(res(l,m)==i))
                          xxx=xxx+1;
                       end
                       if ( (res(l,m-1)==j)&&(res(l,m)==i )&&(res(l,m+1)==k))
                          yyy=yyy+1;  
                       end  
                       if ((res(l,m)==j)&&(res(l,m+1)==i))
                          xxxx=xxxx+1;
                       end
                       if ( (res(l,m)==j)&&(res(l,m+1)==i )&&(res(l,m-1)==k))
                          yyyy=yyyy+1;  
                       end   
                  end
              end
              p1(i+4,j+4,k+4) = y/x;
              p2(i+4,j+4,k+4) = yy/xx;
              p3(i+4,j+4,k+4) = yyy/xxx;
              p4(i+4,j+4,k+4) = yyyy/xxxx;
          end
        end
     end
     avg = zeros(7,7,7);counter = 1;
     for i = -3:1:3
       for j = -3:1:3
          for k= -3:1:3
              avg(i+4,j+4,k+4)=(p1(i+4,j+4,k+4)+p2(i+4,j+4,k+4)+p3(i+4,j+4,k+4)+p4(i+4,j+4,k+4))/4;
              new_avg8(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end
end
a_residual_mat8 = strcat(features,'new_avg8.mat');
save(a_residual_mat8,'new_avg8')

disp('End')





















     
     

