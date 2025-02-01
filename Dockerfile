# For more information, please refer to https://aka.ms/vscode-docker-python
FROM jedimyke/s3-iam-automation-image:latest

# Configure AWS CLI using environment variables
RUN mkdir -p /home/skywalker/.aws && \
    echo "[default]" > /home/skywalker/.aws/credentials && \
    echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/skywalker/.aws/credentials && \
    echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/skywalker/.aws/credentials && \
    echo "[default]" > /home/skywalker/.aws/config && \
    echo "region=$AWS_DEFAULT_REGION" >> /home/skywalker/.aws/config

# Set AWS environment variables
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

# Set entry point to run the entrypoint script first
ENTRYPOINT ["/entrypoint.sh"]

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD tail -f /dev/null
