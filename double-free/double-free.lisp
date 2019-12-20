(require memcheck)

(defmethod call (name ptr)
  (when (and ptr (= name 'free)
             (not (= ptr *malloc-zero-sentinel*)))
    (memcheck-release 'malloc ptr)))

(defmethod call-return (name len ptr)
  (when (and len ptr (= name 'malloc))
    (memcheck-acquire 'malloc ptr len)))