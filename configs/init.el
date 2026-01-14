;; --- Настройка пакетного менеджера ---
(require 'package)

;; Настроим список архивов. Попробуем начать с официальных адресов.
;; Если они будут блокироваться, можно будет легко переключиться на зеркала.
;;(setq package-archives
;;      '(("gnu"   . "https://elpa.gnu.org/packages/")
;;        ("melpa" . "https://melpa.org/packages/")
;;        ("org"   . "https://orgmode.org/elpa/") ; Раскомментируйте, если нужен org-elpa
;;        ))

;; Если официальные сайты не работают, раскомментируйте следующие строки и закомментируйте блок выше.
(setq package-archives
      '(("gnu"   . "https://mirrors.ustc.edu.cn/elpa/gnu/")
        ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
        ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; Инициализация системы пакетов
(package-initialize)

;; Убедимся, что use-package установлен
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ;; Обновляем список пакетов перед установкой
  (package-install 'use-package))

;; Загружаем use-package
(require 'use-package)

;; --- Настройки внешнего вида и поведения ---
;; Отключение резервных копий и автосохранения
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t) ; Отключить начальный экран

;; Включить отображение номеров строк
(global-display-line-numbers-mode 1)

;; Отключить тулбар и скроллбар
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Ido mode для удобства
(ido-mode 1)
(ido-everywhere 1)

;; Настройка шрифта (убедитесь, что шрифт Hack Nerd Font установлен в системе)
(set-face-attribute 'default nil
                    :family "Hack Nerd Font"
                    :height 100
                    :weight 'normal
                    :width 'normal)

;; --- Управление пакетами с помощью use-package ---
;; Тема
;(use-package catppuccin-theme
;  :ensure t
;  :init
;  (setq catppuccin-flavor 'mocha) ;; Выбираем именно темный вариант Mocha
;  :config
;  (load-theme 'catppuccin t))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

;; Company-mode (автодополнение)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  ;; Настраиваем список источников (backends)
  ;; 'company-capf — это основной источник (код), 'company-files — пути к файлам
  (setq company-backends '((company-capf :with company-files)
                           (company-dabbrev-code company-keywords)
                           company-dabbrev))

  (setq company-minimum-prefix-length 2 ;; Начинать с 2 символов
        company-idle-delay 0.1          ;; Я уменьшил до 0.1 для мгновенного отклика
        company-selection-wrap-around t ;; Позволяет зациклить список (после конца в начало)
        company-tooltip-align-annotations t) ;; Чтобы типы данных (если есть) были прижаты вправо

  ;; Чтобы меню не дергалось при наборе
  (setq company-tooltip-limit 10)) ;; Максимум 10 строк в меню
  

;; Yaml-mode
(use-package yaml-mode
    :ensure t
    :mode "\\.yml\\'\\|\\.yaml\\'")

;; Поддержка синтаксиса Dockerfile
(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")


;; Magit (Git)
;;(use-package magit
;;  :ensure t
  ;; Можно добавить горячую клавишу, например C-x g
  ;; :bind (("C-x g" . magit-status))
;; )

;; LSP Mode (раскомментируйте, когда будете готовы настраивать LSP)
;(use-package lsp-mode
;  :ensure t
;  :init
  ;; Ускоряем работу (LSP очень прожорлив)
;  (setq lsp-keymap-prefix "C-c l")
;  :hook (;; Список языков, где включать LSP (добавьте свои)
;         (python-mode . lsp)
;         (js-mode . lsp)
         ;; Включаем интеграцию с UI
;         (lsp-mode . lsp-enable-which-key-integration))
;  :commands lsp)

;(use-package lsp-ui
;  :ensure t
;  :commands lsp-ui-mode
;  :config
;  (setq lsp-ui-doc-enable t)       ; Показывать документацию при наведении
;  (setq lsp-ui-sideline-enable t)) ; Показывать ошибки справа от строки

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-panel           t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               nil
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-outline-config         ':exact
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.git" "/__pycache__/")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-desc
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-word-wrap                       nil
          treemacs-use-follow-mode                 'always
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-step                      1
          treemacs-width-is-initially-locked       t
          treemacs-display-current-project-exclusively nil
          treemacs-font-lock                       'all
          treemacs-ignore-buffers-on-expand        nil
          treemacs-filewatch-mode                  t
          treemacs-hide-gitignored-files-mode      nil
          treemacs-follow-mode                     t
          treemacs-collapsed-directories           0
          treemacs-workspace-switch-cleanup        nil)

    (treemacs-filewatch-mode t)
    (treemacs-follow-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;; Подсвечивать линии отступов
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  ;; Варианты отображения: 'fill, 'column, 'character или 'bitmap
  (setq highlight-indent-guides-method 'character)
  
  ;; Символ для линии (можно поставить "|", "¦", "┆" или "│")
  (setq highlight-indent-guides-char ?│)
  
  ;; Подсвечивать активный уровень отступа (где сейчас курсор)
  (setq highlight-indent-guides-responsive 'slow))

;; Подсвечивать ключевые слова в комментариях
(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode) ; Включает подсветку во всех режимах программирования
  :config
  ;; Можно добавить свои слова или изменить цвета
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("NOTE"   . "#1E90FF")
          ("STUB"   . "#1E90FF"))))


;; Инициализация пакетов завершена
(when (not package--initialized)
  (package-initialize))

;; ^ Поправила нейросеть

;; Мои дополнения
(windmove-default-keybindings 'meta) ;; Переключалка окон через Alt
(setq windmove-wrap-around t)  ;; Когда справа (или слева) окна нет, переключит на крайнее левое (или правое). Так же работает и по вертикали

(setq-default indent-tabs-mode nil) ; Всегда вставлять пробелы вместо табуляции
(setq-default tab-width 2)          ; Ширина «виртуального» таба — 4 пробела

;; Бинд клавиш
(global-set-key (kbd "C-c t") 'term) ; Открыть терминал

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gruvbox-theme docker-compose-mode docker dockerfile-mode catppuccin-theme hl-todo treemacs yaml-mode with-editor vscode-dark-plus-theme use-package transient llama company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
