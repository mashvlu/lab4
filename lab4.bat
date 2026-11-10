@echo off
chcp 65001 >nul
echo отправка работы на GitHub 
set /p name=введите имя отправителя: 
set /p email=введите email отправителя:
set /p commit=введите сообщение коммита:

echo настройка автора..
git config user.name «%name%»
git config user.email «%email%»

echo добавление изменений..
git add -A

echo создание коммита..
git commit -m «%commit%»
if errorlevel 1 (
	echo ошибка при создании коммита!
	pause
	exit /b 1
)

echo отправление на GitHub..
git push
if errorlevel 1 (
	echo ошибка при отправке на GitHub!
	pause
	exit /b 1
)

echo успешно, отправлено!
pause