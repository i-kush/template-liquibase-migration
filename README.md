### Overview ###

Liquibase migration template as a separate service with separate release process.

### Local run ###

- docker should be installed
- see `local-run-db` dir - there are scripts for both Windows and Unix OS
- there is `local-run-db/docker-compose.yml` with the local PostgreSQL instance, which could be used for the local development
- see possible command in the section _Environment variables_ under the `LIQUIBASE_COMMAND` env variable description
- steps to apply migration scripts to the local env DB:
    - launch `docker-compose.yml` with the DB
    - launch OS-specific `local-run-db/local-liquibase-command`
    - if you need to run with custom values, i.e. test rollbacks, tags etc. then
      use OS-specific `local-run-db/local-liquibase-command-custom`, it seats under the `.gitignore`

### Environment variables ###

- `LIQUIBASE_COMMAND_URL` - JDBC URL of the DB, including the DB, e.g. `jdbc:postgresql://HOST:PORT/DB_NAME`
- `LIQUIBASE_COMMAND_USERNAME` - DB username
- `LIQUIBASE_COMMAND_PASSWORD` - DB password
- `LIQUIBASE_COMMAND` one of:
    - `update` - executes changesets applying
    - `tag --tag=anyTagNameForExampleReleaseTag` - marks latest changeset with a tag, could be used for a rollback later if needed
    - `rollback --tag=anyTagNameForExampleReleaseTag` - rollbacks all changesets until meets change with the following tag
    - `rollbak-count --count=1` - rollbacks specified in `count` param amount of changesets
- `NETWORK` - docker network to use if needed, could be empty (mandatory for the local run)

### Environment variables ###
Run isolated tests `docker-compose -f docker-compose-test.yml up --exit-code-from liquibase --no-attach test_postgres --remove-orphans` and verify exit code.

Could be applied on CI/CD - verifies both `rollback` and `update` operations.