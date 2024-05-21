INSERT INTO
    fileSample (
        file_name,
        file_url,
        file_type,
        date_create
    )
VALUES
    (
        @name,
        @url,
        @file_type,
        @date_create
    );