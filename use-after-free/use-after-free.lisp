(require memcheck)

(defmethod call (name ptr)
  (when (and ptr (= name 'free)
             (not (= ptr *malloc-zero-sentinel*)))
    (when (not (memcheck-is-in-heap 'malloc ptr))
      (memcheck-acquire 'malloc ptr 1))
    (memcheck-release 'malloc ptr)))

(defmethod loaded (ptr)
  (memcheck-access 'malloc ptr))

(defmethod stored (ptr)
  (memcheck-access 'malloc ptr))

(defmethod call-return (name len ptr)
  (when (and len ptr (= name 'malloc))
    (memcheck-acquire 'malloc ptr len)))
