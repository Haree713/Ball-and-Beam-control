%defining the transfer function; 
g1=tf([0.7],[1 0 0]);
%analysis;
step(g1);

%design to a marginally stable state by a PID controller
Kp = 1;
C = pid(Kp);
sys_cl=feedback(g1,1);
step(sys_cl)
axis([0 70 0 2])

%designing a PD controller
Kp = 10;
Kd = 10;
C = pid(Kp,0,Kd);
sys_cl=feedback(g1*C,1);
step(sys_cl)

bode(g1*C)
margin(g1*C)

g4=tf([3.005 1],[1.33 1])  
g2=tf([7 7],[1 0 0])
g5=g4*g2
bode(g5)

g6=feedback(g5,1)
step(g6)
rlocus(g5)




