clear
%Game 'The rich man'(天下富翁、梦幻富翁) uses 3 dices to add up to
% determine usersactions. Find the strategy in multiple likes.
%Example: input '4,5,9,11,15' then output '
%str =
%    0.3333    0.3611    0.3287
%bestdice =
%     2
%Warning: endless. Use Ctrl+C.
%Henry, BNU, 20180220.
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

while 1
str=zeros(1,3);
mul_s=input('like step number\n>>','s');
eval(['mul=[',mul_s,'];'])
len=length(mul);

for likes=1:len
    str(1)=str(1)+prob(1,mul(likes));
    str(2)=str(2)+prob(2,mul(likes));
    str(3)=str(3)+prob(3,mul(likes));
end
str
[~,bestdice]=max(str)
end
%clear a ans dice1 dice2 dice3 i1 i21 i22 i31 i32 i33