/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 1 of the case study, which means that there'll be more guidance for you about how to
setup your local SQLite connection in PART 2 of the case study.

The questions in the case study are exactly the same as with Tier 2.

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface.
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */

-------------------------------------------------------------------------------------------------------
/*SQL Tasks Completed by Adam Lang, Springboard Data Science Fellow
Date: 4/9/2024*/

/* QUESTIONS
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */

* Query I wrote:
SELECT name, membercost FROM `Facilities`
WHERE membercost > 0.0
ORDER BY membercost DESC;

* There are 5 Facilities that charge a fee to members, and they are:
Facility Name   Member Cost
Massage Room 1   9.9
Massage Room 2   9.9
Tennis Court 1   5.0
Tennis Court 2   5.0
Squash Court     3.5


/* Q2: How many facilities do not charge a fee to members? */
* There are 4 Facilities that do not charge a fee to members, and they are:

* Query I wrote:
SELECT name, membercost FROM `Facilities`
WHERE membercost = 0.0;

Facility Name   Member Cost
Badminton Court   0.0
Pool Table        0.0
Snooker Table     0.0
Table Tennis      0.0


/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */
* Query I wrote:
SELECT name, membercost, facid, monthlymaintenance
FROM `Facilities`
WHERE membercost > 0.0
AND membercost < (0.20*monthlymaintenance)
ORDER BY membercost DESC;

* There are 5 facilities that charge a fee to members where the fee is less than 20% of the facility's monthly maintenance cost, and they are::
Facility Name   Member Cost  facid   Monthly Maintenance

Massage Room 1   9.9         4       3000

Massage Room 2   9.9         5       3000

Tennis Court 1   5.0         0       200

Tennis Court 2   5.0         1       200
Squash Court     3.5         6       80



/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */
* SQL Query I wrote:
SELECT name, membercost, facid, monthlymaintenance
FROM `Facilities`
WHERE facid IN (1, 5);

* There are 2 facilities with ID 1 and 5, and they are:
Facility Name   Member Cost  facid   Monthly Maintenance
Tennis Court 2    5.0         1      200
Massage Room 2    9.9         5      3000


/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */
* Query I wrote:
SELECT
    name,
    monthlymaintenance,
    CASE
        WHEN monthlymaintenance > 100 THEN 'expensive'
        ELSE 'cheap'
    END AS cost_label
FROM Facilities
GROUP BY monthlymaintenance;

* There are 6 facilities, and they are:
Facility Name      Monthly Maintenance      cost_label

Table Tennis        10                      cheap
Snooker Table       15                      cheap
Badminton Court     50                      cheap
Squash Court        80                      cheap
Tennis Court 1      200                     expensive
Massage Room 1      3000                    expensive

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */
* Query I used:
SELECT firstname, surname, joindate
FROM Members
WHERE joindate = (
    SELECT MAX(joindate)
    FROM Members
)
* Result:
First Name  Last Name   Join Date
Darren      Smith       2012-09-26 18:08:45


/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
* Query I used:
SELECT DISTINCT (Bookings.memid),
       CONCAT(Members.firstname, ' ', Members.surname) AS Member_Name,
       Bookings.facid AS Facility_ID,
       Facilities.name AS Facility_Name
  FROM country_club.Bookings Bookings
      JOIN country_club.Members Members ON Members.memid=Bookings.memid
      JOIN country_club.Facilities Facilities ON Facilities.facid=Bookings.facid
 WHERE Bookings.facid  = 0 OR Bookings.facid  = 1
 ORDER BY  Member_Name

 * Result:
 * Total output was 27 distinct members.



/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

* Query I used:
SELECT Facilities.name AS Facility_Name,
       CONCAT(Member.firstname,' ',Member.surname) AS Member_Name,
	   DATE(Bookings.starttime) AS Booking_Date,
       Bookings.slots AS Slot,

       CASE WHEN Bookings.memid = 0 THEN Facilities.guestcost*Bookings.slots
     		ELSE Facilities.membercost*Bookings.slots END AS Total_Cost

  FROM country_club.Bookings Bookings
       JOIN country_club.Members Member ON Member.memid=Bookings.memid
       JOIN country_club.Facilities Facilities  ON Facilities.facid=Bookings.facid
WHERE DATE(Bookings.starttime) = '2012-09-14'
HAVING Total_Cost > 30
ORDER BY Total_Cost DESC;

* Result was 12 total.


/* Q9: This time, produce the same result as in Q8, but using a subquery. */
* Query I used:

SELECT sub.Facility_Name,
       sub.Member_Name,
       CASE WHEN sub.Mem_ID = 0 THEN sub.Guest_Fee*sub.Slots
     	   ELSE sub.Member_Fee*sub.Slots END AS Total_Pay

 FROM (
       SELECT Facilities.name AS Facility_Name,
              Bookings.memid as Mem_ID,
              CONCAT(Member.firstname,' ',Member.surname) AS Member_Name,
              Facilities.membercost AS Member_Fee,
              Facilities.guestcost AS Guest_Fee,
              Bookings.slots AS Slots
         FROM country_club.Bookings Bookings
            JOIN country_club.Members Member ON Member.memid=Bookings.memid
            JOIN country_club.Facilities Facilities  ON Facilities.facid=Bookings.facid
        WHERE DATE(Bookings.starttime) = '2012-09-14'
       ) sub
HAVING Total_Pay > 30
ORDER BY Total_Pay DESC

* Result was the same as above.

=======================================================================================================
/* PART 2: SQLite
/* We now want you to jump over to a local instance of the database on your machine.

Copy and paste the LocalSQLConnection.py script into an empty Jupyter notebook, and run it.

Make sure that the SQLFiles folder containing these files is in your working directory, and
that you haven't changed the name of the .db file from 'sqlite\db\pythonsqlite'.

You should see the output from the initial query 'SELECT * FROM FACILITIES'.

Complete the remaining tasks in the Jupyter interface. If you struggle, feel free to go back
to the PHPMyAdmin interface as and when you need to.

You'll need to paste your query into value of the 'query1' variable and run the code block again to get an output.

QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

* Query used:
 SELECT Facilities.name AS Facility_Name,
	   SUM(CASE WHEN Bookings.memid = 0 THEN Facilities.guestcost*Bookings.slots
     	   ELSE Facilities.membercost*Bookings.slots END)
           -3*Facilities.monthlymaintenance
                       AS Revenue

 FROM Bookings
       JOIN Members Member ON Member.memid=Bookings.memid
       JOIN Facilities Facilities  ON Facilities.facid=Bookings.facid

GROUP BY Facilities.name
HAVING Revenue < 1000
ORDER BY Revenue DESC;

/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */
* Query I used:

SELECT
    CONCAT(m1.surname, m1.firstname) AS member_name,
    CONCAT(m2.firstname, m2.surname) AS recommended_by
FROM
    Members AS m1
    LEFT JOIN Members AS m2 ON m1.recommendedby = m2.memid
ORDER BY
    m1.surname, m1.firstname;

/* Q12: Find the facilities with their usage by member, but not guests */
* Query I used:
SELECT  name as facility, firstname,surname, slots
                        from Members as M
                        INNER JOIN Bookings as B ON M.memid = B.memid
                        LEFT JOIN Facilities as F ON F.facid = B.facid

                        WHERE M.memid>= 1
                        ORDER BY facility

/* Q13: Find the facilities usage by month, but not guests */

* Query used
SELECT name as Facility, strftime('%m',starttime) as Month, count(bookid) as Booking
FROM Facilities as F
INNER JOIN Bookings as B ON B.facid = F.facid
INNER JOIN Members as M ON M.memid = B.memid
 WHERE m.memid >= 1
 GROUP BY facility
 ORDER BY Month;