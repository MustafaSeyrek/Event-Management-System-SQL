# Event-Management-System-SQL
In this assignment, you are asked to design a database model for an event management and attendance tracking system like EventBrite. The detailed scenario and business rules are given in the below.

Scenario and Business Rules
Event management is a process used to effectively manage events and everything related to them. It
could be considered as a type of project management.
Organizing an event is a lot of work! If you’ve ever tried to organize an event for more than ten
people you asked yourself the following questions: Have we invited everyone? Have they confirmed
if they are coming? Is the venue booked and prepared? Who will host the event? Who will participate
in the various parts? There are many other questions to answer, and things could easily go wrong.
You can do all your planning with paper and pen, but why not use an app? It’s more convenient! Any
app will need a place to store all the necessary event information. This is where our event
management data model enters this story.
In this system, the events will be organized in different categories. Each category has ID and name.
Each event will be managed by an organizator. Each organizator can login the system via the
username and password and can edit the organization information such as its name, address, charged
personnel, contact information (phone, e-mail). They will create an event and enter the details about it.
These details are event’s category, name, address, county, city, start and end date, price, the quota of
attendees, campaign information (if it is available, the discount rate must be given), description. Also,
the members register the system. In registration step, they will enter name, surname, username,
password, birthdate, e-mail. Firstly, each member is in a “standard” type of membership. After
participation, if a member has paid for 3 events, its membership type changes to “gold” membership
type. The gold members have a 10% discount rate for each event. After registration, they can login the
system with username and password. Member can’t participate any event at the same time. Each
participation sends an invoice to member’s e-mail. The invoice contains the event’s detail (event’s
name, date, location, amount of payment). Also, if the quota is full, nobody will participate.

Write the SQLs of the following queries:
1) Find the events which will be host in Izmir.
2) Find the event (event’s name, category name, organizators name) which was held
with the highest attendance and the total obtained revenue.
3) Find the total number of events for each category in a descending order.
4) Find the past events in which the members (whose age is between 18-25) participated.
5) Find the past events in which the total number of participated members is less than
(not equal) 3.
6) List the members who attended at least 3 events and update these members’
membership type to gold.
7) Delete the “academic” events which will be organized by Dokuz Eylül University at
19th May 2019.
8) Return the member’s email address who paid at most.
9) Update the discount rate of events which will be organized at cities whose name starts
with ‘İ’ as “25”.
10) Delete the members who have not participated in any events.
