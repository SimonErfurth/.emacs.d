
;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/") t)
;;; remove SC if you are not using sunrise commander and org if you like outdated packages
;; (setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
;;                          ("gnu"   . "http://elpa.gnu.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")
;;                          ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "PDF Tools")
     (output-html "xdg-open")))
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(avy-keys '(113 119 101 97 115 100 122 120 99))
 '(cdlatex-paired-parens "$[{(")
 '(custom-safe-themes
   '("e8830baf7d8757f15d9d02f9f91e0a9c4732f63c3f7f16439cc4fb42a1f2aa06" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e39ff005e524c331b08d613109bff0b55fc21c64914c4a243faa70f330015389" default))
 '(elpy-rpc-python-command "python3")
 '(emojify-emoji-styles '(github unicode))
 '(eyebrowse-mode t)
 '(git-gutter:hide-gutter t)
 '(git-gutter:update-interval 2)
 '(helm-completion-style 'helm)
 '(helm-ff-lynx-style-map t)
 '(helm-imenu-lynx-style-map t t)
 '(helm-occur-use-ioccur-style-keys t)
 '(hippie-expand-try-functions-list
   '(yas-hippie-try-expand try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol))
 '(ispell-dictionary nil)
 '(lsp-ltex-version nil)
 '(org-babel-load-languages '((emacs-lisp . t) (python . t) (java . t) (R . t)))
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . emacs)))
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)
     ("" "libertine" t nil)
     ("scaled=0.89" "inconsolata" t nil)
     ("" "minted" t nil)))
 '(org-structure-template-alist
   '(("a" . "export ascii")
     ("c" . "center")
     ("C" . "comment")
     ("e" . "example")
     ("E" . "export")
     ("h" . "export html")
     ("l" . "export latex")
     ("q" . "quote")
     ("s" . "src")
     ("v" . "verse")
     ("b" . "src emacs-lisp")))
 '(package-selected-packages
   '(matlab-mode latex-table-wizard workgroups2 doom-themes doom-modeline nano-theme blamer hc-zenburn-theme zenburn-theme mu4e-alert org-mu4e mu4e helm-sage sage-shell-mode dirvish org-attach-screenshot diff-hl lsp-pyright diredfl js2-refactor emacs-everywhere everywhere helm-navi lsp-ltex lsp-ui company-lsp lsp-mode js2-mode json-mode org-tree-slide embark marginalia elpy org pdf-tools org-pdftools memory-usage i3wm-config-mode bufler goto-chg emojify lorem-ipsum helm-config use-package-chords volatile-highlights ag hydra xkcd company-math git git-gutter diminish org-noter ox-reveal ox-twbs org-bullets htmlize sudo-edit magithub magit-todos magit company-bibtex auctex-latexmk cdlatex company-auctex auctex company-shell company-lua slime-company slime company-jedi company-irony company-c-headers flycheck-clang-analyzer company flycheck yasnippet-snippets yasnippet auto-dictionary zzz-to-char hungry-delete rainbow-delimiters rainbow-mode beacon multiple-cursors undo-tree expand-region avy swiper eyebrowse switch-window which-key ivy-historian historian spaceline winum dashboard projectile all-the-icons-dired restart-emacs async pretty-mode zerodark-theme use-package))
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(use-file-dialog nil)
 '(visual-line-fringe-indicators '(left-curly-arrow nil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
(put 'LaTeX-narrow-to-environment 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
