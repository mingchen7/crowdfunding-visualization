SELECT AA.*
FROM 

(
SELECT PP.SCHOOL_STATE AS TO_STATE,
  DD.DONOR_STATE       AS FROM_STATE,
  SUM(DD.DNTN_TOTAL)   AS DONATION_AMOUNT
FROM PROJECTS PP
INNER JOIN DONATIONS DD
ON PP.PROJECTID = DD.PROJECTID
GROUP BY PP.SCHOOL_STATE,
  DD.DONOR_STATE)
  PIVOT(SUM(DONATION_AMOUNT) FOR TO_STATE IN ('NH',
'MD',
'OR',
'MN',
'HI',
'DE',
'UT',
'VA',
'NE',
'VT',
'ID',
'AK',
'MA',
'WA',
'WI',
'NV',
'WY',
'CT',
'FL',
'ND',
'PA',
'IA',
'CO',
'IL',
'MO',
'SD',
'MI',
'NJ',
'RI',
'OH',
'KS',
'IN',
'ME',
'NC',
'CA',
'MT',
'GA',
'NY',
'KY',
'TN',
'SC',
'AZ',
'WV',
'OK',
'AR',
'TX',
'AL',
'NM',
'LA',
'MS')
) AA
LEFT JOIN
POVERTY_RANK BB
ON AA.FROM_STATE = BB.NAME
WHERE FROM_STATE IN ('NH',
'MD',
'OR',
'MN',
'HI',
'DE',
'UT',
'VA',
'NE',
'VT',
'ID',
'AK',
'MA',
'WA',
'WI',
'NV',
'WY',
'CT',
'FL',
'ND',
'PA',
'IA',
'CO',
'IL',
'MO',
'SD',
'MI',
'NJ',
'RI',
'OH',
'KS',
'IN',
'ME',
'NC',
'CA',
'MT',
'GA',
'NY',
'KY',
'TN',
'SC',
'AZ',
'WV',
'OK',
'AR',
'TX',
'AL',
'NM',
'LA',
'MS')
ORDER BY TO_NUMBER(BB.RANK)