FROM mcr.microsoft.com/dotnet/aspnet:7.0

RUN mkdir /app
WORKDIR /app

COPY ./MyWebApp/bin/Release/net7.0/publish ./
COPY ./config.sh ./

RUN bash config.sh

EXPOSE 80
ENTRYPOINT ["dotnet", "MyWebApp.dll"]