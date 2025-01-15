(message "Exporting Agenda files to icalendar...")

(require 'ox-icalendar)

(let ((org-icalendar-combined-agenda-file "/ssh:caldav:calendar/org-emacs.ics"))
  (org-icalendar-combine-agenda-files))

(message "Files exported!")
