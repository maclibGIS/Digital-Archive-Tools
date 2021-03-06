xml_dir = 'H:\Digitization_Projects\OCUL_HTDP_63K\iso19115\';
d = dir(xml_dir);

fid = fopen('H:\Digitization_Projects\OCUL_HTDP_63K\iso19115_info.csv','w');

for i = 3:1:length(d)
    fname = d(i).name;
    id = fname(1:end-8);
%     fid_in = fopen(['H:\Digitization_Projects\OCUL_HTDP\iso19115\' fname],'r');
%     tmp = textscan(fid_in,'%s');
%     tmp = textread(fid_in,'%s');
out = xml2struct([xml_dir fname]);
% tmp = xmlread(['H:\Digitization_Projects\OCUL_HTDP\iso19115\' fname]);
% tmp = fileread
% rightlevel = find(strcmp(out.Children.Name,'gmd:identificationInfo')==1);
% b = fieldnames(out.Children);
% out.Children('gmd:identificationInfo').Children

% descr = out.Children(10).Children(2).Children(4).Children.Children.Data;
descr = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_abstract.gcou_colonu_CharacterString.Text;
CRS = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_referenceSystemInfo.gmdu_colonu_MDu_ReferenceSystem.gmdu_colonu_referenceSystemIdentifier.gmdu_colonu_RSu_Identifier.gmdu_colonu_code.gcou_colonu_CharacterString.Text;
bbox_w = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_extent.gmdu_colonu_EXu_Extent.gmdu_colonu_geographicElement.gmdu_colonu_EXu_GeographicBoundingBox.gmdu_colonu_westBoundLongitude.gcou_colonu_Decimal.Text;
bbox_e = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_extent.gmdu_colonu_EXu_Extent.gmdu_colonu_geographicElement.gmdu_colonu_EXu_GeographicBoundingBox.gmdu_colonu_eastBoundLongitude.gcou_colonu_Decimal.Text;
bbox_s = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_extent.gmdu_colonu_EXu_Extent.gmdu_colonu_geographicElement.gmdu_colonu_EXu_GeographicBoundingBox.gmdu_colonu_southBoundLatitude.gcou_colonu_Decimal.Text;
bbox_n = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_extent.gmdu_colonu_EXu_Extent.gmdu_colonu_geographicElement.gmdu_colonu_EXu_GeographicBoundingBox.gmdu_colonu_northBoundLatitude.gcou_colonu_Decimal.Text;

% responsible party
try
resp_party = out.gmdu_colonu_MDu_Metadata.gmdu_colonu_identificationInfo.gmdu_colonu_MDu_DataIdentification.gmdu_colonu_citation.gmdu_colonu_CIu_Citation.gmdu_colonu_citedResponsibleParty{1, 1}.gmdu_colonu_CIu_ResponsibleParty.gmdu_colonu_organisationName.gcou_colonu_CharacterString.Text;
resp_party = ['Canada. ' resp_party];
catch
resp_party = '';
end

%publisher
publ = out.gmdu_colonu_MDu_Metadata.spu_colonu_spu_dashu_custom.spu_colonu_publisher.Text;
ind = strfind(publ,'Department of');
switch length(ind)
    case 0
    case 1
        publ = publ(ind(1):end);
    case 2
        tmp = publ(ind(1):ind(2)-3);
        switch tmp(15:19)
            case 'Milit'
                publ = 'Department of Militia and Defence';
            case 'Energ'
                publ = 'Department of Energy, Mines and Resources';
            case 'Mines'
                publ = 'Department of Mines';
            case 'Natio'
                publ =  'Department of National Defence';
            case 'the I'
                publ =  'Department of the Interior';  
            otherwise
                disp(['unknown publisher: ' tmp])
                publ = '';
        end
end


% remove HTML elements

descr = strrep(descr,'.</p><p>T','.</p><p> T');
descr = strrep(descr,'<p>','');descr = strrep(descr,'</p>','');
descr = strrep(descr,'<I>','');descr = strrep(descr,'</I>','');

% remove the 'georeferenced image' part
descr = strrep(descr,'georeferenced raster image','digitized image');
% descr = [id ',"' descr '","' CRS '",' bbox_n ',' bbox_s ',' bbox_e ',' bbox_w];
tmp = sprintf('%s,"%s","%s",%s,%s,%s,%s,"%s","%s"',id,descr,CRS,bbox_n,bbox_s,bbox_e,bbox_w,resp_party,publ);
fprintf(fid,'%s\n',tmp);
clear descr tmp CRS bbox* resp_party publ;
end

fclose(fid);