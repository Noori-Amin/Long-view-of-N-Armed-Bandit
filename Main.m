clc
clear all
close all
num_state(1)=1;
% Q_table=zeros([5 5])
reward(1)=0;
Q_table=rand(5)
epsilon=0.5;
alpha=0.1;
days=5000;
Total_reward=zeros(1,days);
for i=1:days
    
    for j=1:10
        num_action(j)=epsilon_greedy(Q_table,num_state(j),epsilon);
        reward(j+1)=reward_function(num_state(j),num_action(j));
%         Q_table(num_state,num_action)=Q_table(num_state,num_action)...
%             +alpha*(reward-Q_table(num_state,num_action));
        num_state(j+1)=num_action(j);
        Total_reward(i)=Total_reward(i)+reward(j);
    end
    epsilon=epsilon*0.99;
    for jj=1:10
        
        Return=Total_reward(i);
        Return=Return-reward(jj)
        Q_table(num_state(jj),num_action(jj))=Q_table(num_state(jj),num_action(jj))...
            +alpha*(Return-Q_table(num_state(jj),num_action(jj)));
    end
end
figure(1)
plot(Total_reward)
% test
num_state=1;
for j=1:10
        num_action=epsilon_greedy(Q_table,num_state,epsilon);
        reward=reward_function(num_state,num_action);
%         Q_table(num_state,num_action)=Q_table(num_state,num_action)...
%             +alpha*(reward-Q_table(num_state,num_action));
        num_state=num_action;
        Total_reward(i)=Total_reward(i)+reward;
    end