# Get the current branch name directly using command substitution
CURRENT_BRANCH=$(git branch --show-current)

# Check if the command was successful and a branch name was found
if [ -z "$CURRENT_BRANCH" ]; then
    echo "Error: Could not determine the current Git branch."
    exit 1
fi

mvn clean verify sonar:sonar \
  -Dsonar.organization=e-corp-cloud \
  -Dsonar.projectKey=e-corp-cloud_JavaCoffeeShop \
  -Dsonar.projectName='JavaCoffeeShop' \
  -Dsonar.sources=src/main/java,src/main/resources/templates \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.branch.name=$CURRENT_BRANCH
