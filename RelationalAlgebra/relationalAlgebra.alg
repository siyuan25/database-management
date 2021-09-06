%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem1
% List musical groups who have had an album that contains at least one song that was ranked in the top 5 (topSongs.rating<=5) between the year 2001 and 2004 (2001 and 2004 inclusive).

% get the song information that ranked in the top five
songRankedTopFive := (select rating <= 5 (topSongs)) njoin song;

% get the albumCode of songs that are in the top 5
albumCodeWithSongTitle := project albumCode, songTitle (songRankedTopFive njoin composedOf);

% using comparison to confirm the albums that are between the year 2001 and 2004
albumBetweenYears := project albumCode, albumTitle, year, groupCode (select year >= 2001 and year <= 2004 (album));

% the first natural join to get the albums contain top 5 songs between 2001 and 2004, the second natural join to get the information from musicalGroup
albumBetweenYearsTopSongs := (albumCodeWithSongTitle njoin albumBetweenYears) njoin musicalGroup;

% by projecting to the certain attributes to achieve groupCode, groupName, and songTitle
answer1 := project groupCode, groupName, songTitle (albumBetweenYearsTopSongs);

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem2
% List artists who have been a member of only one group.

% natural join to get the groupCode of artists are in
memberGroup := project artistID, firstName, lastName, groupCode (artist njoin member);

% copy the memberGroup to get the member in only one group by comparing
memberGroupCopy (artistID1, firstName1, lastName1, groupCode1) := memberGroup;

% using cartesian product to compare
combinations := memberGroup product memberGroupCopy;

% using logic to get the artists who have been a member more than one group
moreThanOne :=  project artistID, firstName, lastName, groupCode (select artistID = artistID1 and groupCode <> groupCode1 (combinations));

% using different to get the artist that only have been a member in only one group
onlyOne := memberGroup difference moreThanOne;

% by projecting to the certain attributes to achieve artistID, firstName, lastName
answer2 := project artistID, firstName, lastName(onlyOne);

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem3
% List musical groups that have had at least one member who was born after 1983 (1983 is inclusive)

% select the artists that were born after 1983
bornAfter1983 := project artistID, firstName, lastName (select yearBorn >= 1983 (artist));

% natural join the artists born after 1983 and member in order to get the groupCode
memberGroupCode := bornAfter1983 njoin member;

% natural join to get the groupName in musicalGroup, by projecting to the certain attributes to achieve groupCode, groupName, artistID
answer3 := project groupCode, groupName, artistID(memberGroupCode njoin musicalGroup);

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem4
% List clients who purchased albums containing a song titled 'Days Go By' or who live in 'Los Angeles'.

% selecting the song titled 'Days Go By' and getting the albumCode by natural join with composedOf, then getting thealbum title from natural join to album
specificSong := project albumCode, albumTitle (((select songTitle = 'Days Go By' (song)) njoin composedOf) njoin album);

% selecting the client who lives in 'Los Angeles', and get the name and ID
specificClient := project firstName, lastName, clientID (select address = 'Los Angeles' (client));

% by projecting to the certain attributes to achieve firstName, lastName, clientID
% then using union to combine two groups that satisfy requirements
answer4 := (project firstName, lastName, clientID ((specificSong njoin purchasedBy) njoin client)) union specificClient;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem5
% List the clients (firstName, lastName, clientID) who purchased all albums of the group 'Sweet Symphony', with each albumTitle of the group Sweet Symphony.

% by natural joining twice to confirm the albums that all clients purchased
clientPurchased := project firstName, lastName, clientID, albumCode, albumTitle ((client njoin purchasedBy) njoin album);

% natural join musicalGroup and album in order to get the groupCode and groupName
allAlbums := project groupCode, groupName, albumCode, albumTitle (musicalGroup njoin album);

% select the all the albums that are in musicalGroup 'Sweet Symphony'
allAlbumsInSweetSymphony := select groupName = 'Sweet Symphony' (allAlbums);

% project only title of allAlbumsInSweetSymphony
allAlbumsInSweetSymphonyTitle := project albumTitle (allAlbumsInSweetSymphony);

% by natural joining to get the clinets who bought albums from 'Sweet Symphony' group
clientPurchasedSweetSymphony := project firstName, lastName, clientID, albumTitle(clientPurchased njoin allAlbumsInSweetSymphony);

% use division to find the client that purchased all of  all albums of the group 'Sweet Symphony'
% which related to all values in the table

% clientPurchasedSweetSymphony = {firstName, lastName, clientID, albumTitle}
% allAlbumsInSweetSymphonyTitle = {albumTitle}
% clientPurchasedSweetSymphony difference allAlbumsInSweetSymphonyTitle = {firstName, lastName, clientID}

% after division, we can get the client's firstName, lastName, clientID who bought all the albums in group 'Sweet Symphony'
clientPurchasedAll := (project firstName, lastName, clientID (clientPurchasedSweetSymphony)) difference (project firstName, lastName, clientID (((project firstName, lastName, clientID (clientPurchasedSweetSymphony)) product allAlbumsInSweetSymphonyTitle) difference clientPurchasedSweetSymphony));

% finally, project the firstName, lastName, clientID of the client and the albumTitle the client purchased
answer5 := project firstName, lastName, clientID, albumTitle (clientPurchasedAll njoin allAlbumsInSweetSymphonyTitle);


%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% since there are three albums in this group, so making two more copies to do the cartesian product
% clientPurchasedSweetSymphonyCopy1 (firstName1, lastName1, clientID1, albumTitle1) := clientPurchasedSweetSymphony;
% clientPurchasedSweetSymphonyCopy2 (firstName2, lastName2, clientID2, albumTitle2) := clientPurchasedSweetSymphony;

% doing twice cartesian product to compare the albumTitles, which should be different if purchasing all the albums
% threeCombinations := (clientPurchasedSweetSymphony product clientPurchasedSweetSymphonyCopy1) product clientPurchasedSweetSymphonyCopy2;

% select the same clientID to compare the albumTitles the client purchased
% if albumTitle is not equal to albumTitle1 and albumTitle1 is not equal to albumTitle2 and albumTitle1 is not equal to albumTitle2, which means they have different albumTitles
% since the musicalGroup 'SweetSymphony' has three differnt albums, so to get the answer if three albumTtiles are all different from the cartesian products
% by projecting to the certain attributes to achieve artistID, firstName, lastName
% answer5 := project firstName, lastName, clientID, albumTitle (select clientID = clientID1 and clientID = clientID2 and clientID1 = clientID2 and albumTitle <> albumTitle1 and albumTitle <> albumTitle2 and albumTitle1 <> albumTitle2 (threeCombinations));

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
