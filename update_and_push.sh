# Update posts
zola_17 build

# Get commit message and push
read -p "Enter commit message: " commit_message
if [ -z "$commit_message" ]; then
    echo "Commit message is empty; exiting."
    exit 1
fi

git add .
git commit -m "$commit_message"
git push gh
git push gl

# Update website
ssh face 'bash ~/updatesite.sh'
