
![OIP](pictures/OIP.jpg)

Démonstration simplifiée de l'utilisation de **.NET 5** de la containeurisation avec **docker** (containers Windows et Linux) et d'intégration continue d'une application Console avec **Github Action**

Si vous souhaitez tester le déploiement et l'intégration continue il vous faut :

- Un compte Azure : [Compte Gratuit](https://azure.microsoft.com/fr-fr/free/)
- Un compte Github : [Compte Gratuit](https://github.com/)


# Préparation du poste de developpement (Windows 10)

Cette config se base sur un os Windows Version **10.0.19041.1165**, vous pouvez bien évidement utiliser d'autres OS.

1. Installez le sous système linux sur Windows (**WSL**). [Cliquez ici](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10) pour plus d'informations.

2. Installez le **Kit de développement .NET 5**. [Cliquez ici](https://docs.microsoft.com/fr-fr/dotnet/core/install/windows?tabs=net50) pour plus d'informations.

2. Installez **.NET sur linux**. [Cliquez ici](https://docs.microsoft.com/fr-fr/dotnet/core/install/linux)

> **Remarque** : Si vous souhaitez **seulement tester sur linux**, vous pouvez n'installer que le runtime .NET 5 sous linux et non pas l'intégralité du SDK.
>
3. Installez **Visual Studio Code** : [Téléchargement](https://code.visualstudio.com/) (Optionnel)

4. Installez **Docker Desktop sur Windows**. [Cliquez ici](https://docs.docker.com/desktop/windows/install/) pour plus d'informations.


5. Installez l'outil **az cli**. [Cliquez ici](https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli-windows?tabs=azure-cli) pour plus d'informations.

6. Installez **Windows Terminal**. [Cliquez ici](https://docs.microsoft.com/fr-fr/windows/terminal/get-started) pour plus d'informations.


## Création d'une application console .NET 5

- Vérification de la version de .NET : 
>dotnet --version 

>**5.0.400**

>dotnet --info


- Lister les modèles disponibles : 
>dotnet new --list

![Modeles](pictures/Modeles.png)

- Création de l’application console :

> dotnet new console -f net5.0 -o app -n DotNetAndDocker

Cette commande créée une application console net5 **DotNetAndDocker** dans le répertoire **app**

- Ouvrez le code dans VS Code (ou dans tout autres éditeurs):

> code  .

- Ouvrez le fichier **program.cs** et ajoutez les lignes suivantes :

    ```CSHARP
    Console.WriteLine(System.Environment.OSVersion);
    Console.WriteLine("Entrez pour terminer le programme");
    Console.Read();
    ```

- Build et Run de l’application :

> dotnet run

Cette commande permet de construire et exécuter l'application.

- Publier l'application console

> dotnet publish -c Release -o .\publier

Publie le binaire de l'application console dans le répertoire **publier**

- Exécuter l'application

> dotnet .\DotNetAndDocker.dll

Comme vous le voyez sur l'image suivante, l'application console .NET 5 tourne à la fois sur Windows mais aussi sur Linux à partir du même binaire.

![console](pictures/Console.png)
    
## Containeurisation d'une application console .NET 5

- Création du fichier Dockerfile.

    FROM mcr.microsoft.com/dotnet/runtime:5.0

    COPY /publier /app

    WORKDIR /app

    ENTRYPOINT [ "dotnet","DotNetAndDocker.dll" ]

- Construire l'image Docker

>docker build -t dotnetanddocker:v1 -f Dockerfile .

![DockerBuild](./pictures/DockerBuild.png)

>docker images

|REPOSITORY|TAG|IMAGE ID|       CREATED |        SIZE|
|--|--|--|--|--|
|dotnetanddocker |  v1     |   71457a3d3799|   2 minutes ago|   186MB|

- Exécuter l'application dans un container

> Docker run --rm -it dotnetanddocker:v1

![RunContainer](./pictures/RunContainer.png)

Comme vous le voyez ici l'application console tourne sur un container Docker Linux.

- 




[Images officielles Docker pour .NET ](https://docs.microsoft.com/fr-fr/dotnet/architecture/microservices/net-core-net-framework-containers/official-net-docker-images)

https://hub.docker.com/_/microsoft-dotnet-runtime/


https://hub.docker.com/_/microsoft-dotnet/?ref=login

docker run --it mcr.microsoft.com/windows/nanoserver:2004 cmd


Demo

https://docs.microsoft.com/en-us/dotnet/core/docker/build-container?tabs=windows