export LIQUIBASE_COMMAND_URL="jdbc:postgresql://local_test_db:5432/local_test_db"
export LIQUIBASE_COMMAND_USERNAME="local"
export LIQUIBASE_COMMAND_PASSWORD="local"
export LIQUIBASE_COMMAND="update"
#export LIQUIBASE_COMMAND="rollback-count --count=1"
#export LIQUIBASE_COMMAND="tag --tag=my-local-release-tag"
#export LIQUIBASE_COMMAND="rollback --tag=my-local-release-tag"
export NETWORK="--network local-run-db_local_test_network"

cd ../
sh liquibase-command.sh
