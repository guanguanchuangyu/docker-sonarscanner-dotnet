cd /usr/app

set -e

dotnet sonarscanner begin \
  /k:"${SONAR_PROJECT_KEY}" \
  /d:sonar.host.url="${SONAR_HOST_URL}" \
  /d:sonar.login="${SONAR_TOKEN}" \
  /d:sonar.scanner.skipJreProvisioning=true \
  /d:sonar.cs.opencover.reportsPath=/coverage.opencover.xml

dotnet restore
dotnet publish --output /out/
dotnet test \
  /p:CollectCoverage=true \
  /p:CoverletOutputFormat=opencover \
  /p:CoverletOutput="/coverage"

dotnet sonarscanner end /d:sonar.login="${SONAR_TOKEN}"