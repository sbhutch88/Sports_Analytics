function [data] = createTeam(data,draftOrder)




if strcmp(data.name,'Drew Johnson');
        data.drew = vertcat(data.drew,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.drew);
        fprintf(' ****************\r');
        data.whosUp = data.drew;
elseif strcmp(data.name,'Steve Hutchinson');
        data.steve = vertcat(data.steve,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.steve);
        fprintf(' ****************\r');
        data.whosUp = data.steve;
elseif strcmp(data.name,'Sean Hutchinson');
        data.sean = vertcat(data.sean,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.sean);
        fprintf(' ****************\r');
        data.whosUp = data.sean;
elseif strcmp(data.name,'Bobby Larson');
        data.larson = vertcat(data.larson,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.larson);
        fprintf(' ****************\r');
        data.whosUp = data.larson;
elseif strcmp(data.name,'Bobby Heil');
        data.heil = vertcat(data.heil,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.heil);
        fprintf(' ****************\r');
        data.whosUp = data.heil;
elseif strcmp(data.name,'John Vavledelis');
        data.john = vertcat(data.john,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.john);
        fprintf(' ****************\r');
        data.whosUp = data.john;
elseif strcmp(data.name,'Scott Willard');
        data.scott = vertcat(data.scott,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.scott);
        fprintf(' ****************\r');
        data.whosUp = data.scott;
elseif strcmp(data.name,'Alex Adams');
        data.alex = vertcat(data.alex,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.alex);
        fprintf(' ****************\r');
        data.whosUp = data.alex;
elseif strcmp(data.name,'Matt Clarizia');
        data.matt = vertcat(data.matt,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.matt);
        fprintf(' ****************\r');
        data.whosUp = data.matt;
elseif strcmp(data.name,'Kevin Concannon');
        data.kev = vertcat(data.kev,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.kev);
        fprintf(' ****************\r');
        data.whosUp = data.kev;
elseif strcmp(data.name,'Andrew Frates');
        data.frates = vertcat(data.frates,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.frates);
        fprintf(' ****************\r');
        data.whosUp = data.frates;
elseif strcmp(data.name,'Bryan Sakamoto');
        data.bsak = vertcat(data.bsak,data.pick);
        fprintf('\r');
        fprintf(data.name);
        fprintf('\r');
        disp(data.bsak);
        fprintf(' ****************\r');
        data.whosUp = data.bsak;

        
end

