
(defmethod read (var val)
  (let ((taint (taint-get-direct 'must-be-used val))
        (addr (get-current-program-counter))
        (first-time (not (dict-has 'was-read taint))))
    (when (and taint first-time)
;;      (msg "mark-read $0 $1" taint (get-value-id taint))
      (dict-add 'was-read taint addr))))

(defmethod stored (addr val)
  (let ((taint (taint-get-direct 'must-be-used val))
        (prev (dict-get 'was-read taint))
        (addr (get-current-program-counter)))
    (when taint
      (when (= addr prev)
;;        (msg "unmark-read $0 $1" taint (get-value-id taint))
        (dict-del 'was-read taint)))))

(defmethod loaded (ptr val)
  (let ((taint (taint-get-direct 'must-be-used val)))
    (mark-used taint)
    (taint-sanitize-indirect 'must-be-used ptr)
    (taint-sanitize-direct   'must-be-used val)))

;; (defmethod taint-finalize (taint _)
;;   (let ((read (dict-has 'was-read taint))
;;         (unused (is-unused taint)))
;;     (when read
;;       (mark-used taint))
;;     (when (and (not read) unused)
;;       (mark-unused taint)
;;       (notify-unused taint))
;;     (mark-finalized taint)))

(defmethod taint-reached-finish (taint)
  (msg "we are here!!")
  (let ((read (dict-has 'was-read taint))
        (unused (is-unused taint)))
    (when read
      (mark-used taint))
    (when (and (not read) unused)
      (mark-unused taint)
      (notify-unused taint))
    (mark-finalized taint)))

;; (defun on-taint-finish(taint)
;; ;;  (msg "finishing $0 $1" taint (get-value-id taint))
;;   (let ((read (dict-has 'was-read taint))
;;         (unused (is-unused taint)))
;;     (when read
;; ;;      (msg "marking used $0" taint)
;;       (mark-used taint))
;;     (when (and (not read) unused)
;;       (mark-unused taint)
;;       (notify-unused taint))
;;     (mark-finalized taint)))

;; (defmethod fini ()
  ;; (let ((stop 0)
  ;;       (num 2)
  ;;       (i 0))
  ;;   (while num
  ;;     (let ((taint (get-machine-taint i)))
  ;;       (on-taint-finish taint)
  ;;       (decr num)
  ;;       (incr i)))))

(defun notify-unused (taint)
  (incident-report 'value-was-not-used (incident-location)))

(defmethod written (var val)
  (let ((name (dict-get 'call-return var)))
    (when name
      (let ((addr (get-current-program-counter))
            (old-taint (taint-get-direct 'must-be-used val)))
        (when old-taint
          (taint-sanitize-direct 'must-be-used val))
        (dict-del 'call-return var)
        (let ((taint (taint-introduce-directly 'must-be-used val)))
          (check-if-used taint name addr))))))

(defun is-ignored (name)
  (is-in name '__primus_linker_unresolved_call))

(defmethod call-return (name _ )
  (when (not (is-ignored name))
    (let ((addr (get-current-program-counter))
          (arg (return-arg name)))
      (dict-add 'call-return arg name))))
