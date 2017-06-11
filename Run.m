v=VideoReader('Vid3.mp4'); 
im1=read(v,1);
imshow(im1);
imwrite(im1,'Tennis1.jpg');
return;

for i = 1:1:120
im1=read(v,i);
load('P.mat');
%imshow(im1);
%imwrite(im1,'Emb.jpg');
%return;
%I=im2double(imread('testimage2.png'));
I=im1;
 I=im2double(I);
%return
% P=[146.2851  610.0868;72.2355  710.5826;119.8388  813.7231;180.6653  856.0372;260.0041  848.1033;334.0537  779.3430;331.4091  684.1364;421.3264  676.2025;...
%     521.8223  665.6240;532.4008  596.8636;587.9380  517.5248;513.8884  480.5000;410.7479  406.4504;289.0950  440.8306;228.2686  491.0785];
% %   x=[96 51 98 202 272 280 182];
% %   y=[63 147 242 262 211 97 59];
% %   P=[x(:) y(:)];
% P=[ 320.8306  533.3926;341.9876  485.7893;400.1694  438.1860;476.8636  398.5165;556.2025  406.4504;572.0702  485.7893;550.9132  565.1281;513.8884  623.3099;...
%   431.9050  655.0455;379.0124  673.557;310.2521  668.2686;299.6736  625.9545;278.5165  594.2190;291.7397  549.2603;334.0537  546.6157]
 
% figure,
% imshow(im1), hold on; plot(P(:,2),P(:,1),'b.');
%return
  Options=struct;
  Options.Verbose=true;
  Options.Iterations=400;
  Options.Wedge=2;
  Options.Wline=0;
  Options.Wterm=0;
  Options.Kappa=4;
  Options.Sigma1=8;
  Options.Sigma2=8;
  Options.Alpha=0.1;
  Options.Beta=0.1;
  Options.Mu=0.2;
  Options.Delta=-0.1;
  Options.GIterations=600;
  [O,J]=Snake2D(I,P,Options);
% figure('Visible','off'),
%     set(0, 'CurrentFigure', 1);
%    clf reset;
figure (1),
  imshow(I), hold on; plot(O(:,2),O(:,1),'r.');
 
  saveas(figure (1),'Im2.jpg') ;
  Imda=imread('Im2.jpg');
  F(i)= im2frame(Imda);
  i
  end
  movie(F);
  film = VideoWriter('newfile1.avi');
  open(film);
  writeVideo(film,F);
    close(film);
