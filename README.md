## Disclaimer
The content of this repository is provided for educational purposes only.  

### Install Ansible 2.3.0.0

#### Fedora 25
`sudo dnf install -y --enablerepo updates-testing ansible`

#### Ubuntu
`sudo apt-get install python-pip python-dev -y`  
`sudo pip install markupsafe`  
`sudo pip install ansible==2.3.0.0`

### Install [pre-commit](http://pre-commit.com), [ansible-lint](https://github.com/willthames/ansible-lint) and Ansible roles
`make`

### Build AMI using Ansible
`AWS_PROFILE=fasten-dev AWS_REGION=eu-central-1 make amazon-linux`  
`AWS_PROFILE=fasten-dev AWS_REGION=eu-central-1 make ubuntu`  
> **Note:**
> you can use [AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY](http://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/credentials.html) instead of AWS_PROFILE.

[![asciicast](https://asciinema.org/a/96gh4rpxv8nze2mvha8p8hdo1.png)](https://asciinema.org/a/96gh4rpxv8nze2mvha8p8hdo1)

### Use built AMI
[![asciicast](https://asciinema.org/a/26gusfeiyw4yv3xpa37vpprc7.png)](https://asciinema.org/a/26gusfeiyw4yv3xpa37vpprc7)
