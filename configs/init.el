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
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

;; Company-mode (автодополнение)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode) ;; Включить глобально после инициализации
  :config
  (add-to-list 'company-backends 'company-files) ;; Автодополнение файлов
  (setq company-minimum-prefix-length 1        ;; Начинать автодополнение с 1 символа
        company-idle-delay 0.3))               ;; Задержка перед показом подсказок

;; Yaml-mode
(use-package yaml-mode
    :ensure t
    :mode "\\.yml\\'\\|\\.yaml\\'")

;; Magit (Git)
;;(use-package magit
;;  :ensure t
  ;; Можно добавить горячую клавишу, например C-x g
  ;; :bind (("C-x g" . magit-status))
;; )

;; LSP Mode (раскомментируйте, когда будете готовы настраивать LSP)
;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp)
;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)

;; Инициализация пакетов завершена
(when (not package--initialized)
  (package-initialize))
