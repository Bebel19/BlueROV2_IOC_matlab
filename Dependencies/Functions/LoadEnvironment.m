function env = LoadEnvironment(environmentName)
    load("Environments.mat",environmentName);
    env = eval('caller',environmentName);
end