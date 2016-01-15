function [data m n o playerNumbers] = makePick2(data)

data.pickNumber = input('Which player would you like to draft? \n (type 999 if the player is not listed):');
data.whoElse = 0;

            %[(Row from data.All) (Column from data.All) (Row from individual Position List)]
playerNumbers = [2 1 1; %Aaron Rodgers
                 3 1 2; %Drew Brees
                 4 1 3; %Tom Brady
                 5 1 4; %Cam Newton
                 6 1 5; %Matthew Stafford
                 7 1 6; %Michael Vick
                 8 1 7; %Eli Manning
                 9 1 8; %Peyton Manning
                 10 1 9; %Tony Romo
                 11 1 10; %Philip Rivers
                 12 1 11; %Jay Cutler
                 13 1 12; %RG3
                 14 1 13; %Ben Roethlisberger
                 15 1 14; %Matt Ryan
                 16 1 15; %Matt Schaub
                 17 1 16; %Carson Palmer
                 18 1 17; %Josh Freeman
                 19 1 18; %Andy Dalton
                 20 1 19; %Andrew Luck
                 21 1 20; %Joe Flacco
                 22 1 21; %Ryan Fitzpatrick
                 23 1 22; %Sam Bradford
                 24 1 23; %Mark Sanchez
                 25 1 24; %Jake Locker
                 26 1 25; %Matt Cassel
                 27 1 26; %Alex Smith
                 28 1 27; %Matt Flynn
                 29 1 28; %Christian Ponder
                 30 1 29; %Tim Tebow
                 2 2 1; %Arian Foster
                 3 2 2; %Ray Rice
                 4 2 3; %LeSean McCoy
                 5 2 4; %Ryan Mathews
                 6 2 5; %MJD
                 7 2 6; %Chris Johnson
                 8 2 7; %Trent Richardson
                 9 2 8; %Darren McFadden
                 10 2 9; %Adrian Peterson
                 11 2 10; %Matt Forte
                 12 2 11; %Marshawn Lynch
                 13 2 12; %DeMarco Murray
                 14 2 13; %Jamaal Charles
                 15 2 14; %Fred Jackson
                 16 2 15; %Doug martin
                 17 2 16; %Michael Turner
                 18 2 17; %Steven Jackson
                 19 2 18; %Darren Sproles
                 20 2 19; %Ahmad Bradshaw
                 21 2 20; %Reggie Bush
                 22 2 21; %Frank Gore
                 23 2 22; %Roy Helu
                 24 2 23; %BJGE
                 25 2 24; %Beanie Wells
                 26 2 25; %Jonathan Stewart
                 27 2 26; %Shonn Greene
                 28 2 27; %Isaac Redman
                 29 2 28; %Peyton Hillis
                 30 2 29; %Willis McGahee
                 31 2 30; %Jahvid Best
                 32 2 31; %DeAngelo Williams
                 33 2 32; %Stevan Ridley
                 34 2 33; %Michael Bush
                 35 2 34; %David Wilson
                 36 2 35; %C.J. Spiller
                 37 2 36; %Donald Brown
                 38 2 37; %Mikel LeShoure
                 39 2 38; % Mark Ingram
                 40 2 39; %Pierre Thomas
                 41 2 40; %Jacquizz Rodgers
                 42 2 41; %Ben Tate
                 43 2 42; %James Starks
                 44 2 43; %Ronnie Hillman
                 45 2 44; %Tim Hightower
                 46 2 45; %Ryan Williams
                 47 2 46; %LeGarrette Blount
                 48 2 47; %Mike Tolbert
                 49 2 48; %Toby Gerhart
                 50 2 49; %Shane Vereen
                 51 2 50; %Felix Jones
                 52 2 51; %Daniel Thomas
                 53 2 52; %Isaiah Pead
                 54 2 53; %Rashard Mendenhall
                 55 2 54; %Alex Green
                 56 2 55; %LaMichael James
                 57 2 56; %Joe McKnight
                 58 2 57; %Joseph Addai
                 59 2 58; %Mike Goodson
                 60 2 59; %Cedric Benson
                 61 2 60; %Jonathan Dwyer
                 62 2 61; %Brandon Jacobs
                 63 2 62; %Delone Carter
                 64 2 63; %Bernard Scott
                 65 2 64; %Evan Royster
                 66 2 65; %Rashad Jennings
                 67 2 66; %Chris Rainey
                 68 2 67; %Kendall Hunter
                 69 2 68; %Robert Turbin
                 70 2 69; %Taiwan Jones
                 71 2 70; %Dexter McCluster
                 72 2 71; %Kevin Smith
                 73 2 72; %Montario Hardesty
                 74 2 73; %Christ Polk
                 75 2 74; %Dion Lewis
                 76 2 75; %Christopher Ivory
                 77 2 76; %Knowshon Moreno
                 78 2 77; %Kahlil Bell
                 79 2 78; %Danny Woodhead
                 80 2 79; %Marcel Reece
                 81 2 80; %Chris Ogbonnaya
                 2 3 1; %Calvin Johnson
                 3 3 2; %Larry Fitzgerald
                 4 3 3; %Roddy White
                 5 3 4; %Victor Cruz
                 6 3 5; %Brandon Marshall
                 7 3 6; %Andre Johnson
                 8 3 7; %Greg Jennings
                 9 3 8; %A.J. Green
                 10 3 9; %Mike Wallace
                 11 3 10; %Hakeem Nicks
                 12 3 11; %Wes Welker
                 13 3 12; %Julio Jones
                 14 3 13; %Steve Smith
                 15 3 14; %Miles Austin
                 16 3 15; %Demaryius Thomas
                 17 3 16; %Jordy Nelson
                 18 3 17; %Jeremy Maclin
                 19 3 18; %Marques Colston
                 20 3 19; %Dez Bryant
                 21 3 20; %Percy Harvin
                 22 3 21; %Kenny Britt
                 23 3 22; %Dwayne Bowe
                 24 3 23; %Brandon Lloyd
                 25 3 24; %Vincent Jackson
                 26 3 25; %Antonio Brown
                 27 3 26; %Stevie Johnson
                 28 3 27; %DeSean Jackson
                 29 3 28; %Eric Decker
                 30 3 29; %Robert Meachem
                 31 3 30; %Torrey Smith
                 32 3 31; %Reggie Wayne
                 33 3 32; %Sidney Rice
                 34 3 33; %Pierre Garcon
                 35 3 34; %Santonio Holmes
                 36 3 35; %Darrius Heyward-Bey
                 37 3 36; %Greg Little
                 38 3 37; %Justin Backmon
                 39 3 38; %Denarius Moore
                 40 3 39; %Mike Williams(TB)
                 41 3 40; %Anquan Boldin
                 42 3 41; %Malcom Floyd
                 43 3 42; %Santana Moss
                 44 3 43; %Lance Moore
                 45 3 44; %Michael Crabtree
                 46 3 45; %Michael Floyd
                 47 3 46; %Nate Washington
                 48 3 47; %Alshon Jeffery
                 49 3 48; %Laurent Robinson
                 50 3 49; %Doug Baldwin
                 51 3 50; %Nate Burleson
                 52 3 51; %Randy Moss
                 53 3 52; %Titus Young
                 54 3 53; %Mario Manningham
                 55 3 54; %Davone Bess
                 56 3 55; %Rueben Randle
                 57 3 56; %Austin Collie
                 58 3 57; %Brian Quick
                 59 3 58; %Kendall Wright
                 60 3 59; %Jacoby Ford
                 61 3 60; %Danny Amendola
                 62 3 61; %Stephen Hill
                 63 3 62; %James Jones
                 64 3 63; %Jonathan Baldwin
                 65 3 64; %Vincent Brown
                 66 3 65; %Jerome Simpson
                 67 3 66; %Earl Bennett
                 68 3 67; %Brian Hartline
                 69 3 68; %David Nelson
                 70 3 69; %Devery Henderson
                 71 3 70; %Joe Adams
                 72 3 71; %Mohamed Sanu
                 73 3 72; %Devin Hester
                 74 3 73; %Kevin Walter
                 75 3 74; %Emmanuel Sanders
                 76 3 75; %Deion Branch
                 77 3 76; %Josh Morgan
                 78 3 77; %Golden Tate
                 79 3 78; %Randall Cobb
                 80 3 79; %Jordan Shipley
                 81 3 80; %Brandon LaFell
                 82 3 81; %Early Doucet
                 83 3 82; %Jabar Gaffney
                 84 3 83; %DeVier Posey
                 85 3 84; %Mike Thomas
                 86 3 85; %Leonard Hankerson
                 87 3 86; %Mohamed Massoquoi
                 88 3 87; %Plaxico Burress
                 89 3 88; %Steve Breason
                 90 3 89; %Eddie Royal
                 91 3 90; %Johnny Knox
                 92 3 91; %Jason Hill
                 93 3 92; %Danario Alexander
                 94 3 93; %Jerricho Cotchery
                 95 3 94; %Michael Jenkins
                 96 3 95; %Donald Driver
                 97 3 96; %Louis Murphy
                 98 3 97; %Damian Williams
                 99 3 98; %Dezmon Briscoe
                 100 3 99; %Joshua Cribbs
                 101 3 100; %Kyle Williams
                 2 4 1; %Jimmy Graham
                 3 4 2; %Rob Gronkowski
                 4 4 3; %Antonio Gates
                 5 4 4; %Aaron Hernandez
                 6 4 5; %Vernon Davis
                 7 4 6; %Fred Davis
                 8 4 7; %Jermichael Finley
                 9 4 8; %%Jason Witten
                 10 4 9; %Brandon Pettigrew
                 11 4 10; %Tony Gonzalez
                 12 4 11; %Jacob Tamme
                 13 4 12; %Owen Daniels
                 14 4 13; %Jermaine Gresham
                 15 4 14; %Brent Celek
                 16 4 15; %Jared Cook
                 17 4 16; %Coby Fleener
                 18 4 17; %Dustin Keller
                 19 4 18; %Dallas Clark
                 20 4 19; %Greg Olsen
                 21 4 20; %Kyle Rudolph
                 22 4 21; %Kellen Winslow
                 23 4 22; %Tony Moeaki
                 24 4 23; %Heath Miller
                 25 4 24; %Ed Dickson
                 26 4 25; %Martellus Bennett
                 27 4 26; %Marcedes Lewis
                 28 4 27; %Joel Dreessen
                 29 4 28; %Todd Heap
                 30 4 29; %Anthony Fasano
                 31 4 30; %Jake Ballard
                 32 4 31; %Kevin Boss
                 33 4 32; %Tony Scheffler
                 2 5 1; %San Francisco
                 3 5 2; %Pittsburgh
                 4 5 3; %Baltimore
                 5 5 4; %Chicago
                 6 5 5; %Green Bay
                 7 5 6; %Philadelphia
                 8 5 7; %Seattle
                 9 5 8; %Houston
                 10 5 9; %Detroit
                 11 5 10; %New Yoke (jets)
                 12 5 11; %New England
                 13 5 12; %Arizona
                 14 5 13; %Buffalo
                 15 5 14; %New York (giants)
                 16 5 15; %Cincinnati
                 17 5 16; %Tennessee
                 18 5 17; %Atlanta
                 19 5 18; %Dallas
                 20 5 19; %Kansas City
                 21 5 20; %Miami
                 22 5 21; %Jacksonville
                 23 5 22; %Oakland
                 24 5 23; %New Orleans
                 25 5 24; %San Diego
                 26 5 25; %Cleveland
                 27 5 26; %Denver
                 28 5 27; %Washington
                 29 5 28; %Minnesota
                 30 5 29; %St. Louis
                 31 5 30; %Carolina
                 32 5 31; %Tampa Bay
                 33 5 32; %Indianapolis
                 2 6 1; %Mason Crosby
                 3 6 2; %Sebastien Janikowski
                 4 6 3; %David Akers
                 5 6 4; %Stephen Gostkowski
                 6 6 5; %Dan Bailey
                 7 6 6; %John Kasay
                 8 6 7; %Dan Carpenter
                 9 6 8; %Neil Rackers
                 10 6 9; %Mike Nugent
                 11 6 10; %Rob Bironas
                 12 6 11; %Billy Cundiff
                 13 6 12; %Jason Hanson
                 14 6 13; %Matt Bryant
                 15 6 14; %Robbie Gould
                 16 6 15; %Nick Novack
                 17 6 16; %Graham Gano
                 18 6 17; %Rian Lindell
                 19 6 18; %Steven Hauschka
                 20 6 19; %Shaun Suisham
                 21 6 20; %Olindo Mare
                 ];
             
            
if data.pickNumber == 999
    clc;
    data.whoElse = input('Please type the name of the player you would like to draft \n (type b to go back):','s');
    if data.whoElse == 'b'
        m = [];
        n = [];
        o = [];
        return
    end
        data.pick = data.whoElse;
        m = [];
        n = [];
        o = [];
        return
elseif data.pickNumber ~= 1:size(playerNumbers,1)
        m = [];
        n = [];
        o = [];
        return
end
        m = playerNumbers(data.pickNumber,1);
        n = playerNumbers(data.pickNumber,2);
        o = playerNumbers(data.pickNumber,3);


    switch n
        case 1
            data.pick = data.QB(o);
            data.QB(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
            %load Aaron_Rogers.mp4
            %implay('Aaron_Rogers');
        case 2
            data.pick = data.RB(o);
            data.RB(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
        case 3
            data.pick = data.WR(o);
            data.WR(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
        case 4
            data.pick = data.TE(o);
            data.TE(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
        case 5
            data.pick = data.DEF(o);
            data.DEF(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
        case 6
            data.pick = data.K(o);
            data.K(o) = data.empty;
            data.justPicked = data.All(m,n);
            data.All(m,n) = data.empty;
    end
