;;; evil-hide-cursor.el --- erase the cursor while using the evil mode  -*- lexical-binding: t; -*-
;; Copyright (C) 2022  nilninull

;; Author: nilninull <nilninull@gmail.com>
;; Keywords: extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; While using evil-mode, if set cursor-type to nil to make the cursor
;; disappear, the cursor is redisplayed.

;; This mode was created to suppress this feature.

;;; Code:

;; (define-minor-mode evil-hide-cursor-mode
;;   "the cursor hiding in evil buffer" nil "" nil
;;   (unless (local-variable-p 'evil-refresh-cursor)
;;     (make-local-variable 'evil-refresh-cursor))
;;   (if evil-hide-cursor-mode
;;       (setq evil-refresh-cursor nil
;;	    cursor-type nil)
;;     (setq evil-refresh-cursor t)
;;     (evil-refresh-cursor)))

;;;###autoload
(define-minor-mode evil-hide-cursor-mode
  "The cursor hiding in evil buffer."
  :lighter " Ehc"
  (when evil-hide-cursor-mode
    (setq cursor-type nil)))

(define-advice evil-refresh-cursor (:around (orig &rest args) evil-hide-cursor)
  (unless evil-hide-cursor-mode
    (apply orig args)))

(provide 'evil-hide-cursor)
;;; evil-hide-cursor.el ends here
