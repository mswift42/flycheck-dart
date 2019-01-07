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
  "Dart static analyzer using dartanalyze.
https://github.com/dart-lang/sdk/tree/master/pkg/analyzer_cli#dartanalyzer"
  :command ("dartanalyzer" "--format=machine" source)
  :error-patterns
  ((error line-start "ERROR" "|" (= 2 (+ (any "A-Z" "a-z" "0-9" "_")) "|")
          (file-name) "|" line "|" column "|" (one-or-more (any digit)) "|"
          (message) line-end)

   (warning line-start "WARNING" "|" (= 2 (+ (any "A-Z" "a-z" "0-9" "_")) "|")
          (file-name) "|" line "|" column "|" (one-or-more (any digit)) "|"
          (message) line-end)

   (info line-start "INFO" "|" (= 2 (+ (any "A-Z" "a-z" "0-9" "_")) "|")
          (file-name) "|" line "|" column "|" (one-or-more (any digit)) "|"
          (message) line-end))
  :modes dart-mode)

(add-to-list 'flycheck-checkers 'dart)

(provide 'flycheck-dart)

;;; flycheck-dart.el ends here
