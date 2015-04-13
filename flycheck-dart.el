;;; flycheck-dart.el --- Dart Support for flycheck using dartanalyzer.  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  martin haesler

;; Author: martin haesler
;; Keywords: tools, convenience
;; Version: 0.0.1

(require 'flycheck)

(flycheck-define-checker dart
  "A Python syntax and style checker using Pylint. "
  :command ("dartanalyzer" "--format=machine" source)
  :error-patterns 
 ((error line-start "ERROR" "|" (message) "|" 
          (file-name) "|" line "|"  column "|" column "|" line-end)

   (warning line-start "WARNING" "|" (message) "|" (message) "|"
          (file-name) "|" line "|"  column "|" column "|" (message) line-end)

   (info line-start "INFO" "|" (message) "|" (message) "|"
          (file-name) "|" line "|"  column "|" column "|" (message) line-end))
  :modes dart-mode)


(provide 'flycheck-dart)

;;; flycheck-dart.el ends here
