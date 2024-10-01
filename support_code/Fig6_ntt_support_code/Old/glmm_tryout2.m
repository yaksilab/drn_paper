
%% load tables for glmm

load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
     'Behaviour\Larvae\glme_T1.mat'])
load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
     'Behaviour\Larvae\AllGlmeData.mat'])
 
 %% fit glme for the table
GlmmTable_MT.Genotype = char(GlmmTable_MT.Genotype);
GlmmTable_MT(ismember(GlmmTable_MT.Genotype(1:end,:),'eaat2a_Exc'),:) = [];

glme_MT = fitglme(GlmmTable_MT,[... % for the binary response
           'BurstBinary ~ 1 + '...
           'Genotype * Time + '...  % genotype needs to be in characters, not categorical
           'Genotype * TimeSquared + '...
           '(1|ISI) +'...]);
           '(1|Location) '...
           ' '],'Distribution','Poisson',...
           'Link','log','FitMethod','Laplace',...
           'DummyVarCoding','effects');
       
%%

lightsInfoForGlmm

% make an array for time!

flds2= fields(results.timeLight);

for j=1:length(flds2)
    for i=1:15
    A = reshape(results.timeLight.(flds2{j,1}){i,2},...
        [length(results.timeLight.(flds2{j,1}){i,2})*35 1]);
    end 
end 



%% neural data

PTZ_neural_ONpeak.Group(1)=num2str (PTZ_neural_ONpeak.Group);
strcmp(PTZ_neural_ONpeak.Group,1)

glme_neuralDepol_Group = fitglme(PTZ_neural_ONpeak(A,:),['DFF ~ 1+ '...
                       'Group'],...
                       'Distribution', 'Normal');                  
                   
glme_neuralDepol_T2 = fitglme(table_neuralData,[...
                       'Depol ~ 1+ '...
                       'Group*Time +'...
                       'Group*Time^2 +'...
                       '(1|Fish) +'...
                       '(1|Brainregion) '
                       ]);                   

                   A= randi([1 12960],1,3240*3);
B=[1:12960];
B(A)=[];
                   
                  
glemtable_S_short  = PTZ_neural_ONpeakCopy(B,:);
glemtable_S_short2 = PTZ_neural_ONpeakCopy(3240*3:end,:);

mu_fit=fitted (glme_neuralDepol_T1);    

predictedY = predict(glme_neuralDepol_T1,glemtable_S_short); 
                   
                   
                   
                   
                   
                   
                   
                   
                   