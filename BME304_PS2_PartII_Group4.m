% Import dataset from part 1
PS_P1 = dataset('File', 'BME304_PS2_PartI_Group4.txt');

%Initialize arrays
Positive = PS_P1;
Negative = PS_P1;

% Separate dataset into positive and negative Log2Ratio
for ii = numel(PS_P1.Log2Ratio):-1:1
    if PS_P1.Log2Ratio(ii)>=0
        Negative(ii, :) = [];
    elseif PS_P1.Log2Ratio(ii)<=0
        Positive(ii, :) = [];
    end
end 

%% 
% Remove genes with p value > 0.05 from negative dataset
for n = numel(Negative.p_value):-1:1
    if Negative.p_value(n)>0.05
        Negative(n, :) = [];
    end
end
% Remove genes with Log2Ratio < 1 from negative dataset
for nn = numel(Negative.Log2Ratio):-1:1
        if abs(Negative.Log2Ratio(nn))<1
            Negative(nn, :) = [];
        end
end

% Remove genes with p value > 0.05 from positive dataset       
for p = numel(Positive.p_value):-1:1
    if Positive.p_value(p)>0.05
        Positive(p, :) = [];
    end
end
% Remove genes with Log2Ratio < 1 from positive dataset
for pp = numel(Positive.Log2Ratio):-1:1
    if abs(Positive.Log2Ratio(pp))<1
        Positive(pp, :) = [];
    end
end

% Export completed negative and positive datasets as .txt files
export(Negative, 'FILE', 'BME304_PS2_PartII_Neg_Group4.txt'); 
export(Positive, 'FILE', 'BME304_PS2_PartII_Pos_Group4.txt'); 


