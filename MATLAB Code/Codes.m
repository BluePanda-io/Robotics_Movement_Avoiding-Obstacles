clear all


%SSSOOOOSS In the table (Ground) Y goes in the position of X because array

%% remove the persentage-comment symbol if you want to run The particular Test
% In the start it will run the Test 1

%% ==================Test 1

Robots=[80 80 2 0 330 0 0 0 0; 
    30 80 2 0 0 0 0 0 0;
    50 10 2 0 0 0 0 0 0;
    5 20 2 0 0 0 0 0 0];
Person = [];



%% ==================Test 2
% Robots=[240 200 2 0 0 0 0 0 0; 
%     150 170 2 0 125 0 0 0 0;
%     130 155 2 0 10 0 0 0 0;
%     115 220 2 0 50 0 0 0 0];
% Person = [];



%% ==================Test 3
% Robots=[180 200 2 0 45 0 0 0 0; 
%     120 170 2 0 45 0 0 0 0;
%     80 155 2 0 40 0 0 0 0;
%     55 220 2 0 21 0 0 0 0];
% Person = [ 140 135 2 0 45 0 0 0 0];




%% ==================Test 4
% Robots=[180 200 2 0 45 0 0 0 0; 
%     120 170 2 0 45 0 0 0 0;
%     80 155 2 0 40 0 0 0 0;
%     55 220 2 0 21 0 0 0 0];
% Person = [ 140 135 2 0 90 0 0 0 0];



%% ==================Test 5
% Robots=[180 200 2 0 45 0 0 0 0; 
%     120 170 2 0 45 0 0 0 0;
%     80 155 2 0 40 0 0 0 0;
%     55 220 2 0 21 0 0 0 0;
%     25 120 2 0 21 0 0 0 0;
%     55 100 2 0 21 0 0 0 0;
%     50 80 2 0 21 0 0 0 0;
%     32 30 2 0 21 0 0 0 0;
%     19 10 2 0 21 0 0 0 0];
% Person = [ ];

%% ==================Test 6
% Robots=[180 150 2 0 45 0 0 0 0; 
%     160 110 2 0 45 0 0 0 0;
%     110 95 2 0 40 0 0 0 0;
%     85 50 2 0 21 0 0 0 0];
% Person = [ 100 150 2 0 -45 0 0 0 0];


%% =================Initialize



%Robots = x,y,ux,uy,th,Rxx,Rxy,Ryx,Ryy

NRobots = size(Robots,1); % How many Robots we have
NRobots

% Person = [ 20 20 2 0 90 0 0 0 0; ];
%      80 140 2 0 0 0 0 0 0;]   
%     300 250 2 0 180 0 0 0 0;];

NPerson = size(Person,1); % How many Robots we have
NPerson


T=1; % Time for every Round

Ground=zeros(250,280);
Drp=90; % After this distance between Robot and Person we start to have rpoblem

BD=32; % BD = BasicDistance The robots try to maintain this distance by changing their speed 
MaxPer = 50; % This is the Maximum percentage of aceleration of the speed that a Robot can expirience

sizes = 3; % The size of Robots and person in the representation

ImportOfPerson=0.25; % How the Person matter - This mean how the Robots want to go away from him



RandomRotation=40; % How much Random will Rotate the Robot 1 and Persons
%% Initialize Rotation Matrix in every Robot

for NRt=1:NRobots % Calculate the Position for every robot
      Robots(NRt,6:9)=RotationMatrix(Robots(NRt,5));
end

for NRt=1:NPerson % Culculate the Position for every robot
      Person(NRt,6:9)=RotationMatrix(Person(NRt,5));
end


%% Start the Prosomiosi
for Round=1:500
    Round
    %% Change the Direction of the First Robot Depending on the Person
    
    for RT=1:NPerson % Culculate the Position for every robot
        % Culculate the Distance Between Person and Robot
        Apostasi = sqrt( (Robots(1,1)-Person(RT,1))*(Robots(1,1)-Person(RT,1)) + (Robots(1,2)-Person(RT,2))*(Robots(1,2)-Person(RT,2)) )
        
        
        
        Error = Drp-Apostasi;
        
        
        %============== Person Direction=========================
            % Detect if the direction of person is dengerus for the Robots

            LApos = (Robots(1,1)-Person(RT,1))/(Robots(1,2)-Person(RT,2)); % (L = (y2-y1)/(x2-x1) % But Person(RT,1) = Y % Person(RT,2) = X
            L=-(1/LApos);
        
            b=Person(RT,1)-L*Person(RT,2);
            
            % Now we will find what is the side of Robot and if it is the
            % same with the side of Speed of person the robot need to leave
            % in any other case the robot will not do anything abou the person
        
            XPer = Person(RT,1)+Person(RT,3)*Person(RT,6)+Person(RT,4)*Person(RT,8);
            YPer = Person(RT,2)+Person(RT,3)*Person(RT,7)+Person(RT,4)*Person(RT,9);
    
            PerSide = XPer-YPer*L-b;
            
            RobSide = Robots(1,1)-Robots(1,2)*L-b;
             
             % If the multiplication of both is more than zero this means
             % that they are in the same side either - - or ++ in any other
             % case they have different directions So we don't need to
             % worry about
        
        %============== END Person Direction=========================
        if (Apostasi<Drp && PerSide*RobSide>0) % This means that the Person is really close to the NRt Robot so he needs to change his course
            
            Dx=Robots(1,6)*Robots(1,3); % notes in my Phone First Page
            Dy=Robots(1,7)*Robots(1,3); % We need the direction of the first position
            
            Px=Person(RT,6)*Person(RT,3); % notes in my Phone First Page
            Py=Person(RT,7)*Person(RT,3); % We need the direction of the first position
            
            Pdistance = sqrt(Px*Px+Py*Py);
            
            Px1=Px/Pdistance;
            Py1=Py/Pdistance; % SSSOOOSSS Den fenonte poli logika ta apotelesmata edo
            
            
            
            PerX = Px1*Error*ImportOfPerson % Etsi tou dino parapoli taxitita kai den xero an eiani sosto
            PerY = Py1*Error*ImportOfPerson
            
            DFx=PerX+Dx; % In order to culculate the arrow between them
            DFy=PerY+Dy;
            
            Robots(1,5)=CulcTh(DFx,DFy);
            
            Robots(1,6:9)=RotationMatrix(Robots(1,5));
            %                        keyboard;
        end
    end
    
    
    
    %% Change th and U
     for NRt=2:NRobots % Every Robot find the new Direction depending on the previews Robot
         
         %% Change th
                %% Find the Vecor between next robot and the distance between them
                 Dx1=Robots(NRt-1,6)*Robots(NRt,3); % notes in my Phone First Page
                 Dy1=Robots(NRt-1,7)*Robots(NRt,3); % We need the direction of the first position

                 Dx2=Robots(NRt-1,1)-Robots(NRt,1); % And the direction between the first and second point
                 Dy2=Robots(NRt-1,2)-Robots(NRt,2);


                 DFx=Dx1+Dx2; % In order to culculate the arrow between them
                 DFy=Dy1+Dy2;
          
                 Robots(NRt,5)=CulcTh(DFx,DFy);
                 
                %% Initialize Rotation Matrix in every Robot

                 Robots(NRt,6:9)=RotationMatrix(Robots(NRt,5));
                 
                 
                
                 

        %% Change U
        % U changes depending on the Distance from the above robot. The Robots
        % try to maintain the same distance from the above robot
        
        % Foul Analysis in Phone Notes
         
        % Dx2,Dy2 is the arrow between x1,y1 and x2,y2
        
        Dis = sqrt(Dx2*Dx2+Dy2*Dy2); % Dis = Distance between x1,y1 and x2,y2
      
        PD=Dis-BD;
        
        Upd=PD/T;
        
        Unew=Robots(NRt-1,3)+Upd;
        Uold=Robots(NRt,3);
        
        Persentage=((abs(Uold-Unew)*100)/Uold);
        if (MaxPer<((abs(Uold-Unew)*100)/Uold)) % We don'twant to accelareta the speed of the robot too much
            
            if (Unew-Uold<0) % Gia na katalaba an tha pame pio grigora i pio arga
                Robots(NRt,3)=Uold-((Uold*MaxPer)/100);
            else
                if (Uold<Robots(1,3)/4) % This is the speed of the first robot % This means that if the speed of the Robot is really slow you can speed it up
                    %This is a cheat and it is not correct,
                    %The correct solution is if you use Acceleration (a)
                    Robots(NRt,3)=Robots(1,3)/2; 
                else
                    Robots(NRt,3)=Uold+((Uold*MaxPer)/100);
                end
            end
            
        else % The amount o accelaration is ok
            
            Robots(NRt,3)=Unew;
            
        end
        
        
        %% Find the Vector between (DFx,DFy) and if a Person Walking
             for RT=1:NPerson % Culculate the Position for every robot
                   % Culculate the Distance Between Person and Robot
                   %Apostasi = sqrt( (Robots(NRt,1)-Person(RT,1))*(Robots(NRt,1)-Person(RT,1)) + (Robots(NRt,2)-Person(RT,2))*(Robots(NRt,2)-Person(RT,2)) )
                      
                   Error = Drp-Apostasi;
                   
                    %============== Person Direction=========================
                        % Detect if the direction of person is dengerus for the Robots

                        LApos = (Robots(NRt,1)-Person(RT,1))/(Robots(NRt,2)-Person(RT,2)); % (L = (y2-y1)/(x2-x1) % But Person(RT,1) = Y % Person(RT,2) = X
           
                        L=-(1/LApos);

                        b=Person(RT,1)-L*Person(RT,2);

                        % Now we will find what is the side of Robot and if it is the
                        % same with the side of Speed of person the robot need to leave
                        % in any other case the robot will not do anything abou the person

                        XPer = Person(RT,1)+Person(RT,3)*Person(RT,6)+Person(RT,4)*Person(RT,8);
                        YPer = Person(RT,2)+Person(RT,3)*Person(RT,7)+Person(RT,4)*Person(RT,9);

                        PerSide = XPer-YPer*L-b;

                        RobSide = Robots(NRt,1)-Robots(NRt,2)*L-b;
                        
%                         NRt
%                         Apostasi
%                         PerSide
%                         RobSide
%                         keyboard;
                        
                         % If the multiplication of both is more than zero this means
                         % that they are in the same side either - - or ++ in any other
                         % case they have different directions So we don't need to
                         % worry about

                    %============== END Person Direction=========================

                   if (Apostasi<Drp && PerSide*RobSide>0) % This means that the Person is really close to the NRt Robot so he needs to change his course
                       
                       Dx=Robots(NRt,6)*Robots(NRt,3); % notes in my Phone First Page
                       Dy=Robots(NRt,7)*Robots(NRt,3); % We need the direction of the first position

                       Px=Person(RT,6)*Person(RT,3); % notes in my Phone First Page
                       Py=Person(RT,7)*Person(RT,3); % We need the direction of the first position
            
                       Pdistance = sqrt(Px*Px+Py*Py);
                       
                       Px1=Px/Pdistance; 
                       Py1=Py/Pdistance; % SSSOOOSSS Den fenonte poli logika ta apotelesmata edo
                          
                       
                       
                       PerX = Px1*Error*ImportOfPerson; % Etsi tou dino parapoli taxitita kai den xero an eiani sosto
                       PerY = Py1*Error*ImportOfPerson;
                       
                       if Robots(NRt,3)<0.5
                           DFx=PerX; % In order to culculate the arrow between them
                           DFy=PerY;
                           %Robots(NRt,3)=Pdistance
                       else
                           DFx=PerX+Dx; % In order to culculate the arrow between them
                           DFy=PerY+Dy;
                       end
                       
%                         NRt
%                         PerX
%                         PerY
%                         UU=Robots(NRt,3)
%                         DFx
%                         DFy
% %                         Apostasi
% %                         PerSide
% %                         RobSide
%                         keyboard;
%                        

                       Robots(NRt,5)=CulcTh(DFx,DFy);
                       
                       Robots(NRt,6:9)=RotationMatrix(Robots(NRt,5));
%                        keyboard;
                   end
             end
        
             
        
    
     
     end
     
     
     
     
   
     
     
    %% Culculate the New position of your Robot
    
    for NRt=1:NRobots % Culculate the new Position for every robot
        
        %Ground(round(Robots(NRt,2)),round(Robots(NRt,1)))=0; % Sbini tin palia thesi 
        Ground=DrawPoints(Ground,Robots(NRt,1),Robots(NRt,2),sizes,0);
        Robots(NRt,1)=Robots(NRt,1)+Robots(NRt,3)*Robots(NRt,6)+Robots(NRt,4)*Robots(NRt,8);
        Robots(NRt,2)=Robots(NRt,2)+Robots(NRt,3)*Robots(NRt,7)+Robots(NRt,4)*Robots(NRt,9);
    
        %Ground(round(Robots(NRt,2)),round(Robots(NRt,1)))=255; % Zografizi tin kenouriz thesi
        Ground=DrawPoints(Ground,Robots(NRt,1),Robots(NRt,2),sizes,255);
    end
    for RT=1:NPerson % Culculate the new Position for every robot
        
        %Ground(round(Person(RT,2)),round(Person(RT,1)))=0; % Sbini tin palia thesi 
        Ground=DrawPoints(Ground,Person(RT,1),Person(RT,2),sizes,0);
        Person(RT,1)=Person(RT,1)+Person(RT,3)*Person(RT,6)+Person(RT,4)*Person(RT,8);
        Person(RT,2)=Person(RT,2)+Person(RT,3)*Person(RT,7)+Person(RT,4)*Person(RT,9);
    
        %Ground(round(Person(RT,2)),round(Person(RT,1)))=140; % Zografizi tin kenouriz thesi
        Ground=DrawPoints(Ground,Person(RT,1),Person(RT,2),sizes,140);
    end
    %Robots
    
    
    %% Saw Results
    
    
    imagesc(Ground);
    pause(0.5);
    
%     keyboard;

    %% Change the Direction of the person and First Robot
    
    Robots(1,5)=Robots(1,5)+(rand()*RandomRotation-RandomRotation/2);
    Robots(1,6:9)=RotationMatrix(Robots(1,5));
    
     for RT=1:NPerson % Culculate the new Position for every robot
         
         
         Person(RT,5)=Person(RT,5)+(rand()*RandomRotation-RandomRotation/2);
         Person(RT,6:9)=RotationMatrix(Person(RT,5));
     end
    
end

