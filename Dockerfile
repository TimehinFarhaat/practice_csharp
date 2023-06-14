FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY *.sln ./
COPY OperatorOverloading/OperatorOverloading.csproj ./OperatorOverloading/
COPY StringIt/StringIt.csproj ./StringIt/
RUN dotnet restore
COPY . .
RUN dotnet build --configuration Release --no-restore
RUN dotnet publish --configuration Release --no-restore --output /app/publish
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "OperatorOverloading.dll"]


