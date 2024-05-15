INSERT INTO
    fileSample (
        file_name,
        file_url,
        is_single,
        is_checked,
        is_show,
        date_create
    )
VALUES
(
        @name,
        @url,
        @is_single,
        @is_checked,
        @is_show,
        @date_create
    );