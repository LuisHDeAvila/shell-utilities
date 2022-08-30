#!/usr/bin/env bash
# directivas para shell's
# https://wiki.archlinux.org/title/Shell_package_guidelines
set -e
post_install() {
    grep -Fqx /bin/shellname /etc/shells || echo /bin/shellname >>/etc/shells
    grep -Fqx /usr/bin/shellname /etc/shells || echo /usr/bin/shellname >>/etc/shells
}

post_upgrade() {
    post_install
}

post_remove() {
    sed -i -r '/^(\/usr)?\/bin\/shellname$/d' etc/shells
}