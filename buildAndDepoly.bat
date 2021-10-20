if "%~1" == "github" goto success
if "%~1" == "gitee" goto success
goto error
:success
rem build
cd public/%1
rm -rf *
cd ../../
hugo -e %1
rem depoly
cd public/%1
git add .
git commit --allow-empty-message -m ''
git push
cd ../../
goto end
:error
echo invalid environment argument
:end
