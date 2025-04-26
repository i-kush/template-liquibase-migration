docker run \
  -e LIQUIBASE_COMMAND_USERNAME \
  -e LIQUIBASE_COMMAND_PASSWORD \
  -e LIQUIBASE_COMMAND_URL \
  --rm \
  ${NETWORK} \
  -v ./changelog:/liquibase/changelog \
  liquibase/liquibase:4.31.0 \
  --changelog-file=./changelog/changelog.xml \
  ${LIQUIBASE_COMMAND}