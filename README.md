# Test image for JENKINS-62437 - Config tables migration to divs

![Docker Pulls](https://img.shields.io/docker/pulls/jenkins4eval/jenkins-62437-config-tables-to-divs)

A Docker image which can be used for evaluation and testing of the [JENKINS-62437](https://issues.jenkins-ci.org/browse/JENKINS-62437) project -
_Change Jenkins configuration UI from tables to divs_.

## Why?

We would like to make Jenkins usable by as many people as possible.
It includes multiple groups of users: people with disabilities, ones using mobile devices, or those with slow network connections.
In general, all Jenkins users would benefit from better navigation and layouts.

Currently Jenkins uses tables to generate its layout.
These tables do not work well on narrow screens including mobile devices.
We want to change that by replacing tables by divs which can be repositioned easily in the browser.

Such change in the core implies potential breaking changes in plugins which define their own configuration layouts and controls,
and there is a lot of testing needed.
Hence I have created this repository to simplify testing.

## Usage

You will need Docker and make to run this test environment.

1. Execute `make run` will run the Jenkins container with the default UI.
   See the commands for additional modes below.
2. Go to the `http://localhost:8080`.
3. Login with one of the user accounts (see below).
4. Try out the theme, submit a GitHub Issue to this repository if you discover any compatibility issues.

For advanced use-cases, please see the documentation in [oleg-nenashev/demo-jenkins-config-as-code](https://github.com/oleg-nenashev/demo-jenkins-config-as-code).

### Run modes

* `make run` - Runs Jenkins with the default UI
* `make run-preview` - Runs Jenkins with the experimental UI
* `make run-dark` - Runs Jenkins with the default UI and the [Dark Theme](https://github.com/jenkinsci/dark-theme)
* `make run-preview-dark` - Runs Jenkins with the experimental UI and the [Dark Theme](https://github.com/jenkinsci/dark-theme)

### User accounts

There are the following user accounts:

  * `admin/admin` - for a user with full administrative access
  * `readonly/readonly` - user with global read-only access (System Read, Extended Read for jobs and agents)
  * `manager/manager` - user with global Manage permissions
  * `user/user` - common Jenkins user with access to some jobs on the instance

## Building

Run `make build` to build the image locally.
