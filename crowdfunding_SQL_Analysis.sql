-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT outcome, cf_id
FROM campaign
WHERE (outcome = 'live')
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id
FROM backers
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT contacts.first_name, contacts.last_name, contacts.email,  
(campaign.goal - campaign.pledged) AS "Remaining_Goal_Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts
LEFT JOIN campaign
ON contacts.contact_id = campaign.contact_id
WHERE campaign.outcome = 'live'
ORDER BY "Remaining_Goal_Amount" DESC;


SELECT *
FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT BK.email,
       BK.first_name, 
       BK.last_name, 
       BK.cf_id, 
       CP.company_name,
       CP.description,
       CP.end_date,
       (CP.goal-CP.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign as CP
LEFT JOIN backers as BK
ON CP.cf_id = BK.cf_id
WHERE CP.outcome = 'live'
GROUP BY BK.email,
       BK.first_name, 
       BK.last_name,
       BK.cf_id, 
       CP.company_name,
       CP.description,
       CP.end_date,
       "Left of Goal"
ORDER BY BK.last_name;

SELECT *
FROM email_backers_remaining_goal_amount