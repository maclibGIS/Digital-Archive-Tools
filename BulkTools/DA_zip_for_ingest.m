function [] = DA_zip_for_ingest(top_path)

% top_path = 'H:\Digitization_Projects\WWII_Topographic_Maps\Italy\UofA WWII_Italy_Topos_50k\';
cd(top_path);
% addpath('D:\Local\Digital-Archive-Tools\BulkTools');
d = dir(top_path);
fid = fopen([top_path 'set_list.csv'],'a');
arc_size = 0; %size of archive
to_archive = {}; % list of items to archive

%%%% See if we can determine what counter number we should start at (i.e.
%%%% what name to give to newly-created folders) [set1, set2, etc.]
jjb_check_dirs([top_path 'zipped-to_ingest\'],1)

d_ingest = dir([top_path 'zipped-to_ingest\']);
if size(d_ingest,1)<3
    arc_ctr = 1;
else
    % get a list of all directories:
    tmp = struct2cell(d_ingest);
    ind = find(cell2mat(tmp(5,:))==1);
    if size(ind)<=2
        arc_ctr = 1;
    else
        ind = ind(3:end);
        dir_names = tmp(1,ind);
        dir_names = strrep(dir_names,'set','');
        dir_nums = str2double(dir_names');
        arc_ctr = max(dir_nums)+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temporary setting: Using this to limit the # of zipfiles created until
% we're able to open up more space on the H:
num_zips = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 3:1:length(d)
    [fdir, fname, fext] = fileparts(d(i).name); %file directory | filename | file extension
    if strcmp(fext,'.tiff')==1 || strcmp(fext,'.tif')==1
        if exist([top_path fname '.xml'],'file')==2
            % Check if adding tiff to the current archive puts it over 2 GB
            if (arc_size + d(i).bytes) < 2.4e9 %Making this 2.4 GB because compression ratio is about 80%.
                %                 to_archive{size(to_archive,1)+1,1} = d(i).name;     % Add tif
                %                 to_archive{size(to_archive,1)+1,1} = [fname '.xml'];% Add xml
                %                 arc_size = arc_size + d(i).bytes;
            else % perform zipping work
                % make a directory in \zipped-to_ingest
                %                 zip([top_path 'zipped-to_ingest\set' num2str(arc_ctr) '.zip'],to_archive);
                jjb_check_dirs([top_path 'zipped-to_ingest\set' num2str(arc_ctr)],1)
                [status,cmdout] = system(['7z a -tzip "' top_path 'zipped-to_ingest\set' num2str(arc_ctr) '\set' num2str(arc_ctr) '.zip"' sprintf(' %s',to_archive{:})]);
                switch status
                    case 0
                        fprintf(fid,'%s\n',['set ' num2str(arc_ctr) sprintf(',%s',to_archive{:})])
                        %                 mv_str = sprintf(' %s,',to_archive{:}); mv_str = mv_str(1:end-1);
                        % Move all files listed in to_archive into the set# folder
                        for j = 1:1:size(to_archive,1)
                            [status] = dos(['move ' to_archive{j,1} ' "' top_path 'zipped-to_ingest\set' num2str(arc_ctr) '"']);
                        end
                    otherwise
                        disp(['set ' num2str(arc_ctr) ' failed. Contents: ' sprintf(',%s',to_archive{:})])
                end
                %%% Reset archive data; increment counter
                to_archive={}; arc_size = 0;
                arc_ctr = arc_ctr + 1;
                num_zips = num_zips + 1;
                if num_zips == 300
                    return;
                    %                     disp('pause');
                end
            end
            to_archive{size(to_archive,1)+1,1} = d(i).name;     % Add tif to new archive
            to_archive{size(to_archive,1)+1,1} = [fname '.xml'];% Add xml to new archive
            arc_size = arc_size + d(i).bytes;
            
        end
    end
end

% Zip the last archive:
jjb_check_dirs([top_path 'zipped-to_ingest\set' num2str(arc_ctr)],1)
[status,cmdout] = system(['7z a -tzip "' top_path 'zipped-to_ingest\set' num2str(arc_ctr) '\set' num2str(arc_ctr) '.zip"' sprintf(' %s',to_archive{:})]);
switch status
    case 0
        fprintf(fid,'%s\n',['set ' num2str(arc_ctr) sprintf(',%s',to_archive{:})])
        for j = 1:1:size(to_archive,1)
            [status] = dos(['move ' to_archive{j,1} ' "' top_path 'zipped-to_ingest\set' num2str(arc_ctr) '"']);
        end
    otherwise
        disp(['set ' num2str(arc_ctr) ' failed. Contents: ' sprintf(',%s',to_archive{:})])
end
fclose(fid);
