
%% Semantix Cientista de dados

% Import data as cellarray in matlab using the matlab import tool

%% 1st question in ecxel

%% 2nd question 
% Import data as cellarray

sz=size(bankfull);
contatos=zeros(sz(1,1),1);
sucesso=zeros(sz(1,1),1);
yes='"yes"';
for i=1:sz(1,1)
    contatos(i,1)=bankfull{i,13};
    com=strcmp(bankfull(i,17),yes);
    if com==1
        sucesso(i,1)=1;
    else sucesso(i,1)=0;
    end
end
suc=sum(sucesso);
fal=length(sucesso)-suc;

histsuc=zeros(suc,1);
histfal=zeros(fal,1);
s=1;
f=1;
for i=1:sz(1,1)
    if sucesso(i,1)==1
        histsuc(s,1)=contatos(i,1);
        s=s+1;
    else histfal(f,1)=contatos(i,1);
        f=f+1;
    end
end

hists=mean(histsuc);
histf=mean(histfal);

figure, hist(histsuc,50),title('sucesso')
figure, hist(histfal,100),title('falha')

%% 3rd question

% definição dos vectores para essa parte da análise
contatos3=zeros(sz(1,1),1);
sucesso3=zeros(sz(1,1),1);
unk='"unknown"';
cont3=1;
for i=1:sz(1,1)
    com=strcmp(bankfull(i,9),unk);
    if com==0 && sucesso(i,1)==1
        sucesso3(cont3,1)=sucesso(i,1);
        contatos3(cont3,1)=bankfull{i,13};
        cont3=cont3+1;
    else
    end
end
sucesso3a=sucesso3(1:cont3-1,1);
contatos3a=contatos3(1:cont3-1,1);

figure, hist(contatos3a,29),title('sucesso ligacoes')

% Número médio de ligações

meanlig=mean(contatos3a);

%% 4th question

% definição dos vectores para essa parte da análise
unk4=zeros(sz(1,1),1);
oth4=zeros(sz(1,1),1);
fai4=zeros(sz(1,1),1);
suc4=zeros(sz(1,1),1);
unk='"unknown"';
oth='"other"';
fai='"failure"';
contu4=1;
conto4=1;
contf4=1;
conts4=1;
for i=1:sz(1,1)
    com1=strcmp(bankfull(i,16),unk);
    com2=strcmp(bankfull(i,16),oth);
    com3=strcmp(bankfull(i,16),fai);
    if com1==1 
        unk4(contu4,1)=sucesso(i,1);
        contu4=contu4+1;
    else if com2==1 
            oth4(conto4,1)=sucesso(i,1);
            conto4=conto4+1;
        else if com3==1 
            fai4(contf4,1)=sucesso(i,1);
            contf4=contf4+1;
            else suc4(conts4,1)=sucesso(i,1);
                conts4=conts4+1;
            end
        end
    end
end
p1=sum(unk4)/(contu4-1);
p2=sum(oth4)/(conto4-1);
p3=sum(fai4)/(contf4-1);
p4=sum(suc4)/(conts4-1);
total=(sum(unk4)+sum(oth4)+sum(fai4)+sum(suc4))/(contu4+conto4+contf4+conts4-4);
fprintf('percentage of success for "unknown" %f\n', p1);
fprintf('percentage of success for "other" %f\n', p2);
fprintf('percentage of success for "fail" %f\n', p3);
fprintf('percentage of success for "success" %f\n', p4);
fprintf('percentage of success%f\n', total);
pp1=p1*(contu4-1)/45211;
pp2=p2*(conto4-1)/45211;
pp3=p3*(contf4-1)/45211;
pp4=p4*(conts4-1)/45211;

%% 6th question

% Definição das variaveis para essa parte da análise
cont6=1;
cont26=1;
age=zeros(sz(1,1),1);
aget=zeros(sz(1,1),1);
default=zeros(sz(1,1),1);
defaultt=zeros(sz(1,1),1);
balance=zeros(sz(1,1),1);
balancet=zeros(sz(1,1),1);
loan=zeros(sz(1,1),1);
loant=zeros(sz(1,1),1);
for i=1:sz(1,1)
    com=strcmp(bankfull(i,7),yes);
    coml=strcmp(bankfull(i,8),yes);
    comd=strcmp(bankfull(i,5),yes);
    aget(i,1)=bankfull{i,1};
    if coml==1
        loant(i,1)=1;
    else loant(i,1)=0;
    end
    balancet(i,1)=bankfull{i,6};
    if comd==1
            defaultt(i,1)=1;
    else defaultt(i,1)=0;
    end
    if com==1 
        age(cont6,1)=bankfull{i,1};
        balance(cont6,1)=balancet(i,1);
        loan(cont6,1)=loant(i,1);
        default(cont6,1)=defaultt(i,1);
        cont6=cont6+1;
    end
end
cont6=cont6-1;
age=age(1:cont6,1);
default=default(1:cont6,1);
balance=balance(1:cont6,1);
loan=loan(1:cont6,1);
% 
figure, hist(age,29),title('Emprestimo imobiliario vs idade')
figure, hist(aget,29),title('Amostra vs idade')
figure, hist(default,29),title('Emprestimo imobiliario vs default')
figure, hist(defaultt,29),title('Amostra vs default')
figure, hist(balance,29),title('Emprestimo imobiliario vs balance')
figure, hist(balancet,39),title('Amostra vs balance')
figure, hist(loan,29),title('Emprestimo imobiliario vs emprestimo pessoal')
figure, hist(loant,29),title('Amostra vs emprestimo pessoal')

% Definição das variaveis para essa parte da análise
divo='"divorced"';
sing='"single"';
marr='"married"';
prima='"primary"';
seco='"secondary"';
terc='"tertiary"';
unkn='"unknown"';
cont6=1;
tr1='"admin."';
tr2='"unknown"';
tr3='"unemployed"';
tr4='"management"';
tr5='"housemaid"';
tr6='"entrepreneur"';
tr7='"student"';
tr8='"blue-collar"';
tr9='"self-employed"';
tr10='"retired"';
tr11='"technician"';
tr12='"services"';

marital=zeros(sz(1,1),1);
maritalt=zeros(sz(1,1),1);
educa=zeros(sz(1,1),1);
educat=zeros(sz(1,1),1);
traba=zeros(sz(1,1),1);
trabat=zeros(sz(1,1),1);
for i=1:sz(1,1)
    com=strcmp(bankfull(i,7),yes);
    mar=bankfull{i,3};
    educ=bankfull{i,4};
    trab=bankfull{i,2};
    switch mar
        case sing
            maritalt(i,1)=-1;
        case divo
            maritalt(i,1)=0;
        case marr
            maritalt(i,1)=1;
    end
    switch educ
        case unkn
            educat(i,1)=0;
        case prima
            educat(i,1)=1;
        case seco
            educat(i,1)=2;
        case terc
            educat(i,1)=3;
    end
    switch trab
        case tr1
            trabat(i,1)=1;
        case tr2
            trabat(i,1)=2;
        case tr3
            trabat(i,1)=3;
        case tr4
            trabat(i,1)=4;
        case tr5
            trabat(i,1)=5;
        case tr6
            trabat(i,1)=6;
        case tr7
            trabat(i,1)=7;
        case tr8
            trabat(i,1)=8;
        case tr9
            trabat(i,1)=9;
        case tr10
            trabat(i,1)=10;
        case tr11
            trabat(i,1)=11;
        case tr12
            trabat(i,1)=12;
    end
    if com==1 
        marital(cont6,1)=maritalt(i,1);
        educa(cont6,1)=educat(i,1);
        traba(cont6,1)=trabat(i,1);
        cont6=cont6+1;
    end
end
cont6=cont6-1;
marital=marital(1:cont6,1);
educa=educa(1:cont6,1);
traba=traba(1:cont6,1);
figure, hist(marital,3),title('Emprestimo imobiliario vs vs estado civil')
figure, hist(maritalt,3),title('Amostra vs estado civil')
figure, hist(educa,4),title('Emprestimo imobiliario vs educacao')
figure, hist(educat,4),title('Amostra vs educacao')
figure, hist(traba,12),title('Emprestimo imobiliario vs emprego')
figure, hist(trabat,12),title('Amostra vs emprego')
