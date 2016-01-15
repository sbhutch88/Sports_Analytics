function [data] = makePick(data,num,draftOrder)

data.pick = input('Which player would you like to draft?');
switch data.pick
    case 1
        data.pick = data.QB(1);
        data.QB(1) = data.empty;
        data.justPicked = data.All(2,1);
        data.All(2,1) = data.empty;
    case 2
        data.pick = data.QB(2);
        data.QB(2) = data.empty;
        data.justPicked = data.All(3,1);
        data.All(3,1) = data.empty;
    case 3
        data.pick = data.QB(3);
        data.QB(3) = data.empty;
        data.All(4,1) = data.empty;
    case 4
        data.pick = data.RB(1);
        data.RB(1) = data.empty;
        data.All(2,2) = data.empty;
    case 5
        data.pick = data.RB(2);
        data.RB(2) = data.empty;
        data.All(3,2) = data.empty;
    case 6
        data.pick = data.RB(3);
        data.RB(3) = data.empty;
        data.All(4,2) = data.empty;
    case 7
        data.pick = data.WR(1);
        data.WR(1) = data.empty;
        data.All(2,3) = data.empty;
    case 8
        data.pick = data.WR(2);
        data.WR(2) = data.empty;
        data.All(3,3) = data.empty;
    case 9
        data.pick = data.WR(3);
        data.WR(3) = data.empty;
        data.All(4,3) = data.empty;
    case 10
        data.pick = data.TE(1);
        data.TE(1) = data.empty;
        data.All(2,4) = data.empty;
    case 11
        data.pick = data.TE(2);
        data.TE(2) = data.empty;
        data.All(3,4) = data.empty;
    case 12
        data.pick = data.TE(3);
        data.TE(3) = data.empty;
        data.All(4,4) = data.empty;
    case 13
        data.pick = data.DEF(1);
        data.DEF(1) = data.empty;
        data.All(2,5) = data.empty;
    case 14
        data.pick = data.DEF(2);
        data.DEF(2) = data.empty;
        data.All(3,5) = data.empty;
    case 15
        data.pick = data.DEF(3);
        data.DEF(3) = data.empty;
        data.All(4,5) = data.empty;
    case 16
        data.pick = data.K(1);
        data.K(1) = data.empty;
        data.All(2,6) = data.empty;
    case 17
        data.pick = data.K(2);
        data.K(2) = data.empty;
        data.All(3,6) = data.empty;
    case 18
        data.pick = data.K(3);
        data.K(3) = data.empty;
        data.All(4,6) = data.empty;
        
        
        
end

