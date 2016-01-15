function [data] = whosUp(data)


if strcmp(data.name,'Drew Johnson');
        data.whosUp = data.drew;
elseif strcmp(data.name,'Steve Hutchinson');
        data.whosUp = data.steve;
elseif strcmp(data.name,'Sean Hutchinson');
        data.whosUp = data.sean;
elseif strcmp(data.name,'Bobby Larson');
        data.whosUp = data.larson;
elseif strcmp(data.name,'Bobby Heil');
        data.whosUp = data.heil;
elseif strcmp(data.name,'John Vavledelis');
        data.whosUp = data.john;
elseif strcmp(data.name,'Scott Willard');
        data.whosUp = data.scott;
elseif strcmp(data.name,'Alex Adams');
        data.whosUp = data.alex;
elseif strcmp(data.name,'Matt Clarizia');
        data.whosUp = data.matt;
elseif strcmp(data.name,'Kevin Concannon');
        data.whosUp = data.kev;
elseif strcmp(data.name,'Andrew Frates');
        data.whosUp = data.frates;
elseif strcmp(data.name,'Bryan Sakamoto');
        data.whosUp = data.bsak;
end