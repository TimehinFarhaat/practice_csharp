FROM mcr.microsoft.com/dotnet/sdk:6.0 As build
WORKDIR /app
COPY . /app 
RUN dotnet restore
RUN dotnet build -c Release -o /app/build
RUN dotnet publish -c Release -o /app/publish
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Udemy_practice.dll"]

