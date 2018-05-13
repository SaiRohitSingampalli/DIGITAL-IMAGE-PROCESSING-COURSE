function compress(source_dir,dest_dir_90,dest_dir_70,dest_dir_50,images)

       for i=1:length(images)
          disp(i)
          I=imread([source_dir '/' num2str(i,'ucid%05d') '.tif']);
          imwrite(I,[dest_dir_90 '/' num2str(i) '.jpg'],'Quality',90)
       end
       for i=1:length(images)
          disp(i)
          I=imread([source_dir '/' num2str(i,'ucid%05d') '.tif']);
          imwrite(I,[dest_dir_70 '/' num2str(i) '.jpg'],'Quality',70)
       end
       for i=1:length(images)
           disp(i)
          I=imread([source_dir '/' num2str(i,'ucid%05d') '.tif']);
           imwrite(I,[dest_dir_50 '/' num2str(i) '.jpg'],'Quality',50)
       end
       for i=1:length(images)
           disp(i)
          I=imread([source_dir '/' num2str(i,'ucid%05d') '.tif']);
           imwrite(I,[source_dir '/' num2str(i) '.jpg'])
       end

end