SELECT
    [ID],
    [vocative_code],
    [vocative_name],
    [descriptionz],
    [is_follow],
    [create_date]
FROM
    [DSGAppraisalSoftwareX].[dbo].[Vocative]
WHERE
    [vocative_code] = @input;