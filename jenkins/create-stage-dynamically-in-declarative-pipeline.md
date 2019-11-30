# Create stage dynamically in declarative pipeline



```groovy
// in a declarative pipeline
stage('Trigger Building') {
  when {
    environment(name: 'DO_BUILD_PACKAGES', value: 'true')
  }
  steps {
    executeModuleScripts('build') // local method, see at the end of this script
  }
}


// at the end of the file or in a shared library
void executeModuleScripts(String operation) {

  def allModules = ['module1', 'module2', 'module3', 'module4', 'module11']

  allModules.each { module ->
    String action = "${operation}:${module}"
  
    echo("---- ${action.toUpperCase()} ----")
    String command = "npm run ${action} -ddd"
  
    // here is the trick
    script {
      stage(module) {
        bat(command)
      }
    }
  }
}
```

### References

* [https://stackoverflow.com/questions/42837066/can-i-create-dynamically-stages-in-a-jenkins-pipeline](https://stackoverflow.com/questions/42837066/can-i-create-dynamically-stages-in-a-jenkins-pipeline)

