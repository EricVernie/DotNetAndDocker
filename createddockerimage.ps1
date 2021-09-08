dotnet publish -c release ./app/dotnetanddocker.csproj -o ./app/publier

docker build -t dotnetanddocker:v1 -f ./app/Dockerfile .

Docker run --rm -it dotnetanddocker:v1