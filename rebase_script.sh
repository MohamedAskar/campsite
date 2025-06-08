#!/bin/bash

# Create a temporary rebase script
cat > /tmp/rebase_todo <<EOF
reword 9396876 feat: enhance core infrastructure
reword ec55d53 feat: improve domain layer entities  
reword 0e29ea1 feat: update data layer models
reword fbc67e8 feat: redesign presentation layer
reword d4dae8b feat: add new assets and dependencies
reword 70109ba chore: update iOS configuration
reword 5ac51d1 chore: cleanup project structure
EOF

# Export the commit messages
export GIT_SEQUENCE_EDITOR="cp /tmp/rebase_todo"

# Set up commit messages for each reword
cat > /tmp/commit_msg_1 <<EOF
feat: enhance core infrastructure
EOF

cat > /tmp/commit_msg_2 <<EOF
feat: improve domain layer entities
EOF

cat > /tmp/commit_msg_3 <<EOF
feat: update data layer models
EOF

cat > /tmp/commit_msg_4 <<EOF
feat: redesign presentation layer
EOF

cat > /tmp/commit_msg_5 <<EOF
feat: add new assets and dependencies
EOF

cat > /tmp/commit_msg_6 <<EOF
chore: update iOS configuration
EOF

cat > /tmp/commit_msg_7 <<EOF
chore: cleanup project structure
EOF

# Start the rebase
git rebase -i HEAD~7 