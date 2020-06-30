(parameter depth 32768 "a depth of analysis")
(parameter entry-points all-subroutines "where to search")
(parameter optimization 0 "optimization level")

(option primus-lisp-load
  posix
  memcheck-malloc)

(option primus-lisp-add $prefix)

(option passes
        with-no-return
        run)

(option primus-lisp-channel-redirect
  <stdin>:$prefix/stdin
  <stdout>:$prefix/stdout)

(option report-progress)
(option log-dir log)

(option run-entry-points ${entry-points})
(option constant-tracker-enable)

(option primus-promiscuous-mode)
(option primus-greedy-scheduler)
(option primus-print-output incidents)
(option primus-limit-max-length $depth)

(option primus-print-obs
  exception
  pc-changed
  jumping
  call
  call-return
  machine-switch
  machine-fork
  lisp-message
  incident
  incident-location)

(option optimization-level $optimization)
