# Add a mac as a GitLab runner

## Overview

A guide for registering a specific runner for gitlab.com

1. Install GitLab Runner on macOS
2. Register GitLab Runner

## Get Started

### **1. Install GitLab Runner on macOS**

```bash
brew install gitlab-runner
```

### 2. Register GitLab Runner

 1. Register GitLab Runner as a service

```bash
brew services start gitlab-runner
```

 2. Go to gitlab.com -&gt; project settings -&gt; CI/CD and expand the **Runners** section

![Note the URL and registration token](../.gitbook/assets/ci_cd_settings_-_ci_cd_-_settings_-_zzff-learn___essential-developer-study-path_-_gitlab.png)

 3. Register the runner 

```text
gitlab-runner register
```

![](../.gitbook/assets/gitlab-runner-register-screenshot.png)

You will see the runner is registered successfully in the Runners section on gitlab.com:

![](../.gitbook/assets/screen_shot_2021-04-19_at_10_59_39_pm.png)

## References

* [Install GitLab Runner on macOS \| GitLab Documentation](https://gitlab.com/gitlab-org/gitlab-runner/blob/master/docs/install/osx.md)
* [Configuring runners in GitLab \| GitLab Documentation](https://docs.gitlab.com/ee/ci/runners/README.html#specific-runners)
* [Registering the runners \| GitLab Documentation](https://docs.gitlab.com/runner/register/#macos)



