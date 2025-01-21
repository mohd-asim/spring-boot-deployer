CREATE PROCEDURE ComplexProcedure
    @TableName VARCHAR(128),
    @ColumnName VARCHAR(128),
    @Value INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    DECLARE @ParmDefinition NVARCHAR(500);
    DECLARE @Count INT;

    BEGIN TRY
        -- Start a transaction.
        BEGIN TRANSACTION;

        -- Form a dynamic SQL statement.
        SET @SQL = N'SELECT @Count = COUNT(*) FROM ' + QUOTENAME(@TableName) +
                    ' WHERE ' + QUOTENAME(@ColumnName) + ' = @Value';
        SET @ParmDefinition = N'@Value INT, @Count INT OUTPUT';

        -- Execute the dynamic SQL.
        EXECUTE sp_executesql @SQL, @ParmDefinition, @Value = @Value, @Count = @Count OUTPUT;

        -- If there are more than 10 rows meeting the criteria, do something.
        IF @Count > 10
        BEGIN
            -- Form another dynamic SQL statement.
            SET @SQL = 'DELETE FROM ' + QUOTENAME(@TableName) +
                       ' WHERE ' + QUOTENAME(@ColumnName) + ' = @Value';

            -- Execute the dynamic SQL.
            EXECUTE sp_executesql @SQL, @ParmDefinition, @Value = @Value;
        END;

        -- Transaction is committed if no errors occur.
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if there were any errors.
        ROLLBACK TRANSACTION;

        -- Re-throw the original error details.
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
