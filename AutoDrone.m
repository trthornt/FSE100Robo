clear; clc;
addpath('E:\LabsLinear\EV3');
javaclasspath('E:\LabsLinear\EV3');

brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5');
brick.playTone(100,800,500);
v=brick.GetBattVoltage();
disp('Voltage: ');
disp(v);
go=true;
% Uses Lock-it Robot
% Left wheel: 'A'
% Right wheel: 'B'
% Perform this action 3 times.
while go==true
    touch1 = brick.TouchPressed(1);
    touch2 = brick.TouchPressed(2);
    distance = brick.UltrasonicDist(4);
    % Set left wheel and right wheel motor power to +25 (drive forward).
    if(touch1==0 && touch2==0)
        brick.MoveMotor('A',-100);
        brick.MoveMotor('B',-100);
        pause(3);
        brick.StopMotor('A');
        brick.StopMotor('B');
    elseif(touch1==1 && touch2==0)
        brick.MoveMotor('A',100);
        brick.MoveMotor('B',100);
        pause(1)
        brick.MoveMotor('A',-100);
        brick.MoveMotor('B',100);
        pause(2);
        brick.StopMotor('A');
        brick.StopMotor('B');
    elseif(touch1==0 && touch2==1)
        brick.MoveMotor('A',100);
        brick.MoveMotor('B',100);
        pause(1)
        brick.MoveMotor('A',100);
        brick.MoveMotor('B',-100);
        pause(2);
        brick.StopMotor('A');
        brick.StopMotor('B');
     elseif(touch1==1 && touch2==1)
        brick.MoveMotor('A',100);
        brick.MoveMotor('B',100);
        pause(1)
        brick.MoveMotor('A',100);
        brick.MoveMotor('B',-100);
        pause(2);
        brick.StopMotor('A');
        brick.StopMotor('B');   
    end
%     switch touch1
%         case (touch1==0 && touch2==0)
%             brick.MoveMotor('A',-100);
%             brick.MoveMotor('B',-100);
%             pause(2)
%         case (touch1==1 && touch2==0)
%             brick.MoveMotor('A',100);
%             brick.MoveMotor('B',100);
%             pause(1)
%             brick.MoveMotor('A',-100);
%             brick.MoveMotor('B',100);
%             pause(2);
%             brick.StopMotor('A');
%             brick.StopMotor('B');
%         case (touch1==0 && touch2==1)
%             brick.MoveMotor('A',100);
%             brick.MoveMotor('B',100);
%             pause(1)
%             brick.MoveMotor('A',-100);
%             brick.MoveMotor('B',100);
%             pause(2);
%             brick.StopMotor('A');
%             brick.StopMotor('B');
%         case (touch1==1 && touch2==1)
%             brick.MoveMotor('A',100);
%             brick.MoveMotor('B',100);
%             pause(1)
%             brick.MoveMotor('A',-100);
%             brick.MoveMotor('B',100);
%             pause(2);
%             brick.StopMotor('A');
%             brick.StopMotor('B');
%     end
end