-------------------------------------------------------------------------------------------------------------------------------------------------
-- A)Get the number of each team of which the player with the name Parmenter and initial R is a member; in this example, we assume that no two players have the same name and initials. 

SELECT TEAMNO FROM TEAMS,PLAYERS WHERE TEAMS.PLAYERNO = PLAYERS.PLAYERNO AND PLAYERS.NAME = 'Parmenter' AND PLAYERS.INITIALS = 'R';
-- +--------+
-- | TEAMNO |
-- +--------+
-- |      1 |
-- +--------+
SELECT TEAMNO FROM TEAMS JOIN PLAYERS ON TEAMS.PLAYERNO = PLAYERS.PLAYERNO WHERE PLAYERS.NAME = 'Parmenter' AND PLAYERS.INITIALS = 'R';
-- +--------+
-- | TEAMNO |
-- +--------+
-- |      1 |
-- +--------+
-------------------------------------------------------------------------------------------------------------------------------------------------
-- B)For each penalty, find the payment number, the amount, and the number and name of the player who incurred it.

SELECT PLAYERNO,AMOUNT,(SELECT NAME FROM players WHERE penalties.PLAYERNO = players.PLAYERNO) AS NAME FROM penalties;
-- +----------+--------+-----------+
-- | PLAYERNO | AMOUNT | NAME      |
-- +----------+--------+-----------+
-- |        6 | 100.00 | Parmenter |
-- |       44 |  75.00 | Baker     |
-- |       27 | 100.00 | Collins   |
-- |      104 |  50.00 | Moorman   |
-- |       44 |  25.00 | Baker     |
-- |        8 |  25.00 | Newcastle |
-- |       44 |  30.00 | Baker     |
-- |       27 |  75.00 | Collins   |
-- +----------+--------+-----------+
SELECT penalties.PLAYERNO, penalties.AMOUNT,players.NAME FROM penalties JOIN players ON penalties.PLAYERNO = players.PLAYERNO;
-- +----------+--------+-----------+
-- | PLAYERNO | AMOUNT | NAME      |
-- +----------+--------+-----------+
-- |        6 | 100.00 | Parmenter |
-- |       44 |  75.00 | Baker     |
-- |       27 | 100.00 | Collins   |
-- |      104 |  50.00 | Moorman   |
-- |       44 |  25.00 | Baker     |
-- |        8 |  25.00 | Newcastle |
-- |       44 |  30.00 | Baker     |
-- |       27 |  75.00 | Collins   |
-- +----------+--------+-----------+
-------------------------------------------------------------------------------------------------------------------------------------------------
-- C)For ALL players, get the player number and a list of the numbers of teams for which they have ever played. Some players may not have played for teams in the database. Hint: a JOIN of some kind is needed (do not forget ALL players).

 SELECT TEAMS.TEAMNO,PLAYERS.PLAYERNO
 FROM PLAYERS
 LEFT JOIN TEAMS
 ON PLAYERS.PLAYERNO = TEAMS.PLAYERNO
 ORDER BY PLAYERS.PLAYERNO;
-- +--------+----------+
-- | TEAMNO | PLAYERNO |
-- +--------+----------+
-- |   NULL |        2 |
-- |      1 |        6 |
-- |   NULL |        7 |
-- |   NULL |        8 |
-- |      2 |       27 |
-- |   NULL |       28 |
-- |   NULL |       39 |
-- |   NULL |       44 |
-- |   NULL |       57 |
-- |   NULL |       83 |
-- |   NULL |       95 |
-- |   NULL |      100 |
-- |   NULL |      104 |
-- |   NULL |      112 |
-- +--------+----------+
-------------------------------------------------------------------------------------------------------------------------------------------------
-- D)Get the number of each player who won at least one match. A win from matches is more wins than losses.
SELECT PLAYERNO, TEAMNO
FROM MATCHES
WHERE WON > LOST;
-- +----------+--------+
-- | PLAYERNO | TEAMNO |
-- +----------+--------+
-- |        6 |      1 |
-- |        6 |      1 |
-- |       44 |      1 |
-- |       57 |      1 |
-- |       27 |      2 |
-- |      104 |      2 |
-- +----------+--------+
-------------------------------------------------------------------------------------------------------------------------------------------------

-- E)Get the payment numbers of the penalties incurred by players who were born after 1965.
-- mysql> SELECT paymentno, penalties.PLAYERNO
 
FROM penalties
JOIN players ON penalties.PLAYERNO = players.PLAYERNO
WHERE BIRTH_DATE > '1965-12-31';
-- +-----------+----------+
-- | paymentno | PLAYERNO |
-- +-----------+----------+
-- |     4     |   104    |
-- +-----------+----------+
-------------------------------------------------------------------------------------------------------------------------------------------------