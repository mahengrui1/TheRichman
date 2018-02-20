clear
%Game 'The rich man'(天下富翁、梦幻富翁) uses 3 dices to add up to
% determine usersactions. Find the strategy in multiple likes in weights 
%in many branches.
%Example:input '3 6 7 9 12 14 18;3 6 7 9 12 14 17 18;3 6 7 9 11 12 13 14 
%15;3 7 8 9 10 12 14 15 17 18;3 7 8 9 10 12 14 15 ;3 7 8 9 10 15;
%3 7 8 9 10 15 18' then input '16,16,32,16,16,16,16'
%then output '
%strT =
%    0.2500    0.5486    0.5590
%bestdice =
%     3
%Warning: endless. Use Ctrl+C.
%Notice:When weights are equal, you can pass the ';' and pass weight-input
%and the bestdice will be right.
%Henry, BNU, 20180220.
dice1=ones(1,6)/(1*6);% The code of prob
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

while 1%The code of weight and strategy.
    strT=zeros(1,3);
    mess='like step number. if have branches, split as '';''.\n>>';
    mul_s=input(mess,'s');
    mul_spl=strfind(mul_s,';');
    bra=length(mul_spl)+1;%branches
    if mul_spl%have bra
        mul_ws=input('And input weight in order.\n>>','s');
        eval(['mul_w=[',mul_ws,'];'])
        for The_bra=1:bra
            if The_bra==1
                eval(['mul=[',mul_s(1:mul_spl(1)-1),'];'])
            elseif The_bra==bra
                eval(['mul=[',mul_s(mul_spl(end)+1:end),'];'])
            else
                eval(['mul=[',mul_s(mul_spl(The_bra-1)+1: ...
                    mul_spl(The_bra)-1),'];'])
            end
            len=length(mul);
            Smul_w=sum(mul_w);
            for likes=1:len%calculate strategy
                strT(1)=strT(1)+prob(1,mul(likes))*mul_w(The_bra)/Smul_w;
                strT(2)=strT(2)+prob(2,mul(likes))*mul_w(The_bra)/Smul_w;
                strT(3)=strT(3)+prob(3,mul(likes))*mul_w(The_bra)/Smul_w;
            end
        end
    else%haven't bra
        eval(['mul=[',mul_s,'];'])
        len=length(mul);
        for likes=1:len
            strT(1)=strT(1)+prob(1,mul(likes));
            strT(2)=strT(2)+prob(2,mul(likes));
            strT(3)=strT(3)+prob(3,mul(likes));
        end   
    end
    strT
    [~,bestdice]=max(strT)
end