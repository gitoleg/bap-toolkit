;;
;; The algorithm itself is quite simple:
;; We taint every static zero that is saved into a register or a memory location
;; via stored/written methods. If the taint reaches any condition then we
;; consider this constant checked and no worries needed. Finally, if
;; there is a loading/storing operation with unchecked and tainted constant
;; then we trigger an incident.
;;
;; Analysis is written with keeping in mind that if a programmer
;; checked a pointer somehow - no matter if it was a correct check or not -
;; then using of the pointer is considered as a safe one. For example,
;; we apply this approach in the next case: mem [RAX + RBX] := 42,
;; when both registers hold zero and only one of them was checked -
;; in this case no incident will be emited

(require taint)

(defun notify-null-deref (taint)
  (let ((pc (get-current-program-counter))
        (start (dict-get 'intro taint))
        (intro (dict-get 'intro/location taint)))
    (when (not (is-reported-deref pc))
      (when start
        (msg "pointer was introduced at $0 from taint $1" start taint))
      (notify-null-ptr-dereference start pc)
      (incident-report 'null-ptr-deref (incident-location) intro))))

(defun is-null (ptr)
  (and (not ptr) (all-static-constant ptr)))

(defun check-deref-null-ptr (ptr)
  (when (is-null ptr)
    (let ((taint (taint-get-direct 'const-ptr ptr))
          (checked (dict-get 'checked-pointer taint)))
      (when (and taint (not checked))
        (notify-null-deref taint)))))

(defmethod jumping (x _)
  (let ((taint (taint-get-direct 'const-ptr x)))
    (when taint
      (dict-add 'checked-pointer taint taint))))

(defmethod written (v x)
  (when (not (taint-get-direct 'const-ptr x))
    (when (and (is-null x) (not (is-cpu-flag v)))
      (let ((taint (taint-introduce-directly 'const-ptr x)))
        (dict-add 'intro taint (get-current-program-counter))
        (dict-add 'intro/location taint (incident-location))))))

(defmethod stored (a x)
  (when (is-null x)
    (let ((taint (taint-introduce-directly 'const-ptr x)))
      (dict-add 'intro taint (get-current-program-counter))
      (dict-add 'intro/location taint (incident-location)))))

(defmethod storing (ptr)
  (check-deref-null-ptr ptr))

(defmethod loading (ptr)
  (check-deref-null-ptr ptr))
