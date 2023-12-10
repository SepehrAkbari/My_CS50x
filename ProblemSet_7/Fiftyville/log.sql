-- Keep a log of any SQL queries you execute as you solve the mystery.
-- to see reports
SELECT description, year
FROM crime_scene_reports
WHERE day = 28 AND month = 7
AND street = 'Humphrey Street';

-- see transcripts
SELECT transcript
FROM interviews
WHERE day = 28 AND month = 7 AND year = 2021;

-- finding LP
SELECT license_plate, activity
FROM bakery_security_logs
WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
AND activity = 'exit';

-- finding Account no
SELECT account_number
FROM atm_transactions
WHERE year = 2021 AND month = 7 AND day = 28
AND transaction_type = 'withdraw'
AND atm_location = 'Leggett Street';

-- finding phone number
SELECT caller
FROM phone_calls
WHERE year = 2021 AND month = 7 AND day = 28
AND duration < 60;

-- finding the person id from bank account
SELECT person_id
FROM bank_accounts
WHERE account_number IN (
    SELECT account_number
    FROM atm_transactions
    WHERE year = 2021 AND month = 7 AND day = 28
    AND transaction_type = 'withdraw'
    AND atm_location = 'Leggett Street'
)

-- fining their names
SELECT name
FROM people
WHERE id IN (
    SELECT person_id
    FROM bank_accounts
    WHERE account_number IN (
        SELECT account_number
        FROM atm_transactions
        WHERE year = 2021 AND month = 7 AND day = 28
        AND transaction_type = 'withdraw'
        AND atm_location = 'Leggett Street'
    )
)
AND phone_number IN (
    SELECT caller
    FROM phone_calls
    WHERE year = 2021 AND month = 7 AND day = 28
    AND duration < 60
)
AND license_plate IN (
    SELECT license_plate
    FROM bakery_security_logs
    WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
    AND activity = 'exit'
);

-- finding passport number
SELECT passport_number
FROM people
WHERE name IN (
    SELECT name
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE year = 2021 AND month = 7 AND day = 28
            AND transaction_type = 'withdraw'
            AND atm_location = 'Leggett Street'
        )
    )
    AND phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE year = 2021 AND month = 7 AND day = 28
        AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate
        FROM bakery_security_logs
        WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
        AND activity = 'exit'
    )
);

-- Finding airport name
SELECT full_name, abbreviation
FROM airports
WHERE city = 'Fiftyville';

-- Find Flight
SELECT id, destination_airport_id
FROM flights
WHERE year = 2021 AND month = 7 AND day = 29
AND origin_airport_id = (
    SELECT id
    FROM airports
    WHERE full_name = (
        SELECT full_name
        FROM airports
        WHERE city = 'Fiftyville'
    )
)
ORDER BY hour ASC
LIMIT 1;

-- thief's passport number
SELECT passport_number
FROM passengers
WHERE flight_id = (
    SELECT id
    FROM flights
    WHERE year = 2021 AND month = 7 AND day = 29
    AND origin_airport_id = (
        SELECT id
        FROM airports
        WHERE full_name = (
            SELECT full_name
            FROM airports
            WHERE city = 'Fiftyville'
        )
    )
    ORDER BY hour ASC
)
AND passport_number IN (
    SELECT passport_number
    FROM people
    WHERE name IN (
        SELECT name
        FROM people
        WHERE id IN (
            SELECT person_id
            FROM bank_accounts
            WHERE account_number IN (
                SELECT account_number
                FROM atm_transactions
                WHERE year = 2021 AND month = 7 AND day = 28
                AND transaction_type = 'withdraw'
                AND atm_location = 'Leggett Street'
            )
        )
        AND phone_number IN (
            SELECT caller
            FROM phone_calls
            WHERE year = 2021 AND month = 7 AND day = 28
            AND duration < 60
        )
        AND license_plate IN (
            SELECT license_plate
            FROM bakery_security_logs
            WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
            AND activity = 'exit'
        )
    )
);

-- THIEF
SELECT name
FROM people
WHERE passport_number = (
    SELECT passport_number
    FROM passengers
    WHERE flight_id = (
        SELECT id
        FROM flights
        WHERE year = 2021 AND month = 7 AND day = 29
        AND origin_airport_id = (
            SELECT id
            FROM airports
            WHERE full_name = (
                SELECT full_name
                FROM airports
                WHERE city = 'Fiftyville'
            )
        )
        ORDER BY hour ASC
    )
    AND passport_number IN (
        SELECT passport_number
        FROM people
        WHERE name IN (
            SELECT name
            FROM people
            WHERE id IN (
                SELECT person_id
                FROM bank_accounts
                WHERE account_number IN (
                    SELECT account_number
                    FROM atm_transactions
                    WHERE year = 2021 AND month = 7 AND day = 28
                    AND transaction_type = 'withdraw'
                    AND atm_location = 'Leggett Street'
                )
            )
            AND phone_number IN (
                SELECT caller
                FROM phone_calls
                WHERE year = 2021 AND month = 7 AND day = 28
                AND duration < 60
            )
            AND license_plate IN (
                SELECT license_plate
                FROM bakery_security_logs
                WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
                AND activity = 'exit'
            )
        )
    )
);

-- ESCAPE DEST.
SELECT city
FROM airports
WHERE id = (
    SELECT destination_airport_id
    FROM flights
    WHERE year = 2021 AND month = 7 AND day = 29
    AND origin_airport_id = (
        SELECT id
        FROM airports
        WHERE full_name = (
            SELECT full_name
            FROM airports
            WHERE city = 'Fiftyville'
        )
    )
    ORDER BY hour ASC
    LIMIT 1
);

-- ACCOMPLICE
SELECT name
FROM people
WHERE phone_number = (
    SELECT receiver
    FROM phone_calls
    WHERE caller = (
        SELECT phone_number
        FROM people
        WHERE license_plate IN (
            SELECT license_plate
            FROM bakery_security_logs
            WHERE day = 28 AND month = 7 AND hour = 10 AND minute > 15 AND minute < 25
            AND activity = 'exit'
        )
        AND name = 'Bruce'
    )
    AND year = 2021 AND month = 7 AND day = 28
    AND duration < 60
);
