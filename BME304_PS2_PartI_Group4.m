% Import datasets. 
Problem_Set = dataset('File', 'ProblemSet2b_data_set.txt');
OGS = dataset('File', 'OFFICIAL_GENE_SYMBOL.txt'); 
EGI = dataset('File', 'ENTREZ_GENE_ID.txt'); 

% Change the name of variables for OGS and EGI to the correct names
OGS = set(OGS, 'VarNames', {'Gene ID', 'OfficialGeneSymbol', 'Species', 'GeneName'});
EGI = set(EGI, 'VarNames', {'Gene ID', 'EntrezGeneID', 'Species', 'GeneName'});

% Join datasets. First create an intermediate dataset and then join that
% intermediate with the ProblemSet2b_data_set file
Intermediate = join(EGI, OGS);
Full_Dataset = join(Intermediate, Problem_Set, 'type', 'rightouter', 'mergekeys', true); 

% Delete empty rows 
Final = rmmissing(Full_Dataset);

% Export the final table into a new text file
export(Final, 'File', 'BME304_PS2_PartI_Group4.txt'); 
