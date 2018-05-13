function distance=mpath(x,y,c,distance,dummy,M,N)
  if (x>0&&y-1>0&&y-1<N+1&&x<M+1) 
     if (dummy(x,y-1)==1 &&(distance(x,y-1)==-1||(c+1<distance(x,y-1))))
        distance(x,y-1)=c+1;  
        distance=mpath(x,y-1,c+1,distance,dummy,M,N);
     end
  end
  if (x-1>0&&y>0&&y<N+1&&x-1<M+1)
      if (dummy(x-1,y)==1 &&(distance(x-1,y)==-1||(c+1<distance(x-1,y))))
         distance(x-1,y)=c+1;
         distance=mpath(x-1,y,c+1,distance,dummy,M,N);
      end
  end
  if (x>0&&y+1>0&&y+1<N+1&&x<M+1)
      if (dummy(x,y+1)==1 &&(distance(x,y+1)==-1||(c+1<distance(x,y+1))))
          distance(x,y+1)=c+1;
          distance=mpath(x,y+1,c+1,distance,dummy,M,N);
      end
  end
  if (x+1>0&&y>0&&y<N+1&&x+1<M+1)
     if (dummy(x+1,y)==1 &&(distance(x+1,y)==-1||(c+1<distance(x+1,y))))
        distance(x+1,y)=c+1;
        distance=mpath(x+1,y,c+1,distance,dummy,M,N);
     end
  end
  if (x-1>0&&y-1>0&&y-1<N+1&&x-1<M+1)
     if (dummy(x-1,y-1)==1 &&(distance(x-1,y-1)==-1||(c+1<distance(x-1,y-1)))&&(dummy(x-1,y)==0&&dummy(x,y-1)==0))
        distance(x-1,y-1)=c+1;
        distance = mpath(x-1,y-1,c+1,distance,dummy,M,N);
     end
  end
  if (x-1>0&&y+1>0&&y+1<N+1&&x-1<M+1)
     if (dummy(x-1,y+1)==1 &&(distance(x-1,y+1)==-1||(c+1<distance(x-1,y+1)))&&(dummy(x-1,y)==0&&dummy(x,y+1)==0))
        distance(x-1,y+1)=c+1;
        distance = mpath(x-1,y+1,c+1,distance,dummy,M,N);
     end
  end
  if (x+1>0&&y+1>0&&y+1<N+1&&x+1<M+1)
      if (dummy(x+1,y+1)==1 &&(distance(x+1,y+1)==-1||(c+1<distance(x+1,y+1)))&&(dummy(x,y+1)==0&&dummy(x+1,y)==0))
         distance(x+1,y+1)=c+1;
         distance = mpath(x-1,y+1,c+1,distance,dummy,M,N);
      end
  end
  if (x+1>0&&y-1>0&&y-1<N+1&&x+1<M+1)
     if (dummy(x+1,y-1)==1 &&(distance(x+1,y-1)==-1||(c+1<distance(x+1,y-1)))&&(dummy(x+1,y)==0&&dummy(x,y-1)==0))
        distance(x+1,y-1)=c+1;
        distance = mpath(x+1,y-1,c+1,distance,dummy,M,N);
     end
  end
  
end

