#          _             _
#      ___| | ___   __ _(_)_ __
#     |_  / |/ _ \ / _` | | '_ \
#    _ / /| | (_) | (_| | | | | |
#   (_)___|_|\___/ \__, |_|_| |_|
#                  |___/

#^#---- TIRAMISU ---------------------------------------------------------------
(which tiramisu >/dev/null 2>&1 && \
! pgrep -x tiramisu >/dev/null 2>&1) && \
    tiramisu -j >> $NOTIFICATIONS &
#$#

#^#---- OMISU ------------------------------------------------------------------
(which omisu >/dev/null 2>&1 && \
! pgrep -x omisu >/dev/null 2>&1) && \
    omisu &
#$#

# vim: fdm=marker fmr=#^#,#$#
