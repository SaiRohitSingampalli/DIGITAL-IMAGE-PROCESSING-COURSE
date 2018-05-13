function features(source,images)
   for iii=1:length(images)
     disp(iii)
     
    
     new_residual_mat = strcat(source,'res',int2str(iii),'.mat');
     load(new_residual_mat)


     x=0;xx=0;xxx=0;xxxx=0;
     y=0;yy=0;yyy=0;yyyy=0;
     [am,bm] = size(res);
     

       
     p1 = zeros(7,7,7); p2 = zeros(7,7,7); p3 = zeros(7,7,7); p4 = zeros(7,7,7);
     count = 1;
     for i = -3:1:3
        for j= -3:1:3
          for k=-3:1:3
              for l=2:1:am-2
                  for m=2:1:bm-2
%                       
                       count=count+1;
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
              new_avg(iii,counter)=avg(i+4,j+4,k+4);
              counter = counter+1;
          end
       end
     end

  

  end
  
  a_residual_mat = strcat(source,'new_avg.mat');
     
  save(a_residual_mat,'new_avg')
     
     
     
end