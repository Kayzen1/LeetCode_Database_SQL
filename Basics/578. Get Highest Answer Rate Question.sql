"Can check the question through this link: https://leetcode.ca/all/578.html"

"Solution 1"
SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY 1
ORDER BY SUM(action = 'answer') / SUM(action = 'show') DESC, 1
LIMIT 1;

"Solution 2"
WITH
    T AS (
        SELECT
            question_id AS survey_log,
            (SUM(action = 'answer') OVER (PARTITION BY question_id)) / (
                SUM(action = 'show') OVER (PARTITION BY question_id)
            ) AS ratio
        FROM SurveyLog
    )
SELECT survey_log
FROM T
ORDER BY ratio DESC, 1
LIMIT 1;