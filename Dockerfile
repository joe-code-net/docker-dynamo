# DynamoDB in Docker
#
# Documentation:# https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html## Use JDK version 6.x or newer
#
# FROM openjdk:latest
FROM openjdk

# Maintainer metadata
LABEL mainatainer="Joe Code Net"

# Create application folder
RUN mkdir -p opt/dynamodb
WORKDIR /opt/dynamodb

# Download Dynamodb
RUN wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz -q -O - | tar -xz

# DynamoDB uses port 8000 by Default
EXPOSE 8000

#The entrypoint for DynamoDB jar
ENTRYPOINT ["java", "-jar", "DynamoDBLocal.jar", "-sharedDb"]