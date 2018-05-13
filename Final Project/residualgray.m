function residualgray(source,destination,images)

  for i=1:length(images)
    aa=imread([source '/' num2str(i) '.jpg']);
    bb=aa;
    med = medfilt2(bb);
    res = med - bb;
    [am,bm] = size(med);
     for k=1:1:am
        for j=1:1:bm
             if (res(k,j)>3)
                 res(k,j)=3;
                 
             elseif (res(k,j)<-3)
                 res(k,j)=-3;
             end
        end
     end
     residual_mat = strcat(destination,'res',int2str(i),'.mat');
     
     save(residual_mat,'res')
   
  end
end