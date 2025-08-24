#!/bin/bash

# Exit immediately if any command fails
set -e

# Deploy documentation using MkDocs
echo "Deploying documentation..."
if ! mkdocs gh-deploy --config-file ./mkdocs.yml --remote-branch gh-pages; then
    echo "❌ MkDocs deployment failed."
    exit 1
fi

# Push changes to main branch
echo "Pushing changes to main..."
if ! git add .; then
    echo "❌ Git add failed."
    exit 1
fi

if ! git commit -m "update doc"; then
    echo "❌ Git commit failed."
    exit 1
fi

if ! git push origin main; then
    echo "❌ Git push failed."
    exit 1
fi

echo "✅ Deployment and push completed successfully."
