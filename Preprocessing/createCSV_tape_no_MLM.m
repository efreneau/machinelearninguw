function createCSV_tape_no_MLM(path1,P190,csv_location)
    files = dir(path1);
    parfor i = (1:length(files))
        file = files(i).name;
        if(endsWith(file,'raw','IgnoreCase',true) && strcmp(file,'EOT.RAW')==0)
            location = strcat(path1,file);
            try
                createCSV_no_MLM(location,P190,csv_location);
            catch er
                %rethrow(er)
                warning('Out of bounds shot number. File Ignored.');
            end
        end
    end
end