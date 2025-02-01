#!/bin/bash
echo "✅ Container built successfully and is running!"

if [ "$#" -eq 0 ]; then
    exec python s3_iam_setup.py
else
    exec "$@"
fi
