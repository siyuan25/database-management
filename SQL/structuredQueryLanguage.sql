%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem1. For each artist, find the number of distinct songs that he/she wrote and were in the top 4 (rating >=1 and rating <= 4). Order the result in descending order of the number of top 4 songs for each artist.
%(attributes to display: artistID, firstName, lastName, songCount) 'songCount' is the number of top 4 songs written by each artist.

% select all attributes that need to display
answer1 := select A.artistID, A.firstName, A.lastName, count (*) as songCount
% choose from artist table and writtenBy table
                     from artist A, writtenBy W
% when both artists' ID are the same, find the songs that are in the top  4
                     where  A.artistID = W.artistID and exists (select * from topSongs S where S.songCode = W.songCode and rating >= 1 and rating <= 4)
% by grouping attributes to get the count of songs that are in top 4 each artist
                     group by A.artistID, A.firstName, A.lastName
% order the result in descending order (more to less) of the number of top 4 songs for each artist
                     order by songCount desc;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem2. List clients that have not purchased any album with a top 4 song (top 4 meaning rating >=1 and rating <= 4). Order the result in alphabetical order of their last names first, then their first names. (This list should include clients who have not purchased any album if any).
% (attributes to display: firstName, lastName)

% select all attributes that need to display from table client
answer2 := select C.firstName, C.lastName from client C
% choose the client that did not purchase any album with a top 4 song, using not in
                     where C.clientID not in (select P.clientID from purchasedBy P 
% choosing the albumCode that are not belong to ant top 4 songs
                     where P.albumCode not in (select A.albumCode from album A
% find out the albumCode that are the same with top 4 songs, using not in to negate the result
                     where A.albumCode not in (select CO.albumCode from composedOf CO 
% using exists to find the songs that are in top 4, natural join by using the same songCode
                     where exists (select * from topSongs S where S.rating >= 1 and S.rating <= 4 and CO.songCode = S.songCode))))
% order the result in alphabetical order of clients' last names first, then their first names
                     order by C.lastName, C.firstName asc;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem3. List artists such that each of all musical groups that they have belonged to, has at least one album that was purchased by a client whose last name is 'Jones'.
% This list should not include artists that have never belonged to any musical group
% (artistID, firstName, lastName)

% select all attributes that need to display from table artist
answer3 := select distinct A.artistID, A.firstName, A.lastName
% natural join table artist and member, to get all artists' information that have a group
                     from artist A natural join member
% negate the result of that artists such that each of all musical groups that they have belonged to did not have any album that was purchased by a client whose last name is 'Jones'
                     where A.artistID not in (select AR.artistID from artist AR natural join member M
% not exists the group that has album did not bought by 'Jones'
                     where not exists (select G.groupCode from musicalGroup G
% natural join musicalGroup and member
                     where G.groupCode = M.groupCode and
% G1 represents the group that albums are not purchased by 'Jones'
                     G.groupCode not in (select G1.groupCode from musicalGroup G1
% use AL1 to check if the group G1 contains AL1 ehich purchsed by 'Jones'
                     where not exists (select * from album AL1
% all the albums that were purchased by a client whose last name is 'Jones'
                     where AL1.albumCode in (select AL.albumCode from album AL
% exists purchasedBy, join with client and album
                     where exists(select * from purchasedBy P
% connect the albums' albumCode and the albumCode which 'Jones' purchased
                     where P.albumCode = AL.albumCode and exists (select * from client C
% the album that purchased by a client whose last name is 'Jones', using clientID to join together
                     where lastName = 'Jones' and C.clientID = P.clientID))) and G1.groupCode = AL1.groupCode))));

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem4. List musical groups that have had at least 3 distinct member artists. These artists do not need to have belonged to one same group at the same time. Order the result in decreasing order of the number of artists for each group.
% (attributes to display: groupCode, groupName, artistCount) artistCount is the number of distinct artists for each group

% select attributes that will need to display, using count function to count the amount of artists, put distinct artistID in the count function to get distinct artists for each group
answer4 := select G.groupCode, G.groupName, count (distinct M.artistID) as artistCount
                     from musicalGroup G, member M
% % the condition would be both groupCode be the same
                     where G.groupCode = M.groupCode
% group artistCount by using information of groupCode and groupName
                     group by G.groupCode, G.groupName
% the musical groups have at least 3 distinct member artists
                     having artistCount>= 3
% Order the result in decreasing order of the number of artists for each group
                     order by artistCount desc;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Problem5.
% a. What is the number of distinct albums purchased by each client (with at least one album)? Order the result in increasing order of the album counts, then by increasing order of clientID. Call this relation 'answer5a'.
% (attributes to display: clientID, firstName, lastName, albumCount)

% select attributes that will display, using count function to count the amount of albums, put distinct albumCode in the count function to get distinct albums purchased by each client
answer5a := select C.clientID, C.firstName, C.lastName, count (distinct P.albumCode) as albumCount
% get information from client table and the table purchasedBy
                        from client C, purchasedBy P
% the condition would be both clientID must be the same
                        where C.clientID = P.clientID
% group albumCount by clients' clientID, firstName and lastName
                        group by C.clientID, C.firstName, C.lastName
% order the output in increasing (ascending) order of the album counts, then by increasing (ascending) order of clientID
                        order by albumCount, C.clientID asc;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% b. Then compute the maximum, minimum, and average number of albums purchased by each client, using the above result relation 'answer5a'.
% (attributes to display: albumMax, albumMin, albumAve)

% albumMax is the maximum number of albums purchased by each client.  5
% albumMin is the minimum number of albums purchased by each client.  1
% albumAve is the average number of albums purchased by each client.  3
% Name the relation/table with the final result 'answer5b'.

% use max function to get the maximum, min function to get  the minimum number, and avg function to compute the average number of albums
answer5b := select  max(albumCount) as albumMax, min(albumCount) as albumMin, avg(albumCount) as albumAve 
                        from answer5a;

%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
