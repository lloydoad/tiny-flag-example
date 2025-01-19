#!/bin/bash

# Define paths
WORKSPACE_PATH=".."
EXAMPLE_REPO_PATH="$WORKSPACE_PATH/example-repo"
TINY_FLAGS_PATH="$WORKSPACE_PATH/tiny-flags"
ACTIONS_PATH="$EXAMPLE_REPO_PATH/.github/actions"
LOCAL_TINY_FLAGS_PATH="$ACTIONS_PATH/tiny-flags"

# Create the actions directory if it doesn't exist
mkdir -p "$ACTIONS_PATH"

# Copy tiny-flags into the actions directory, excluding the .git directory
rsync -av --exclude='.git' "$TINY_FLAGS_PATH/" "$LOCAL_TINY_FLAGS_PATH"

# Navigate to the example-repo directory
cd "$EXAMPLE_REPO_PATH"

# Run act
act -j update --container-architecture linux/amd64

# Clean up by removing the copied tiny-flags directory
rm -rf "$LOCAL_TINY_FLAGS_PATH"

# Remove the actions directory if it is empty
if [ -d "$ACTIONS_PATH" ] && [ -z "$(ls -A "$ACTIONS_PATH")" ]; then
  rmdir "$ACTIONS_PATH"
fi