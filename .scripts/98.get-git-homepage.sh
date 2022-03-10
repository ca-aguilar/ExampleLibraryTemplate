#! /bin/sh

LIBRARY_ORIGIN="$(git config --get remote.origin.url)"

LIBRARY_SSH_URL=""
LIBRARY_HTTPS_URL=""

# Set repo URL (ssh and https)
if [[ $LIBRARY_ORIGIN == git* ]]; then
	LIBRARY_SSH_URL=$LIBRARY_ORIGIN
	LIBRARY_HTTPS_URL=$(git remote get-url origin | sed -E 's,^git@([^:]*):/*(.*)$,https://\1/\2,')
else
	LIBRARY_HTTPS_URL=$LIBRARY_ORIGIN
	LIBRARY_SSH_URL=$(git remote get-url origin | sed -E 's,^https://([^/]*)/(.*)$,git@\1:\2,')
fi

echo $LIBRARY_HTTPS_URL