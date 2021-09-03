
![OIP](pictures/OIP.jpg)

émonstration simplifiée de l'utilisation de **.NET 5** de la containeurisation avec **docker** (containers Windows et Linux) et d'intégration continue d'une application Console avec **Github Action**

Si vous souhaitez tester le déploiement et l'intégration continue il vous faut :

- Un compte Azure : [Compte Gratuit](https://azure.microsoft.com/fr-fr/free/)
- Un compte Github : [Compte Gratuit](https://github.com/)


# Préparation du poste de developpement (Windows 10)

Cette config ce base sur un os Windows Version **10.0.19041.1165**, vous pouvez bien évidement utiliser d'autres OS.

1. Installez le sous système linux sur Windows (**WSL**). [Cliquez ici](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10) pour plus d'informations.

2. Installez le **Kit de développement .NET 5**. [Cliquez ici](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10) pour plus d'informations.

> **Remarque** : Si vous souhaitez **seulement tester sur linux**, vous pouvez n'installer que le runtime .NET 5 sous linux et non pas l'intégralité du SDK.
>
3. Installez **Visual Studio Code** : [Téléchargement](https://code.visualstudio.com/) (Optionnel)

4. Installez **Docker Desktop sur Windows**. [Cliquez ici](https://docs.docker.com/desktop/windows/install/) pour plus d'informations.

5. Installez l'outil **az cli**. [Cliquez ici](https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli-windows?tabs=azure-cli) pour plus d'informations.

6. Installez **Windows Terminal**. [Cliquez ici](https://docs.microsoft.com/fr-fr/windows/terminal/get-started) pour plus d'informations.


## Création d'une application console .NET 5

- Vérifiez la version de .NET : 
>dotnet --version 

>**5.0.400**
- Affichez les modèles disponibles : 
>dotnet new --list

![Modeles](pictures/Modeles.png)

- Créez l’application console :
> dotnet new console -f net5.0 -o app -n NetCore.Docker

- Ouvrez le code dans VS Code (ou dans tous autres éditeurs): 
> code  .

- Ouvrez le fichier program.cs et ajoutez les lignes suivantes : 
```CSHARP
Console.WriteLine(System.Environment.OSVersion);
Console.WriteLine("Entrez pour terminer le programme");
Console.Read();
```

- Build et Run de l’application : 
> dotnet run

Comme vous le voyez sur l'image suivante, l'application console .NET 5 tourne sur les deux OS.

![console](pictures/Console.png)


## Containeurisation d'une application console .NET 5

Par défaut lors de l'installation de Docker Desktop-> Container Linux,


[Images officielles Docker pour .NET ](https://docs.microsoft.com/fr-fr/dotnet/architecture/microservices/net-core-net-framework-containers/official-net-docker-images)

https://hub.docker.com/_/microsoft-dotnet-runtime/


https://hub.docker.com/_/microsoft-dotnet/?ref=login

docker run --it mcr.microsoft.com/windows/nanoserver:2004 cmd