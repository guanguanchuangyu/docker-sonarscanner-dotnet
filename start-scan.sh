# !/bin/sh

## Place this script in the root folder of your .NET project

docker run \
  -e SONAR_PROJECT_KEY="YOUR_PROJECT_KEY" \
  -e SONAR_ORGANIZATION_KEY="YOUR_ORGANIZATION" \
  -e SONAR_HOST_URL="YOUR_SONAR_HOST" \
  -e SONAR_TOKEN="YOUR_TOKEN" \
  -v $(pwd):/usr/app \
  dacamposol/sonarscanner-dotnet:5.0-alpine