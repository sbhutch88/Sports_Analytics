function [] = FantasyFootballDraft

%Things to Improve:
% 6/14/12 if you keep picking the same wrong person {'________'} then af 12
% the program will stop.
clc
clear all;


num.Teams = 12;
num.Rounds = 12;
num.Picks = num.Rounds * num.Teams;

draftOrder = {;};

%load sounds
load buzz.txt;sounds.buzz = buzz;
load ching.txt;sounds.ching = ching;
sounds.Drew = wavread('Drew.wav');
sounds.Steve = wavread('Steve.wav');
sounds.Sean = wavread('Sean.wav');
sounds.Kev = wavread('Kev.wav');
sounds.Bsak = wavread('Bsak');
sounds.Matt = wavread('Matt');
sounds.Heil = wavread('Heil');
sounds.Larson = wavread('Larson');
sounds.Frates = wavread('Frates');
sounds.Willard = wavread('Willard');
sounds.Al = wavread('Al');
sounds.John = wavread('John');
sounds.NextUp = wavread('Next_Up');
sounds.AndThen = wavread('And_Then');


data.empty = {'--------'};
data.empty2 = {'----------'};
%time = timer('TimerFcn','Begin Now');
        
%These sub structures will represent all of the Players in the Draft. I may update to a new system at some point.        
data.QB = {'Aaron Rodgers'; 'Drew Brees';'Tom Brady';'Cam Newton';'Matthew Stafford';'Michael Vick';'Eli Manning';'Peyton Manning';'Tony Romo';'Philip Rivers'; ...
           'Jay Cutler';'Robert Griffin III';'Ben Roethlisberger';'Matt Ryan';'Matt Schaub';'Carson Palmer';'Josh Freeman';'Andy Dalton';'Andrew Luck';'Joe Flacco'; ...
           'Ryan Fitzpatrick';'Sam Bradford';'Mark Sanchez';'Jake Locker';'Matt Cassel';'Alex Smith';'Matt Flynn';'Christian Ponder';'Tim Tebow';};
data.RB = {'Arian Foster';'Ray Rice';'LeSean McCoy';'Ryan Mathews';'MJD';'Chris Johnson';'Trent Richardson';'Darren McFadden';'Adrian Peterson';'Matt Forte';
           'Marshawn Lynch';'DeMarco Murray';'Jamaal Charles';'Fred Jackson';'Doug Martin';'Michael Turner';'Steven Jackson';'Darren Sproles';'Ahmad Bradshaw';'Reggie Bush'; 
           'Frank Gore';'Roy Helu';'BJGE';'Beanie Wells';'Jonathan Stewart';'Shonn Greene';'Isaac Redman';'Peyton Hillis';'Willis McGahee';'Jahvid Best'; 
           'DeAngelo Williams';'Stevan Ridley';'Michael Bush';'David Wilson';'C.J. Spiller';'Donald Brown';'Mikel LeShoure';'Mark Ingram';'Pierre Thomas';'Jacquizz Rodgers'; 
           'Ben Tate';'James Starks';'Ronnie Hillman';'Tim Hightower';'Ryan Williams';'LeGarrette Blount';'Mike Tolbert';'Toby Gerhart';'Shane Vereen';'Felix Jones';
           'Daniel Thomas';'Isaiah Pead';'Rashard Mendenhall';'Alex Green';'LaMichael James';'Joe McKnight';'Joseph Addai';'Mike Goodson';'Cedric Benson'; 'Jonathan Dwyer';
           'Brandon Jacobs';'Delone Carter';'Bernard Scott';'Evan Royster';'Rashad Jennings';'Chris Rainey';'Kendall Hunter';'Robert Turbin';'Taiwan Jones';'Dexter McCluster';
           'Kevin Smith';'Montario Hardesty';'Christ Polk';'Dion Lewis';'Christopher Ivory';'Knowshon Moreno';'Kahlil Bell';'Danny Woodhead';'Marcel Reece';'Chris Ogbonnaya'};
data.WR = {'Calvin Johnson';'Larry Fitzgerald';'Roddy White';'Victor Cruz';'Brandon Marshall';'Andre Johnson';'Greg Jennings';'A.J. Green';'Mike Wallace';'Hakeem Nicks';
           'Wes Welker';'Julio Jones';'Steve Smith';'Miles Austin';'Demaryius Thomas';'Jordy Nelson';'Jeremy Maclin';'Marques Colston';'Dez Bryant';'Percy Harvin';
           'Kenny Britt';'Dwayne Bowe';'Brandon Lloyd';'Vincent Jackson';'Antonio Brown';'Stevie Johnson';'DeSean Jackson';'Eric Decker';'Robert Meachem';'Torrey Smith';
           'Reggie Wayne';'Sidney Rice';'Pierre Garcon';'Santonio Holmes';'Darrius Heyward-Bey';'Greg Little';'Justin Blackmon';'Denarius Moore';'Mike Williams(TB)';'Anquan Boldin';
           'Malcom Floyd';'Santana Moss';'Lance Moore';'Michael Crabtree';'Michael Floyd';'Nate Washington';'Alshon Jeffery';'Laurent Robinson';'Doug Baldwin';'Nate Burleson';
           'Randy Moss';'Titus Young';'Mario Manningham';'Davone Bess';'Rueben Randle';'Austin Collie';'Brian Quick';'Kendall Wright';'Jacoby Ford';'Danny Amendola';
           'Stephen Hill';'James Jones';'Jonathan Baldwin';'Vincent Brown';'Jerome Simpson';'Earl Bennett';'Brian Hartline';'David Nelson';'Devery Henderson';'Joe Adams';
           'Mohamed Sanu';'Devin Hester';'Kevin Walter';'Emmanuel Sanders';'Deion Branch';'Josh Morgan';'Golden Tate';'Randall Cobb';'Jordan Shipley';'Brandon LaFell';
           'Early Doucet';'Jabar Gaffney';'DeVier Posey';'Mike Thomas';'Leonard Hankerson';'Mohamed Massaquoi';'Plaxico Burress';'Steve Breaston';'Eddie Royal';'Johnny Knox';
           'Jason Hill';'Danario Alexander';'Jerricho Cotchery';'Michael Jenkins';'Donald Driver';'Louis Murphy';'Damian Williams';'Dezmon Briscoe';'Joshua Cribbs';'Kyle Williams';};
data.TE = {'Jimmy Graham';'Rob Gronkowski';'Antonio Gates';'Aaron Hernandez';'Vernon Davis';'Fred Davis';'Jermichael Finley';'Jason Witten';'Brandon Pettigrew';'Tony Gonzalez';'Jacob Tamme';
           'Owen Daniels';'Jermaine Gresham';'Brent Celek';'Jared Cook';'Coby Fleener';'Dustin Keller';'Dallas Clark';'Greg Olsen';'Kyle Rudolph';'Kellen Winslow'; 
           'Tony Moeaki';'Heath Miller';'Ed Dickson';'Martellus Bennett';'Marcedes Lewis';'Joel Dreessen';'Todd Heap';'Anthony Fasano';'Jake Ballard';'Kevin Boss';'Tony Scheffler';};
data.DEF = {'San Francisco';'Pittsburgh';'Baltimore';'Chicago';'Green Bay';'Philadelphia';'Seattle';'Houston';'Detroit';'New York (Jets)';
            'New England';'Arizona';'Buffalo';'New York (Giants)';'Cincinnati';'Tennessee';'Atlanta';'Dallas';'Kansas City';'Miami';
            'Jacksonville';'Oakland';'New Orleans';'San Diego';'Cleveland';'Denver';'Washington';'Minnesota';'St. Louis';'Carolina';
            'Tampa Bay';'Indianapolis';};
data.K =   {'Mason Crosby';'Sebastian Janikowski';'David Akers';'Stephen Gostkowski';'Dan Bailey';'John Kasay';'Dan Carpenter';'Neil Rackers';'Mike Nugent';'Rob Bironas';
            'Billy Cundiff';'Jason Hanson';'Matt Bryant';'Robbie Gould';'Nick Novack';'Graham Gano';'Rian Lindell';'Steven Hauschka';'Shaun Suisham';'Olindo Mare';};


numbers = 1;%This code is make a list of numbers to make data.All. This way I can easily edit it if i add players later. Still has to be fixed.
for i = 2:(length(data.QB)+length(data.RB)+length(data.WR)+length(data.TE)+length(data.DEF)+length(data.K))
    number =  i;

    numbers = horzcat(numbers,number);
    
end    


       

data.All = {'QB','RB','WR','TE','DEF','K';
           [num2str(numbers(1)) ' = Aaron Rodgers'],      [num2str(numbers(30)) ' = Arian Foster'],      [num2str(numbers(110)) ' = C. Johnson'],      [num2str(numbers(210)) ' = Jimmy Graham'],        [num2str(numbers(242)) ' = San Fancisco'],        [num2str(numbers(274)) ' = Mason Crosby'];
           [num2str(numbers(2)) ' = Drew Brees'],         [num2str(numbers(31)) ' = Ray Rice'],          [num2str(numbers(111)) ' = L. Fitzgerald'],    [num2str(numbers(211)) ' = R. Gronkowski'],     [num2str(numbers(243)) ' = Pittsburgh'],         [num2str(numbers(275)) ' = S. Janikowski'];
           [num2str(numbers(3)) ' = Tom Brady'],         [num2str(numbers(32)) ' = LeSean McCoy'],     [num2str(numbers(112)) ' = Roddy White'],        [num2str(numbers(212)) ' = Antonio Gates'],      [num2str(numbers(244)) ' = Baltimore'],          [num2str(numbers(276)) ' = David Akers'];
           [num2str(numbers(4)) ' = Cam Newton'],        [num2str(numbers(33)) ' = Ryan Mathews'],     [num2str(numbers(113)) ' = Victor Cruz'],        [num2str(numbers(213)) ' = A. Hernandez'],    [num2str(numbers(245)) ' = Chicago'],            [num2str(numbers(277)) ' = S. Gostkowski'];
           [num2str(numbers(5)) ' = M. Stafford'],  [num2str(numbers(34)) ' = MJD'],              [num2str(numbers(114)) ' = B. Marshall'],   [num2str(numbers(214)) ' = Vernon Davis'],       [num2str(numbers(246)) ' = Green Bay'],          [num2str(numbers(278)) ' = Dan Bailey'];
           [num2str(numbers(6)) ' = Michael Vick'],      [num2str(numbers(35)) ' = Chris Johnson'],    [num2str(numbers(115)) ' = A. Johnson'],     [num2str(numbers(215)) ' = Fred Davis'],         [num2str(numbers(247)) ' = Philadelphia'],       [num2str(numbers(279)) ' = John Kasay'];
           [num2str(numbers(7)) ' = Eli Manning'],       [num2str(numbers(36)) ' = T. Richardson'], [num2str(numbers(116)) ' = Greg Jennings'],      [num2str(numbers(216)) ' = J. Finley'],  [num2str(numbers(248)) ' = Seattle'],            [num2str(numbers(280)) ' = Dan Capenter'];
           [num2str(numbers(8)) ' = Peyton Manning'],    [num2str(numbers(37)) ' = D. McFadden'],  [num2str(numbers(117)) ' = A.J. Green'],         [num2str(numbers(217)) ' = Jason Witten'],       [num2str(numbers(249)) ' = Houston'],            [num2str(numbers(281)) ' = Neil Rackers'];
           [num2str(numbers(9)) ' = Tony Romo'],         [num2str(numbers(38)) ' = A. Peterson'],  [num2str(numbers(118)) ' = Mike Wallace'],       [num2str(numbers(218)) ' = B. Pettigrew'],  [num2str(numbers(250)) ' = Detroit'],            [num2str(numbers(282)) ' = Mike Nugent'];
           [num2str(numbers(10)) ' = Philip Rivers'],     [num2str(numbers(39)) ' = Matt Forte'],       [num2str(numbers(119)) ' = Hakeem Nicks'],       [num2str(numbers(219)) ' = Tony Gonzalez'],      [num2str(numbers(251)) ' = NY (Jets)'],    [num2str(numbers(283)) ' = Rob Bironas'];
           [num2str(numbers(11)) ' = Jay Cutler'],        [num2str(numbers(40)) ' = Marshawn Lynch'],   [num2str(numbers(120)) ' = Wes Welker'],         [num2str(numbers(220)) ' = Jacob Tamme'],        [num2str(numbers(252)) ' = New England'],        [num2str(numbers(284)) ' = Billy Cundiff'];
           [num2str(numbers(12)) ' = R. Griffin III'],[num2str(numbers(41)) ' = DeMarco Murray'],   [num2str(numbers(121)) ' = Julio Jones'],        [num2str(numbers(221)) ' = Owen Daniels'],       [num2str(numbers(253)) ' = Arizona'],            [num2str(numbers(285)) ' = Jason Hanson'];
           [num2str(numbers(13)) ' = Roethlisberger'],[num2str(numbers(42)) ' = Jamaal Charles'],   [num2str(numbers(122)) ' = Steve Smith'],        [num2str(numbers(222)) ' = J. Gresham'],    [num2str(numbers(254)) ' = Buffalo'],            [num2str(numbers(286)) ' = Matt Bryant'];
           [num2str(numbers(14)) ' = Matt Ryan'],         [num2str(numbers(43)) ' = Fred Jackson'],     [num2str(numbers(123)) ' = Mile Austin'],        [num2str(numbers(223)) ' = Brent Celek'],        [num2str(numbers(255)) ' = NY (Giants)'],  [num2str(numbers(287)) ' = Robbie Gould'];
           [num2str(numbers(15)) ' = Matt Schaub'],       [num2str(numbers(44)) ' = Doug Martin'],      [num2str(numbers(124)) ' = D. Thomas'],   [num2str(numbers(224)) ' = Jared Cook'],         [num2str(numbers(256)) ' = Cincinnati'],         [num2str(numbers(288)) ' = Nick Novack'];
           [num2str(numbers(16)) ' = Carson Palmer'],     [num2str(numbers(45)) ' = Michael Turner'],   [num2str(numbers(125)) ' = Jordy Nelson'],       [num2str(numbers(225)) ' = Coby Fleener'],       [num2str(numbers(257)) ' = Tennessee'],          [num2str(numbers(289)) ' = Graham Gano'];
           [num2str(numbers(17)) ' = Josh Freeman'],      [num2str(numbers(46)) ' = Steven Jackson'],   [num2str(numbers(126)) ' = Jeremy Maclin'],      [num2str(numbers(226)) ' = Dustin Keller'],     [num2str(numbers(258)) ' = Atlanta'],           [num2str(numbers(290)) ' = Rian Lindell'];
           [num2str(numbers(18)) ' = Andy Dalton'],      [num2str(numbers(47)) ' = Darren Sproles'],  [num2str(numbers(127)) ' = M. Colston'],   [num2str(numbers(227)) ' = Dallas Clark'],      [num2str(numbers(259)) ' = Dallas'],            [num2str(numbers(291)) ' = S. Hauschka'];
           [num2str(numbers(19)) ' = Andrew Luck'],      [num2str(numbers(48)) ' = Ahmad Bradshaw'],  [num2str(numbers(128)) ' = Dez Bryant'],        [num2str(numbers(228)) ' = Greg Olsen'],        [num2str(numbers(260)) ' = Kansas City'],       [num2str(numbers(292)) ' = Shaun Suigham'];
           [num2str(numbers(20)) ' = Joe Flacco'],       [num2str(numbers(49)) ' = Reggie Bush'],     [num2str(numbers(129)) ' = Percy Harvin'],      [num2str(numbers(229)) ' = Kyle Rudolph'],      [num2str(numbers(261)) ' = Miami'],             [num2str(numbers(293)) ' = Olindo Mare'];
           [num2str(numbers(21)) ' = R. Fitzpatrick'], [num2str(numbers(50)) ' = Frank Gore'],      [num2str(numbers(130)) ' = Kenny Britt'],       [num2str(numbers(230)) ' = K. Winslow'],    [num2str(numbers(262)) ' = Jacksonville'],      [num2str(numbers(126)) ' ='];
           [num2str(numbers(22)) ' = Sam Bradford'],     [num2str(numbers(51)) ' = Roy Helu'],        [num2str(numbers(131)) ' = Dwayne Bowe'],       [num2str(numbers(231)) ' = Tony Moeaki'],       [num2str(numbers(263)) ' = Oakland'],           [num2str(numbers(132)) ' ='];
           [num2str(numbers(23)) ' = Mark Sanchez'],     [num2str(numbers(52)) ' = BJGE'],            [num2str(numbers(132)) ' = Brandon Lloyd'],     [num2str(numbers(232)) ' = Heath Miller'],      [num2str(numbers(264)) ' = New Orleans'],       [num2str(numbers(138)) ' ='];
           [num2str(numbers(24)) ' = Jake Locker'],      [num2str(numbers(53)) ' = Beanie Wells'],    [num2str(numbers(133)) ' = V. Jackson'],   [num2str(numbers(233)) ' = Ed Dickson'],        [num2str(numbers(265)) ' = San Diego'],         [num2str(numbers(144)) ' ='];
           [num2str(numbers(25)) ' = Matt Cassel'],      [num2str(numbers(54)) ' = J. Stewart'],[num2str(numbers(134)) ' = Antonio Brown'],     [num2str(numbers(234)) ' = M. Bennett'], [num2str(numbers(266)) ' = Cleveland'],         [num2str(numbers(150)) ' ='];
           [num2str(numbers(26)) ' = Alex Smith'],       [num2str(numbers(55)) ' = Shonn Green'],     [num2str(numbers(135)) ' = S. Johnson'],    [num2str(numbers(235)) ' = M. Lewis'],    [num2str(numbers(267)) ' = Denver'],            [num2str(numbers(156)) ' ='];
           [num2str(numbers(27)) ' = Matt Flynn'],       [num2str(numbers(56)) ' = Isaac Redman'],    [num2str(numbers(136)) ' = D. Jackson'],    [num2str(numbers(236)) ' = Joel Dreessen'],     [num2str(numbers(268)) ' = Washington'],        [num2str(numbers(162)) ' ='];
           [num2str(numbers(28)) ' = C.Ponder'], [num2str(numbers(57)) ' = Peyton Hillis'],   [num2str(numbers(137)) ' = Eric Decker'],       [num2str(numbers(237)) ' = Todd Heap'],         [num2str(numbers(269)) ' = Minnesota'],         [num2str(numbers(168)) ' ='];
           [num2str(numbers(29)) ' = Tim Tebow'],        [num2str(numbers(58)) ' = Willis McGahee'],  [num2str(numbers(138)) ' = R. Meachem'],    [num2str(numbers(238)) ' = A. Fasano'],    [num2str(numbers(270)) ' = St. Louis'],         [num2str(numbers(174)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(59)) ' = Jahvid Best'],       [num2str(numbers(139)) ' = Torrey Smith'],        [num2str(numbers(239)) ' = Jake Ballard'],        [num2str(numbers(271)) ' =  Carolina'],           [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(60)) ' = D. Williams'], [num2str(numbers(140)) ' = Reggie Wayne'],        [num2str(numbers(240)) ' = Kevin Boss'],          [num2str(numbers(272)) ' = Tampa Bay'],           [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(61)) ' = Stevan Ridley'],     [num2str(numbers(141)) ' = Sidney Rice'],         [num2str(numbers(241)) ' = T. Scheffler'],      [num2str(numbers(273)) ' = Indianapolis'],        [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(62)) ' = Michael Bush'],      [num2str(numbers(142)) ' = Pierre Garcon'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(63)) ' = David Wilson'],      [num2str(numbers(143)) ' = S. Holmes'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(64)) ' = C.J. Spiller'],      [num2str(numbers(144)) ' = D.Heyward-Bey'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(65)) ' = Donald Brown'],       [num2str(numbers(145)) ' = Greg Little'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(66)) ' = Mikel LeShoure'],    [num2str(numbers(146)) ' = J. Blackmon'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(67)) ' = Mark Ingram'],       [num2str(numbers(147)) ' = D. Moore'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(68)) ' = Pierre Thomas'],     [num2str(numbers(148)) ' = M. Williams'],   [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(69)) ' = J. Rodgers'],  [num2str(numbers(149)) ' = Anquan Boldin'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(70)) ' = Ben Tate'],          [num2str(numbers(150)) ' = Malcom Floyd'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(71)) ' = James Starks'],      [num2str(numbers(151)) ' = Santana Moss'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(72)) ' = Ronnie Hillman'],    [num2str(numbers(152)) ' = Lance moore'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(73)) ' = Tim Hightower'],     [num2str(numbers(153)) ' = M. Crabtree'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(74)) ' = Ryan Williams'],     [num2str(numbers(154)) ' = Michael Floyd'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(75)) ' = L. Blount'], [num2str(numbers(155)) ' = N. Washington'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(76)) ' = Mike Tolbert'],      [num2str(numbers(156)) ' = A. Jeffery'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(77)) ' = Toby Gerhart'],      [num2str(numbers(157)) ' = L. Robinson'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(78)) ' = Shane Vereen'],      [num2str(numbers(158)) ' = Doug Baldwin'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(79)) ' = Felix Jones'],       [num2str(numbers(159)) ' = Nate Burleson'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(80)) ' = Daniel Thomas'],     [num2str(numbers(160)) ' = Randy Moss'],          [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(81)) ' = Isaiah Pead'],       [num2str(numbers(161)) ' = Titus Young'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(82)) ' = R. Mendenhall'],[num2str(numbers(162)) ' = M. Manningham'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(83)) ' = Alex Green'],        [num2str(numbers(163)) ' = Davone Bess'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(84)) ' = L. James'],   [num2str(numbers(164)) ' = Rueben Randle'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(85)) ' = Joe McKnight'],      [num2str(numbers(165)) ' = Austin Collie'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(86)) ' = Joseph Addai'],      [num2str(numbers(166)) ' = Brian Quick'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(87)) ' = Mike Goodson'],      [num2str(numbers(167)) ' = K. Wright'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(88)) ' = Cedric Benson'],     [num2str(numbers(168)) ' = Jacoby Ford'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(89)) ' = Jonathan Dwyer'],    [num2str(numbers(169)) ' = D. Amendola'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(90)) ' = Brandon Jacobs'],    [num2str(numbers(170)) ' = Stephen Hill'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(91)) ' = Delone Carter'],     [num2str(numbers(171)) ' = James Jones'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(92)) ' = Bernard Scott'],     [num2str(numbers(172)) ' = J. Baldwin'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(93)) ' = Evan Royster'],      [num2str(numbers(173)) ' = Vincent Brown'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(94)) ' = R. Jennings'],   [num2str(numbers(174)) ' = J. Simpson'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(95)) ' = Chris Rainey'],      [num2str(numbers(175)) ' = Earl Bennett'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(96)) ' = Kendall Hunter'],    [num2str(numbers(176)) ' = B. Hartline'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(97)) ' = Robert Turbin'],     [num2str(numbers(177)) ' = David Nelson'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(98)) ' = Taiwan Jones'],      [num2str(numbers(178)) ' = D. Henderson'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(99)) ' = D. McCluster'],  [num2str(numbers(179)) ' = Joe Adams'],           [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(100)) ' = Kevin Smith'],       [num2str(numbers(180)) ' = Mohamed Sanu'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(101)) ' = M. Hardesty'], [num2str(numbers(181)) ' = Devin Hester'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(102)) ' = Chist Polk'],        [num2str(numbers(182)) ' = Kevin Walter'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(103)) ' = Dion Lewis'],        [num2str(numbers(183)) ' = E. Sanders'],    [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(104)) ' = C. Ivory'], [num2str(numbers(184)) ' = Deion Branch'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(105)) ' = K. Moreno'],   [num2str(numbers(185)) ' = Josh Morgan'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(106)) ' = Kahlil Bell'],       [num2str(numbers(186)) ' = Golden Tate'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(107)) ' = D. Woodhead'],    [num2str(numbers(187)) ' = Randall Cobb'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(108)) ' = Marcel Reece'],      [num2str(numbers(188)) ' = J. Shipley'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(7)) ' ='],                    [num2str(numbers(109)) ' = C. Ogbonnaya'],   [num2str(numbers(189)) ' = B. LaFell'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(190)) ' = Early Doucet'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(111)) ' ='],                   [num2str(numbers(191)) ' = Jabar Gaffney'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(112)) ' ='],                   [num2str(numbers(192)) ' = DeVier Posey'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(113)) ' ='],                   [num2str(numbers(193)) ' = Mike Thomas'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(114)) ' ='],                   [num2str(numbers(194)) ' = L. Hankerson'],   [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];                                         
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(115)) ' ='],                   [num2str(numbers(195)) ' = M. Massaquoi'],   [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(116)) ' ='],                   [num2str(numbers(196)) ' = P. Burress'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(117)) ' ='],                   [num2str(numbers(197)) ' = S. Breaston'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers()) ' ='],                   [num2str(numbers(198)) ' = Eddie Royal'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(199)) ' = Johnny Knox'],         [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(200)) ' = Jason Hill'],          [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(201)) ' = D. Alexander'],   [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(202)) ' = J. Cotchery'],   [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(203)) ' = M. Jenkins'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(204)) ' = Donald Driver'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(205)) ' = Louis Murphy'],        [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(206)) ' = D. Williams'],     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(207)) ' = D. Briscoe'],      [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(208)) ' = Joshua Cribbs'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='];
           [num2str(numbers(2)) ' ='],                    [num2str(numbers(2)) ' ='],                   [num2str(numbers(209)) ' = Kyle Williams'],       [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' ='],                     [num2str(numbers(2)) ' =']};
           
       
       %These lines make sure data.empty fills the extra space.
       data.All(31:end,1) = data.empty2;
       data.All(82:end,2) = data.empty2;
       data.All(34:end,4) = data.empty2;
       data.All(34:end,5) = data.empty2;
       data.All(22:end,6) = data.empty2;
       
       
data.AllPrevious = data.All;
data.pick = {'None'};


data.drew = {;};
data.steve = {;};
data.sean = {;};
data.larson = {;};
data.heil = {;};
data.john = {;};
data.scott = {;};
data.alex = {;};
data.matt = {;};
data.kev = {;};
data.frates = {;};
data.bsak = {;};
data.whosUp = {;};
data.people = {'1 = Drew';'2 = Steve';'3 = Sean';'4 = Larson';'5 = Heil';'6 = John';'7 = Scott';'8 = Alex';'9 = Matt';'10 = Kev';'11 = Frates';'12 = Bsak'};
fullNames = {data.people(1), data.people(2)};

k = 1;
for i = 1:num.Picks;
    if k <= num.Teams;
    %fprintf('\n');
    disp(data.people(1));
    %fprintf('\n');
    disp(data.people(2));
    %fprintf('\n');
    disp(data.people(3));
    %fprintf('\n');
    disp(data.people(4));
    %fprintf('\n');
    disp(data.people(5));
    %fprintf('\n');
    disp(data.people(6));
    %fprintf('\n');
    disp(data.people(7));
    %fprintf('\n');
    disp(data.people(8));
    %fprintf('\n');
    disp(data.people(9));
    %fprintf('\n');
    disp(data.people(10));
    %fprintf('\n');
    disp(data.people(11));
    %fprintf('\n');
    disp(data.people(12));
    %fprintf('\n');

    data.Who = input('Enter your name:');
        switch data.Who; 
            case 1,
                data.name = 'Drew Johnson';
                data.count = 1;
                data.whosUp = data.drew;
            case 2,
                data.name = 'Steve Hutchinson';
                data.count = 2;
                data.whosUp = data.steve;
            case 3,
                data.name = 'Sean Hutchinson';
                data.count = 3;
                data.whosUp = data.sean;
            case 4,
                data.name = 'Bobby Larson';
                data.count = 4;
                data.whosUp = data.larson;
            case 5,
                data.name = 'Bobby Heil';
                data.count = 5;
                data.whosUp = data.heil;
            case 6,
                data.name = 'John Vavledelis';
                data.count = 6;
                data.whosUp = data.john;
            case 7,
                data.name = 'Scott Willard';
                data.count = 7;
                data.whosUp = data.scott;
            case 8,
                data.name = 'Alex Adams';
                data.count = 8;
                data.whosUp = data.alex;
            case 9,
                data.name = 'Matt Clarizia';
                data.count = 9;
                data.whosUp = data.matt;
            case 10,
                data.name = 'Kevin Concannon';
                data.count = 10;
                data.whosUp = data.kev;
            case 11,
                data.name = 'Andrew Frates';
                data.count = 11;
                data.whosUp = data.frates;
            case 12, 
                data.name = 'Bryan Sakamoto';
                data.count = 12;
                data.whosUp = data.bsak;
        end

        
        if data.Who < 1 || data.Who > 12 ||  strcmp(data.people(data.Who),'_________')
            moveOn = 0;
            clc
            sound(sounds.buzz); %buzzer sound
            fprintf('\n*************************************************************************\n\n')
            disp('This choice is not valid');
            fprintf('\n*************************************************************************\n\n')
        else
            moveOn = 1;
            draftOrder = vertcat(draftOrder,'',data.name);
            data.people(data.Who) = {'_________'};

        end

    end
        %{
        if mod(data.people(data.count,:),'_________') == 0;
            frintf('This cannot be you');
            pause(2)
        end
        %}
    if moveOn == 1;
  
    %Creates Draft Order (consider making it's own function)
    if k == num.Teams+1
                    %This code flips the draftOrder in order to create the snake draft.
        draftOrder2 = flipdim(draftOrder,1);

        round = [2 4 6 8 10 12 14];

        %This loop makes sure that the draft snakes the right way. I am sure there is a better way to do this without all of the ||'s but for now I will do it this way.
        %Not enough memory in the IBM laptop to get through this loop.
        for j = 1:num.Rounds/2;
            if length(draftOrder) == num.Teams*round(1) || length(draftOrder) == num.Teams*round(2)|| length(draftOrder) == num.Teams*round(3)|| length(draftOrder) == num.Teams*round(4)|| length(draftOrder) == num.Teams*round(5)|| length(draftOrder) == num.Teams*round(6)|| length(draftOrder) == num.Teams*round(7);
                draftOrder = vertcat(draftOrder,draftOrder);
            else
                draftOrder = vertcat(draftOrder,draftOrder2);
            end
        end
    end
    
    list = 1;
    clc;
    if k > num.Teams
        data.name = char(draftOrder(k));
    end
    while list == 1;
        %This function will just make sure that the correct player is up,
        %in order to make sure they see the correct team.
        [data] = whosUp(data);
        
        fprintf('\n*************************************************************************\n\n')
        fprintf('\n');
        fprintf(data.name);
        fprintf(' Choose an option:\r',data.name);
        fprintf('\n 1 = Quarterbacks');
        fprintf('\n 2 = Running Backs');
        fprintf('\n 3 = Wide Recievers');
        fprintf('\n 4 = Tight Ends');
        fprintf('\n 5 = Defenses');
        fprintf('\n 6 = Kickers');
        fprintf('\n 7 = My Team');
        fprintf('\n \n 0 = Draft Player');
        
        
%This code allows for the Drafter to look at different lists of players.
        data.list = input('\n \n Choose List (1 2 3 4 5 6 7) or Press 0 to Draft a Player:');
        clc;
        fprintf('\r***************\r');
        switch data.list
            case 1,
                fprintf('\r QUARTERBACKS: \r');
                disp(data.QB);
            case 2,
                fprintf('\r RUNNING BACKS: \r');
                disp(data.RB);
            case 3, 
                fprintf('\r WIDE RECIEVERS: \n');
                disp(data.WR);
            case 4
                fprintf('\r TIGHT ENDS: \r');
                disp(data.TE);
            case 5
                fprintf('\r DEFENSES: \r');
                disp(data.DEF);
            case 6
                fprintf('\r KICKERS: \r');
                disp(data.K);
            case 7
                fprintf('\r My Team: \r');
                disp(data.whosUp);
            case 0 
                fprintf('\r All Players: \r');
                disp(data.All);
            otherwise,
                fprintf(' This is not a valid input '); 
                sound(sounds.buzz); %buzzer sound
                continue
        end
        fprintf('\r***************\r');
        
            if data.list == 0;
                
                
                [data m n o playerNumbers] = makePick2(data);
                clc;
                fprintf('\r Player: ');
                disp(data.pick);
                fprintf(' ****************\r');
                
                truefalse = zeros(size(data.AllPrevious));
               
                
                
                if data.pickNumber == 999  %this code will come in to play if the player is not listed
                    truefalse(:,:) = 1;
                elseif data.pickNumber > size(playerNumbers,1)
                    truefalse(:,:) = 0; %this makes sure if an input is bigger than possible inputs for drafting a player than there is an error.
                else
                    truefalse = ismember(data.AllPrevious(:,:),data.justPicked); %this code says if the player just picked is an element of the original full player list then return true (1), else false(0).              
                %It will return a matrix with one 1 in it if is true.
                end
                
                if truefalse(:,:) == 0 %if the truefalse matrix is all 0s.
                    elementOf = 0;
                elseif data.whoElse == 'b'
                    elementOf = 3;
                else
                    elementOf = 1; %if the truefalse matrix is not all 0s.
                end
                
                if  elementOf == 0 
                    sound(sounds.buzz); %buzzer sound
                    fprintf(' This is not a valid input ');
                    data.correct = 3;
                elseif elementOf == 3
                    continue;
                else
                    data.correct = input('Is This the Player you Wanted to Draft? (1 = Yes 2 = No) :');
                end
                

            
                if data.correct == 1; %if the player is correct / draft player
                    [data] = createTeam(data,draftOrder);
                    list = 0;
                    sound(sounds.ching);
                    if k > num.Teams %this says to play the sounds for whos next after the first round.
                        nextSound(sounds,draftOrder,k);
                    end
                elseif data.correct ~= 2 && elementOf == 1
                    data.All(m,n) = data.justPicked;
                    sound(sounds.buzz); %buzzer sound
                    fprintf(' This is not a valid input ');
                    switch n
                        case 1
                            data.QB(o) = data.pick;
                        case 2
                            data.RB(o) = data.pick;
                        case 3
                            data.WR(o) = data.pick;
                        case 4
                            data.TE(o) = data.pick;
                        case 5
                            data.DEF(o) = data.pick;
                        case 6
                            data.K(o) = data.pick;
                    end
                elseif elementOf == 3;
                    continue;
              
                end
        data.justPicked = '9999';
            end
        
    end
    
    
        
  
    k = k + 1;  
    end
end
        

    

    
    draftOrder;
    length(draftOrder)
    num.Picks
    
  
    
    
    