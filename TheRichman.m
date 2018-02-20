clear
%Game 'The rich man'(天下富翁、梦幻富翁) uses 3 dices to add up to
% determine usersactions. Find the strategy. Henry, BNU, 20180220.
dice1=ones(1,6)/(1*6);
dice2=ones(6,6)/(6*6);
dice3=ones(6,6,6)/(6*6*6);
prob=zeros(3,18);
for i1=1:6
    prob(1,i1)=dice1(1,i1);
end
for i21=1:6
    for i22=1:6
        prob(2,i21+i22)=prob(2,i21+i22)+dice2(i21,i22);
    end
end
for i31=1:6
    for i32=1:6
        for i33=1:6
            prob(3,i31+i32+i33)=prob(3,i31+i32+i33)+dice3(i31,i32,i33);
        end
    end
end
[a,str]=max(prob);
clear a ans dice1 dice2 dice3 i1 i21 i22 i31 i32 i33