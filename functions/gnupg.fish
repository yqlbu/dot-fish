# References: https://github.com/drduh/YubiKey-Guide/issues/89#issuecomment-1501886324
# Ensure that GPG Agent is used as the SSH agent
set -x KEY_SERIAL (gpg-connect-agent 'scd serialno' /bye | head -n 1 | cut -f3 -d ' ')
set -x GNUPGHOME "$HOME/.gnupg" 
set -x PINENTRY_USER_DATA "USE_CURSES=1"
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1
