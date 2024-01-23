;;; moss-study.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, study  ... ")


;; :TODO: Find a way of programatically getting the activity number, then add
;;        this to the creation. Also find the unit number via top heading?
(defun moss/add-activity ()
  "Add a heading that has a example box ready for the activity to be dropped in."
  (interactive)
  (org-insert-heading-respect-content)
  (insert "Activity")
  (newline-and-indent)
  (org-insert-structure-template "example")
  (move-end-of-line 1)
  (newline-and-indent)
  (org-insert-link "" "file:Activities/0-0.jpg")
  (newline-and-indent)
  (previous-line 3)
  (move-end-of-line 1)
  (insert " Activity "))


(provide 'moss-study)
;;; moss-study.el ends here -----------------------------------------------------
