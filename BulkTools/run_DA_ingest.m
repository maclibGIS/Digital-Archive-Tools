

%% Processing GermanyHollandPoland_25k
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\GermanyHollandPoland_25k\';
%%% Step 1: Download a tab-separated spreadsheet (.tsv) of the appropriate tab in
%%% the metadata Google Sheet (https://docs.google.com/spreadsheets/d/1xmSuWdqUQ0a9RNCi2DErNO1bBcK6J06ps0moyYkg4Qk)
%%% to the top-level folder for this collection (as indicated by top_path).

%%% Step 2: Process the metadata Sheet with DA_metadata_to_mods, to create separate MODS xml files for each row in the sheet
%%% Second argument is the name of the downloaded .tsv metadata file (step 1)
%%% Function will create /MODS/ folder in the top-level directory (if necessary), 
%%% and generate separate .xml files for each row in the spreadsheet. Files are placed in the /MODS/ directory.
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - UofA_WW2_GermanyHollandPoland_25k_topos.tsv');

%%% Step 3: Run DA_prepare_ingest to identify pairs of .tiff & .xml files,
%%% and move to the /ToIngest/ folder. 
%%% Corresponding pairs are moved to the /ToIngest/ folder. 
%%% Any .tiff files without corresponding .xml files will remain in the
%%% top-level folder. A list of unmatched .tiffs is created in the
%%% top-level folder as 'unmatched_tiffs.csv'
%%% This function also creates log files in /logs/
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest('H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\GermanyHollandPoland_25k');

%%% Step 3b (Manual): Copy the contents of \ToIngest\ to the new directory (/ToBeProcessed/<macrepo>/) on the shared network folder
%%% Step 3c (Manual): Once copying to the shared network folder has completed, move the copied items from \ToIngest\ to \ToIngest\Queued\
%%% Step 3d (Manual): Notify Dorin to auto-process the items. Await confirmation that it is completed.

%%% Step 4: Move the ingested objects into the /Ingested folder. 
%%% The function DA_move_ingested.m moves verified ingested files from the \ToIngest\Queued\
%%% directory to the \Ingested\ directory. 
%%% The input file for this function is a single-column .csv file created
%%% from the fedora RIQS and formatted using this sheet: https://docs.google.com/spreadsheets/d/1GbFjUKtuc8bU2qK5CkAmdaKKlHDSoskw6uaInNMD6Hg/edit#gid=1862350458
%%% Notes on Fedora RIQS commands: https://github.com/jasonbrodeur/Fedora-SPARQL/blob/master/fedora-sparql-cookbook.md
%%% RIQS http://dcs1.mcmaster.ca/fedora/risearch
%%% NOTE that the input file is assumed to exist in \Ingested\
% DA_move_ingested('H:\Digitization_Projects\WWII_Topographic_Maps\GermanyHollandPoland_25k\','ingested.csv')
cd('D:\Local\Digital-Archive-Tools\BulkTools')
macrepo_id = DA_check_ingested('H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\GermanyHollandPoland_25k\','ingested_all.csv');

%%% Step 5: Inspect the ingested objects in the Digital Archive

%%% > If an object doesn't pass inspection (or doesn't exist in the digital archive). The inspector makes a note (e.g. in Trello), and the .tiff and .xml of the offending item are moved to the /ToFix/ folder
%% Processing UofA Italy 1:25k
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA WWII_Italy_Topos_25k\';
%%% Step 1: Download a tab-separated spreadsheet (.tsv) of the appropriate tab in
%%% the metadata Google Sheet (https://docs.google.com/spreadsheets/d/1xmSuWdqUQ0a9RNCi2DErNO1bBcK6J06ps0moyYkg4Qk)
%%% to the top-level folder for this collection (as indicated by top_path).

%%% Step 2: Process the metadata Sheet with DA_metadata_to_mods, to create separate MODS xml files for each row in the sheet
%%% Second argument is the name of the downloaded .tsv metadata file (step 1)
%%% Function will create /MODS/ folder in the top-level directory (if necessary), 
%%% and generate separate .xml files for each row in the spreadsheet. Files are placed in the /MODS/ directory.
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - UofA_WW2_Italy_25k_topos.tsv');

%%% Step 3: Run DA_prepare_ingest to identify pairs of .tiff & .xml files,
%%% and move to the /ToIngest/ folder. 
%%% Corresponding pairs are moved to the /ToIngest/ folder. 
%%% Any .tiff files without corresponding .xml files will remain in the
%%% top-level folder. A list of unmatched .tiffs is created in the
%%% top-level folder as 'unmatched_tiffs.csv'
%%% This function also creates log files in /logs/
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

%%% Step 3b (Manual): Copy the contents of \ToIngest\ to the new directory (/ToBeProcessed/<macrepo>/) on the shared network folder
%%% Step 3c (Manual): Once copying to the shared network folder has completed, move the copied items from \ToIngest\ to \ToIngest\Queued\
%%% Step 3d (Manual): Notify Dorin to auto-process the items. Await confirmation that it is completed.

%%% Step 4: Move the ingested objects into the /Ingested folder. 
%%% The function DA_move_ingested.m moves verified ingested files from the \ToIngest\Queued\
%%% directory to the \Ingested\ directory. 
%%% The input file for this function is a single-column .csv file created
%%% from the fedora RIQS and formatted using this sheet: https://docs.google.com/spreadsheets/d/1GbFjUKtuc8bU2qK5CkAmdaKKlHDSoskw6uaInNMD6Hg/edit#gid=1862350458
%%% Notes on Fedora RIQS commands: https://github.com/jasonbrodeur/Fedora-SPARQL/blob/master/fedora-sparql-cookbook.md
%%% RIQS http://dcs1.mcmaster.ca/fedora/risearch
%%% NOTE that the input file is assumed to exist in \Ingested\
% DA_move_ingested('H:\Digitization_Projects\WWII_Topographic_Maps\GermanyHollandPoland_25k\','ingested.csv')
DA_check_ingested(top_path,'ingested_all.csv')

%%% Step 5: Inspect the ingested objects in the Digital Archive

%%% > If an object doesn't pass inspection (or doesn't exist in the digital archive). The inspector makes a note (e.g. in Trello), and the .tiff and .xml of the offending item are moved to the /ToFix/ folder

%% Processing OCUL Topos 1:25k
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\OCUL_HTDP_25K\';
%%% Step 1: Download a tab-separated spreadsheet (.tsv) of the appropriate tab in
%%% the metadata Google Sheet (https://docs.google.com/spreadsheets/d/1xmSuWdqUQ0a9RNCi2DErNO1bBcK6J06ps0moyYkg4Qk)
%%% to the top-level folder for this collection (as indicated by top_path).

%%% Step 2: Process the metadata Sheet with DA_metadata_to_mods, to create separate MODS xml files for each row in the sheet
%%% Second argument is the name of the downloaded .tsv metadata file (step 1)
%%% Function will create /MODS/ folder in the top-level directory (if necessary), 
%%% and generate separate .xml files for each row in the spreadsheet. Files are placed in the /MODS/ directory.
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - OCUL_HTDP_25k.tsv');

%%% Step 3: Run DA_prepare_ingest to identify pairs of .tiff & .xml files,
%%% and move to the /ToIngest/ folder. 
%%% Corresponding pairs are moved to the /ToIngest/ folder. 
%%% Any .tiff files without corresponding .xml files will remain in the
%%% top-level folder. A list of unmatched .tiffs is created in the
%%% top-level folder as 'unmatched_tiffs.csv'
%%% This function also creates log files in /logs/
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

%%% Step 3b (Manual): Copy the contents of \ToIngest\ to the new directory (/ToBeProcessed/<macrepo>/) on the shared network folder
%%% Step 3c (Manual): Once copying to the shared network folder has completed, move the copied items from \ToIngest\ to \ToIngest\Queued\
%%% Step 3d (Manual): Notify Dorin to auto-process the items. Await confirmation that it is completed.

%%% Step 4: Move the ingested objects into the /Ingested folder. 
%%% The function DA_move_ingested.m moves verified ingested files from the \ToIngest\Queued\
%%% directory to the \Ingested\ directory. 
%%% The input file for this function is a single-column .csv file created
%%% from the fedora RIQS and formatted using this sheet: https://docs.google.com/spreadsheets/d/1GbFjUKtuc8bU2qK5CkAmdaKKlHDSoskw6uaInNMD6Hg/edit#gid=1862350458
%%% Notes on Fedora RIQS commands: https://github.com/jasonbrodeur/Fedora-SPARQL/blob/master/fedora-sparql-cookbook.md
%%% RIQS http://dcs1.mcmaster.ca/fedora/risearch
%%% NOTE that the input file is assumed to exist in \Ingested\
% DA_move_ingested('H:\Digitization_Projects\WWII_Topographic_Maps\GermanyHollandPoland_25k\','ingested.csv')
DA_check_ingested(top_path,'ingested_all.csv')

%%% Step 5: Inspect the ingested objects in the Digital Archive

%%% > If an object doesn't pass inspection (or doesn't exist in the digital archive). The inspector makes a note (e.g. in Trello), and the .tiff and .xml of the offending item are moved to the /ToFix/ folder

%%% Step 6: Prepare goereferencing items for ingest
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_make_georef_matls(top_path,'ingested_all.csv')

%% Processing OCUL Topos 1:63k
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\OCUL_HTDP_63K\';
%%% Step 1: Download a tab-separated spreadsheet (.tsv) of the appropriate tab in
%%% the metadata Google Sheet (https://docs.google.com/spreadsheets/d/1xmSuWdqUQ0a9RNCi2DErNO1bBcK6J06ps0moyYkg4Qk)
%%% to the top-level folder for this collection (as indicated by top_path).

%%% Step 2: Process the metadata Sheet with DA_metadata_to_mods, to create separate MODS xml files for each row in the sheet
%%% Second argument is the name of the downloaded .tsv metadata file (step 1)
%%% Function will create /MODS/ folder in the top-level directory (if necessary), 
%%% and generate separate .xml files for each row in the spreadsheet. Files are placed in the /MODS/ directory.
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - OCUL_HTDP_63k.tsv');

%%% Step 3: Run DA_prepare_ingest to identify pairs of .tiff & .xml files,
%%% and move to the /ToIngest/ folder. 
%%% Corresponding pairs are moved to the /ToIngest/ folder. 
%%% Any .tiff files without corresponding .xml files will remain in the
%%% top-level folder. A list of unmatched .tiffs is created in the
%%% top-level folder as 'unmatched_tiffs.csv'
%%% This function also creates log files in /logs/
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

%%% Step 3b (Manual): Copy the contents of \ToIngest\ to the new directory (/ToBeProcessed/<macrepo>/) on the shared network folder
%%% Step 3c (Manual): Once copying to the shared network folder has completed, move the copied items from \ToIngest\ to \ToIngest\Queued\
%%% Step 3d (Manual): Notify Dorin to auto-process the items. Await confirmation that it is completed.

%%% Step 4: Move the ingested objects into the /Ingested folder. 
%%% The function DA_move_ingested.m moves verified ingested files from the \ToIngest\Queued\
%%% directory to the \Ingested\ directory. 
%%% The input file for this function is a single-column .csv file created
%%% from the fedora RIQS and formatted using this sheet: https://docs.google.com/spreadsheets/d/1GbFjUKtuc8bU2qK5CkAmdaKKlHDSoskw6uaInNMD6Hg/edit#gid=1862350458
%%% Notes on Fedora RIQS commands: https://github.com/jasonbrodeur/Fedora-SPARQL/blob/master/fedora-sparql-cookbook.md
%%% RIQS http://dcs1.mcmaster.ca/fedora/risearch
%%% NOTE that the input file is assumed to exist in \Ingested\
% DA_move_ingested('H:\Digitization_Projects\WWII_Topographic_Maps\GermanyHollandPoland_25k\','ingested.csv')
DA_check_ingested(top_path,'ingested_all.csv')

%%% Step 5: Inspect the ingested objects in the Digital Archive

%%% > If an object doesn't pass inspection (or doesn't exist in the digital archive). The inspector makes a note (e.g. in Trello), and the .tiff and .xml of the offending item are moved to the /ToFix/ folder

%%% Step 6: Prepare goereferencing items for ingest
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_make_georef_matls(top_path,'ingested_all.csv')
%%% Copy contents of \ToIngest_Georef to dcs.lib.mcmaster.ca\GCP and move to Queued

%% WW2_Geologic_France_80k 
top_path = 'H:\Digitization_Projects\WWII_Geologic_Maps\Geologic_France_80k\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - WW2_Geologic_France_80k.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Geologic_Maps\Geologic_France_80k\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% WW2_France_50k_GSGS4250  
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\France_Belgium_Holland\France_50k_GSGS4250\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - WW2_France_50k_GSGS4250.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\France_Belgium_Holland\France_50k_GSGS4250\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% WW2_France_50k_GSGS4040    
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\France_Belgium_Holland\France_50k_GSGS4040\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - WW2_France_50k_GSGS4040.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\France_Belgium_Holland\France_50k_GSGS4040\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% UofA_WW2_Crete_50k_topos     
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA_WW2_Crete_50k\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - UofA_WW2_Crete_50k_topos.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA_WW2_Crete_50k';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% WW2_CityPlans_Japan      
top_path = 'H:\Digitization_Projects\WWII_CityPlans\CityPlans_Japan\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - WW2_CityPlans_Japan.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_CityPlans\CityPlans_Japan\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% UofA_WW2_USSR_100k_topos     
top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA_USSR_100k\';

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - UofA_WW2_Crete_50k_topos.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA_USSR_100k\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% Hamilton Aerial Photos - 1969    
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\Air_Photos\AirPhotos_1969_Hamilton\';
% cd(top_path)
jjb_check_dirs([top_path 'MODS'],1);
jjb_check_dirs([top_path 'Ingested'],1);
jjb_check_dirs([top_path 'ToFix'],1);
jjb_check_dirs([top_path 'ToIngest'],1);
jjb_check_dirs([top_path 'logs'],1);

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - AirPhotos_Hamilton_1969.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\U_of_Alberta\UofA_USSR_100k\';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')

%% 2020-10-20 Scans; odds and ends   
cd('D:\Local\Digital-Archive-Tools\BulkTools')
top_path = 'H:\Digitization_Projects\2020-10-20\';
% cd(top_path)
jjb_check_dirs([top_path 'MODS'],1);
jjb_check_dirs([top_path 'Ingested'],1);
jjb_check_dirs([top_path 'ToFix'],1);
jjb_check_dirs([top_path 'ToIngest'],1);
jjb_check_dirs([top_path 'logs'],1);

%%% Special: rename files according to the identifier provided by Gord: 
[C, H1, H2, H3] = load_metadata_tsv([top_path 'Digital Archive - Bulk Metadata Templates - October2020Scans.tsv']);
for i = 5:1:size(C,1)
   s1{i,1} = movefile([top_path C{i,36} '.tif'],[top_path C{i,2}]);
end


cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_metadata_to_mods(top_path,'Digital Archive - Bulk Metadata Templates - October2020Scans.tsv');

cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_prepare_ingest(top_path);

%%% Move these files to the proper folders in Z:\ToBeProcessed

for i = 6:1:size(C,1)
   target_folder = C{i,37};
     jjb_check_dirs(['Z:\ToBeProcessed\' target_folder],1);
    s2{i,1} =  copyfile([top_path 'ToIngest\' C{i,1} '.tif'],['Z:\ToBeProcessed\' target_folder '\' C{i,1} '.tif'],'f');
    s3{i,1} =  copyfile([top_path 'ToIngest\' C{i,1} '.xml'],['Z:\ToBeProcessed\' target_folder '\' C{i,1} '.xml']);
    status_check = s2{i,1}+s3{i,1};
    if status_check < 2
    disp(['Error with file: ' c{i,1} ', i = ' num2str(i)]);
    end
end

top_path = 'Digital Archive - Bulk Metadata Templates - October2020Scans.tsv';
cd('D:\Local\Digital-Archive-Tools\BulkTools')
DA_check_ingested(top_path,'ingested_all.csv')