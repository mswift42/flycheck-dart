;;; flycheck-dart.el --- Dart Support for flycheck using dartanalyzer.  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  martin haesler

;; Author: martin haesler
;; Keywords: tools, convenience
;; Version: 0.0.1
;; Package-Requires: ((flycheck "0.22") (dart-mode "0.11"))


;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

(require 'flycheck)

(flycheck-define-checker dart
  "A Python syntax and style checker using Pylint. "
  :command ("dartanalyzer" "--format=machine" source)
  :error-patterns
  ((error line-start "ERROR" "|" (message) "|"
          (file-name) "|" line "|"  column "|" column "|" line-end)

   (warning line-start "WARNING" "|" (message) "|"
          (file-name) "|" line "|"  column "|" column "|"  line-end)

   (info line-start "INFO" "|" (message) "|"
          (file-name) "|" line "|"  column "|" column "|"  line-end))
  :modes dart-mode)


(provide 'flycheck-dart)

;;; flycheck-dart.el ends here
