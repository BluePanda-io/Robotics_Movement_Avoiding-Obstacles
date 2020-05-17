function [ th12 ] = CulcTh( DFx,DFy )


         th12=atand(DFy/DFx);
         
         
         
         if (DFx>0 && DFy>0)
             th12=abs(th12);
         elseif (DFx<0 && DFy>0)
             th12=180-abs(th12);
         elseif (DFx<0 && DFy<0)
             th12=180+abs(th12);
         elseif (DFx>0 && DFy<0)
             th12=360-abs(th12);
         end
         
end

