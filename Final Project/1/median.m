%% APPLYING MEDIAN FILTER(MF3) ON ORIGINAL IMAGE, JPEG90,JPEG70,JPEG50

function median(source_dir,dest_dir_med,dest_dir_90,dest_dir_med90,dest_dir_70,dest_dir_med70,dest_dir_50,dest_dir_med50,images)

   for i=1:length(images)
    a=imread([source_dir '/' num2str(i) '.jpg']);
    b=(rgb2gray(a));
    med = medfilt2(b);
    imwrite(med,[dest_dir_med '/' num2str(i) '.jpg']);
    
    c=imread([dest_dir_90 '/' num2str(i) '.jpg']);
    d=(rgb2gray(c));
    med1 = medfilt2(d);
    imwrite(med1,[dest_dir_med90 '/' num2str(i) '.jpg']);
    
    e=imread([dest_dir_70 '/' num2str(i) '.jpg']);
    f=(rgb2gray(e));
    med2 = medfilt2(f);
    imwrite(med2,[dest_dir_med70 '/' num2str(i) '.jpg']);
    
    g=imread([dest_dir_50 '/' num2str(i) '.jpg']);
    h=(rgb2gray(g));
    med3 = medfilt2(h);
    imwrite(med3,[dest_dir_med50 '/' num2str(i) '.jpg']);
    
   end
   
end