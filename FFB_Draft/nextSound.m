function [] = nextSound(sounds,draftOrder,k)

%soundSpeed = randi([25000 60000],100,1); %everything is working except this random soundSpeed.

soundSpeed = 30000;
wavplay(sounds.NextUp,soundSpeed);

%soundSpeed = randi([25000 60000],100,1);

if strcmp(draftOrder(k+1),'Drew Johnson')
        wavplay(sounds.Drew,soundSpeed);
elseif strcmp(draftOrder(k+1),'Bryan Sakamoto')
        wavplay(sounds.Bsak,soundSpeed);
elseif strcmp(draftOrder(k+1),'Andrew Frates')
        wavplay(sounds.Frates,soundSpeed); 
elseif strcmp(draftOrder(k+1),'Steve Hutchinson')
        wavplay(sounds.Steve,soundSpeed);
elseif strcmp(draftOrder(k+1),'Sean Hutchinson')
        wavplay(sounds.Sean,soundSpeed); 
elseif strcmp(draftOrder(k+1),'Bobby Heil')
        wavplay(sounds.Heil,soundSpeed);
elseif strcmp(draftOrder(k+1),'Bobby Larson')
        wavplay(sounds.Larson,soundSpeed); 
elseif strcmp(draftOrder(k+1),'Scott Willard')
        wavplay(sounds.Willard,soundSpeed);
elseif strcmp(draftOrder(k+1),'John Vavledelis')
        wavplay(sounds.John,soundSpeed); 
elseif strcmp(draftOrder(k+1),'Kevin Concannon')
        wavplay(sounds.Kev,soundSpeed);
elseif strcmp(draftOrder(k+1),'Alex Adams')
        wavplay(sounds.Al,soundSpeed); 
elseif strcmp(draftOrder(k+1),'Matt Clarizia')
        wavplay(sounds.Matt,soundSpeed);
end

%soundSpeed = randi([25000 60000],100,1);

wavplay(sounds.AndThen,soundSpeed);

%soundSpeed = randi([25000 60000],100,1);

if strcmp(draftOrder(k+2),'Drew Johnson')
        wavplay(sounds.Drew,soundSpeed);
elseif strcmp(draftOrder(k+2),'Bryan Sakamoto')
        wavplay(sounds.Bsak,soundSpeed);
elseif strcmp(draftOrder(k+2),'Andrew Frates')
        wavplay(sounds.Frates,soundSpeed); 
elseif strcmp(draftOrder(k+2),'Steve Hutchinson')
        wavplay(sounds.Steve,soundSpeed);
elseif strcmp(draftOrder(k+2),'Sean Hutchinson')
        wavplay(sounds.Sean,soundSpeed); 
elseif strcmp(draftOrder(k+2),'Bobby Heil')
        wavplay(sounds.Heil,soundSpeed);
elseif strcmp(draftOrder(k+2),'Bobby Larson')
        wavplay(sounds.Larson,soundSpeed); 
elseif strcmp(draftOrder(k+2),'Scott Willard')
        wavplay(sounds.Willard,soundSpeed);
elseif strcmp(draftOrder(k+2),'John Vavledelis')
        wavplay(sounds.Frates,soundSpeed); 
elseif strcmp(draftOrder(k+2),'Kevin Concannon')
        wavplay(sounds.Kev,soundSpeed);
elseif strcmp(draftOrder(k+2),'Alex Adams')
        wavplay(sounds.Al,soundSpeed); 
elseif strcmp(draftOrder(k+2),'Drew Johnson')
        wavplay(sounds.Drew,soundSpeed);
end