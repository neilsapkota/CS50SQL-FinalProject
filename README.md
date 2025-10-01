 CS50SQL-FinalProject
 --------------------------

 Youtube Video Link : https://youtu.be/YfblTx9nuYE
-----------------------------------------------------


 Project Overview
-----------------
The goal of this project is to build a database system that tracks the protests by Gen Z in Nepal,
including cities, platforms used for digital coordination, casualties,government responses, and related information.
 The purpose of this database is to provide a comprehensive view of the protests, their size, the government's actions, and the role of digital platforms in coordinating these movements.

This system serves the needs of researchers, journalists, and activists who wish to analyze the details and outcomes of various protests organized by the Gen Z movement in Nepal,
 particularly in relation to governmental measures and digital platform involvement.



Purpose
--------
The primary objective of this database is to track the events surrounding Gen Z protests in Nepal.
 The database stores key details such as:

-Cities: Locations where protests occur.
-Protests: Information about each protest, including the organizing group and participation data.
-Casualties: Data on casualties (injuries and deaths) during protests.
-Government Responses: Actions taken by the government in response to the protests.
-Digital Coordination: Platforms and methods used by protestors to organize and communicate.




Scope
-------
This database captures and stores information for the following entities:

-Cities: Locations of protests.
-Platforms: Social media and communication platforms used for coordination.
-Protests: Key events organized by Gen Z groups.
-Casualties: Injury and death statistics during protests.
-Government Responses: Measures taken by the government, such as curfews, social media bans, etc.
-Digital Coordination: Platforms used for virtual organization and coordination of protests.



The system aims to:
--------------------
-Enable analysis of protest size and casualties.
-Track platform bans and restorations.
-Observe the impact of government responses.
-Monitor digital coordination and participant engagement.




Entities and Relationships
---------------------------

Entities:


Cities:
--------
Represents different cities in Nepal where protests occurred.
Attributes: city_id, name, region, death.



Platforms:
------------
Represents the platforms banned and restored during the protests.
Attributes: platform_id, name, date_banned, date_restored.



Protests:
----------
Represents individual protest events.
Attributes: protest_id, city_id (foreign key), date, organizing_group, expected_size, actual_size



Casualties:
------------
Records injuries and deaths during protests.
Attributes: casualty_id, protest_id (foreign key), type (Injury/Death), number.



GovtResponses:
--------------
Captures the government’s response to protests.
Attributes: response_id, protest_id (foreign key), measure, date



DigitalCoordination:
---------------------
Tracks platforms used for virtual coordination during protests.
Attributes: id, protest_id (foreign key), platform, purpose, participants.





Relationships:

Cities → Protests: A city can have many protests, but each protest happens in one city.
Protests → Casualties: A protest can have many casualties (both injuries and deaths).
Protests → GovtResponses: Each protest can have multiple government responses.
Protests → DigitalCoordination: Each protest may involve digital platforms used for coordination.

Entity Relationship Diagram

Below is the Entity Relationship Diagram (ERD) that illustrates the structure of the database:



Database Design Choices
------------------------
Normalization:

-The database has been designed with normalization principles in mind to ensure minimal redundancy.
-Each table serves a distinct purpose, and foreign keys are used to link entities together.

Specifically:
--------------
-The Cities table contains information about cities where protests occur.
-The Protests table references the Cities table to relate each protest to a specific city.
-The Casualties, GovtResponses, and DigitalCoordination tables all reference the Protests table,
 ensuring that data about casualties, responses, and digital coordination is linked to a specific protest.



Indexing:
----------
Indexes have been created on frequently queried columns (e.g., city_id, protest_id) to improve query performance, particularly for lookups, joins, and aggregations.
This ensures that the database can efficiently handle queries on large datasets.



Foreign Keys and Integrity Constraints:
----------------------------------------
Foreign keys have been used to ensure referential integrity between tables, making sure that data in one table (e.g., Protests) is always consistent with data in another (e.g., Cities).

For example:

-The Protests table references Cities(city_id), ensuring that protests are always tied to a valid city.
-The Casualties and GovtResponses tables reference Protests(protest_id) to guarantee that casualty and response data is always associated with a protest.



Check Constraints:
-------------------
For the Casualties table, the type attribute has a check constraint to ensure that only valid types ("Injury" or "Death") are allowed.
This helps maintain data consistency and avoids errors.



Optimizations
--------------
-Indexes: Added indexes on key columns such as protest_id and city_id to speed up SELECT and JOIN operations.
-Views: Created several views for common queries:
-ProtestSummary: Provides a summary of protests, including participation and casualties.
-GovtResponseSummary: Displays the government's responses to protests.
-ProtestsByCity: Shows a list of protests for each city, including government responses.



Limitations
------------
-Scalability: The current design is suitable for tracking protests in a specific geographic region (Nepal) but may need adjustments if the scope expands to other countries or regions.

-Temporal Data: The database records the ban and restoration dates for platforms but does not track the historical changes over time.
                A more detailed version could log every change to platforms, protests, or government responses.

-Missing Data: The database assumes that each protest will have a recorded response and digital coordination. If data is missing for any protest, it could lead to incomplete analyses.




Conclusion
-----------
-This database design aims to provide a comprehensive and efficient way to store and analyze information about the Gen Z protests in Nepal.
-The entity structure, relationships, and use of foreign keys and indexes help ensure the database is optimized for both performance and data integrity.
-The views provide quick insights into protest summaries, government responses, and coordination efforts across platforms.
