SELECT
    [ID],
    [priority_code],
    [priority_name],
    [descriptions]
FROM
    [DSGAppraisalSoftwareX].[dbo].[PriorityLevels]
WHERE
    [priority_code] = @input;