# Sonar Scanner .NET - Docker Image

This image provides a functional a runner to scan and create a Sonar coverage report to be sent to a custom SonarQube host.

This image is designed so it can be integrated in any CI/CD Pipeline within its own step.

## Usage

### Manual

For using the image, just go to the root folder of your .NET project and execute the following command:

```
docker run \
-e SONAR_PROJECT_KEY="YOUR_PROJECT_KEY" \
-e SONAR_ORGANIZATION_KEY="YOUR_ORGANIZATION" \
-e SONAR_HOST_URL="YOUR_SONAR_HOST" \
-e SONAR_TOKEN="YOUR_TOKEN" \
-v $(pwd):/usr/app \
dacamposol/sonarscanner-dotnet:5.0-alpine
```

or, in case that you want to persist it in an easy way for future executions, modify the values under the `start-scan.sh` script, place it the root folder of your .NET project and make it runnable with the command `chmod +x start-scan.sh`.

Then, perform the following command from the project folder:

```
./start-scan.sh
```

### Integration with GitHub Actions

In order to integrate the image within a GH Actions step, you can just include it as follows:

```
- name: SonarScanner
  run: |
    docker run --rm -v $PWD:/usr/app \
        -e SONAR_PROJECT_KEY={{ secrets.SONAR_PROJECT_KEY }} \
        -e SONAR_ORGANIZATION_KEY={{ secrets.SONAR_ORGANIZATION_KEY }} \
        -e SONAR_HOST_URL={{ secrets.SONAR_HOST_URL }} \
        -e SONAR_TOKEN={{ secrets.SONAR_TOKEN }} \
        dacamposol/sonarscanner-dotnet:5.0-alpine
```

### Integration with GitLab CI

In order to integrate the image within a GitLab stage, you can just include it as follows:

```
stages:
- test

sonar_scanner:
  stage: test
  tags:
    - shell
  script:
    - |
      docker run \
        -e SONAR_PROJECT_KEY="YOUR_PROJECT_KEY" \
        -e SONAR_ORGANIZATION_KEY="YOUR_ORGANIZATION" \
        -e SONAR_HOST_URL="YOUR_SONAR_HOST" \
        -e SONAR_TOKEN="YOUR_TOKEN" \
        -v $PWD:/usr/app \
        dacamposol/sonarscanner-dotnet:5.0-alpine
```
