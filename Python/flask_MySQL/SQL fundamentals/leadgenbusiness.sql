SELECT SUM(amount) AS total_amount
FROM billing
WHERE charged_datetime LIKE "%2012-03%";
 
 
SELECT SUM(amount) AS total_amount
FROM billing
WHERE client_id = 2;
 
 
SELECT clients.first_name, clients.last_name, sites.domain_name
FROM clients
JOIN sites
ON clients.client_id = sites.client_id
WHERE clients.client_id =10;

 
SELECT first_name, last_name, COUNT(sites.domain_name), MONTHNAME(created_datetime), YEAR(created_datetime)
FROM clients
JOIN sites
ON sites.client_id = clients.client_id
WHERE clients.client_id = 1
GROUP BY sites.domain_name;

SELECT sites.domain_name, COUNT(leads.leads_id) FROM sites
JOIN leads on leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY sites.site_id

SELECT clients.first_name, clients.last_name, COUNT(leads.leads_id) FROM sites
JOIN leads on leads.site_id = sites.site_id
JOIN clients on clients.client_id = sites.client_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY clients.client_id

SELECT clients.first_name, clients.last_name, MONTHNAME(leads.registered_datetime), COUNT(leads.leads_id) FROM sites
JOIN leads on leads.site_id = sites.site_id
JOIN clients on clients.client_id = sites.client_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-06-31'
GROUP BY clients.client_id

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id) FROM clients
JOIN sites on sites.client_id = clients.client_id
JOIN leads on leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN "2011-01-01" AND "2011-12-31"
GROUP BY sites.site_id
ORDER BY clients.client_id;

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id) FROM clients
JOIN sites on sites.client_id = clients.client_id
JOIN leads on leads.site_id = sites.site_id
GROUP BY sites.site_id
ORDER BY clients.client_id

SELECT clients.first_name, clients.last_name, SUM(billing.amount), MONTHNAME(billing.charged_datetime), YEAR(billing.charged_datetime) FROM billing
JOIN clients ON clients.client_id = billing.client_id
GROUP BY clients.first_name, MONTHNAME(billing.charged_datetime), YEAR(billing.charged_datetime)
ORDER BY clients.client_id, YEAR(billing.charged_datetime);

SELECT CONCAT(clients.first_name," ",clients.last_name), GROUP_CONCAT(" ",sites.domain_name) AS sites
FROM clients
JOIN sites
ON sites.client_id = clients.client_id
GROUP BY clients.first_name
