function[parsedFile, elementsPresent] = parseElementalString(data)        

    elementNames = ["H","HE","LI","BE","B","C","N","O","F",...
        "NE","NA","MG","AL","SI","P","S","CL","AR","K","CA","SC",...
        "TI","V","CR","MN","FE","CO","NI","CU","ZN","GA","GE",...
        "AS","SE","BR","KR","RB","SR","Y","ZR","NB","MO","TC",...
        "RU","RH","PD","AG","CD","IN","SN","SB","TE","I","XE",...
        "CS","BA","LA","CE","PR","ND","PM","SM","EU","GD","TB",...
        "DY","HO","ER","TM","YB","LU","HF","TA","W","RE","OS",...
        "IR","PT","AU","HG","TL","PB","BI","PO","AT","RN","FR",...
        "RA","AC","TH","PA","U","NP","PU","AM","CM","BK","CF","ES",...
        "FM","MD","NO","LR","RF","DB","SG","BH","HS","MT","DS",...
        "RG","CN","NH","FL","MC","LV","TS","OG"];

    % Need to reformat the EPROBE_STRING so pull it out
    eprobe = data.EPROBE_STRING;
    
    % Sometimes strings use weird 
    for s = 1: length(eprobe)
        if contains(eprobe{s}, '(.)')
            eprobe{s} = replace(eprobe{s},'(.)',',');
            eprobe{s} = eprobe{s}(1:end-1);
        end
    end

    % apply split to each row of data - i.e. to each elemental string
    % temp is a column vector containing split probe strings
    temp = arrayfun(@(x) split(x,", "),eprobe,'UniformOutput',false);

    % loop through each probe string (each row)
    for i=1:length(temp)
        % if the probe string isn't blank, process it
        if(temp{i}(1) ~= "")
            % extract element name
            t1 = extractBefore(temp{i},":");
            % extract weight percent
            if contains(temp{i},'(')
                t2 = extractBetween(temp{i},':','(');
            else
                t2 = extractAfter(temp{i},':');
            end
            % change element name from string to char
            newt1 = arrayfun(@(x) char(x), transpose(t1),'UniformOutput',false);
            % change weight percent from string to double
            newt2 = str2double(transpose(t2));
            % create a dictionary - key/value pairs for each probe string
            % key = element
            % value = weight percent
            % G is an cell containing dictionaries
            G{i} = containers.Map(newt1, newt2);
        else
            G{i} = 0;

        end
    end

    % This section creates a table of elements for each particle.
    Z = zeros(length(G),118);
    T = array2table(Z, "VariableNames", elementNames);
    % for each dictionary (particle) in G
    for i=1:length(G)
        % for each key (element) in the current dictionary (particle)
        if G{i} ~= 0
            for k=keys(G{i})
                % the check really isn't necessary as T contains all the elements
                % however it keeps the code from crashing if an entry gets
                % corrupted
                if ismember(k{1},T.Properties.VariableNames)
                    % set the table entry for the current particle, current
                    % element, to the weight percent value from the original file
                    T.(k{1})(i) = G{i}(k{1});
                end
            end
        end
    end
    
    % Remove empty columns
    elementsPresent = {};
    k = 0;
    for i = size(T, 2): -1: 1
        % if the column is empty, delete it
        if (sum(T.(i), 'omitnan') == 0)
            T.(i) = [];
        else
            % capture the names of the elements present
            k = k + 1;
            temp = T.Properties.VariableNames{i};
            elementsPresent{k} = temp;
        end
    end

    % Join the original and the elemental table.  This aligns the elemental
    % data with other data for the particle and allows plotting those data
    % against the elemental data.
    parsedFile = [data T];

end